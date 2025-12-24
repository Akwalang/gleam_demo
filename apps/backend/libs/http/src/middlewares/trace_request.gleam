import tracer
import types

pub fn trace_request(
  req: types.HttpRequest(connection),
  next: types.Handler(connection, body),
) -> types.HttpResponse(body) {
  tracer.set(tracer.generate_trace_id())

  next(req)
}
