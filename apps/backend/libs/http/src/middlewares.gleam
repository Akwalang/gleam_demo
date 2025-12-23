import infra
import types

pub fn log_request(
  req: types.HttpRequest(connection),
  next: types.Handler(connection, body),
) -> types.HttpResponse(body) {
  let logger = infra.new("Request")

  infra.log(logger, "Incoming request")
  // infra.log(logger, "Incoming request: " <> request.get_path(req))

  let res = next(req)

  infra.log(logger, "Response sent")
  // infra.log(logger, "Response sent for: " <> request.get_path(req))

  res
}
