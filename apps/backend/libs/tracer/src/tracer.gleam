import gleam/erlang/atom
import gleam/option.{type Option, None, Some}

import rnd

@external(erlang, "erlang", "put")
fn erlang_put(key: atom, value: a) -> a

@external(erlang, "erlang", "get")
fn erlang_get(key: atom) -> a

pub fn generate_trace_id() -> String {
  rnd.generate(10)
}

pub fn set(id: String) {
  let _ = erlang_put(atom.create("trace_id"), id)

  Nil
}

pub fn get() -> Option(String) {
  case erlang_get(atom.create("trace_id")) {
    "undefined" -> None
    value -> Some(value)
  }
}
