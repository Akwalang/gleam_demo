import gleam/http

import infra
import types

pub fn log_request(
  req: types.HttpRequest(connection),
  next: types.Handler(connection, body),
) -> types.HttpResponse(body) {
  let logger = infra.new("Request")

  let method = method_to_string(req.method)
  let path = req.path

  infra.log(logger, "Income: " <> method <> ": " <> path)

  let res = next(req)

  infra.log(logger, "Outcome: " <> method <> ": " <> path)

  res
}

fn method_to_string(method: http.Method) -> String {
  case method {
    http.Get -> "GET"
    http.Post -> "POST"
    http.Head -> "HEAD"
    http.Put -> "PUT"
    http.Delete -> "DELETE"
    http.Trace -> "TRACE"
    http.Connect -> "CONNECT"
    http.Options -> "OPTIONS"
    http.Patch -> "PATCH"
    http.Other(str) -> str
  }
}
