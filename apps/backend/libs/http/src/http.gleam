import middlewares
import types

pub fn apply_middlewares(
  req: types.HttpRequest(connection),
  handle_request: types.Handler(connection, body),
) -> types.HttpResponse(body) {
  // // Permit browsers to simulate methods other than GET and POST using the
  // // `_method` query parameter.
  // let req = wisp.method_override(req)

  // Log information about the request and response.
  // use req <- middlewares.log_request(req)

  // // Return a default 500 response if the request handler crashes.
  // use <- wisp.rescue_crashes

  // // Rewrite HEAD requests to GET requests and return an empty body.
  // use req <- wisp.handle_head(req)

  // // Known-header based CSRF protection for non-HEAD/GET requests
  // use req <- wisp.csrf_known_header_protection(req)

  middlewares.log_request(req, handle_request)
}
