import gleam/http/request
import gleam/http/response
import gleam/bit_array

pub type HttpRequest(connection) = request.Request(connection)
pub type HttpResponse(body) = response.Response(body)

pub type Handler(connection, body) = fn(HttpRequest(connection)) -> HttpResponse(body)
