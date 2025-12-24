import gleam/erlang/process

import wisp
import wisp/wisp_mist

import mist

import http

fn handle_request(req: wisp.Request) -> wisp.Response {
  use _ <- http.apply_middlewares(req)

  let body = "<h1>Hello, Joe!</h1>"
  wisp.html_response(body, 200)
}

pub fn main() {
  wisp.configure_logger()

  let secret_key_base = wisp.random_string(64)

  let assert Ok(_) =
    wisp_mist.handler(handle_request, secret_key_base)
    |> mist.new
    |> mist.port(3000)
    |> mist.start

  process.sleep_forever()
}
