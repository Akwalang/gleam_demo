import gleam/erlang

import wisp/internal/random_string

pub fn generate_trace_id() -> String {
  random_string.ulid()
}

pub fn set(id: String) {
  erlang.put("trace_id", id)
}

pub fn get() -> Option(String) {
  erlang.get("trace_id")
}
