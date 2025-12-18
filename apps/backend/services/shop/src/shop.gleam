import gleam/erlang/process

import gleam/http/request
import gleam/http/response
import gleam/bytes_tree

import wisp
import mist

pub fn main() {
  let assert Ok(_) =
    mist.new(
      // Handler function: takes a request and produces a response
      fn(request) {
        let body =
          { "Hello, " <> request.path <> "!" }
          |> bytes_tree.from_string
          |> mist.Bytes
        response.new(200) |> response.set_body(body)
      },
    )
    |> mist.port(3000)
    |> mist.start()

  // The server starts in a separate process, pause the main process
  process.sleep_forever()
}
