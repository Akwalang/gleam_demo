import gleam/string
import gleam/int

const chars = "0123456789abcdefghijklmnopqrstuvwxyz"
const length = 36

fn generate_loop(acc: String, len: Int) -> String {
  case len {
    0 -> acc
    _ -> {
      let index = int.random(length) - 1

      generate_loop(acc <> string.slice(chars, index, 1), len - 1)
    }
  }
}

pub fn generate(len: Int) -> String {
  generate_loop("", len)
}
