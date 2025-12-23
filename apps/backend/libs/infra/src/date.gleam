import gleam/erlang/atom
import gleam/int

@external(erlang, "erlang", "system_time")
fn system_time(unit: atom) -> Int

@external(erlang, "calendar", "system_time_to_universal_time")
fn system_time_to_utc(
  time: Int,
  unit: atom,
) -> #(#(Int, Int, Int), #(Int, Int, Int))

pub type DateTimeMs {
  DateTimeMs(
    year: Int,
    month: Int,
    day: Int,
    hour: Int,
    minute: Int,
    second: Int,
    millisecond: Int,
  )
}

pub fn utc_now_ms() -> DateTimeMs {
  let ts_ms = system_time(atom.create("millisecond"))

  let seconds = ts_ms / 1000
  let millis = ts_ms % 1000

  let #(#(y, m, d), #(h, min, s)) =
    system_time_to_utc(
      seconds,
      atom.create("second"),
    )

  DateTimeMs(
    year: y,
    month: m,
    day: d,
    hour: h,
    minute: min,
    second: s,
    millisecond: millis,
  )
}

fn pad2(value: Int) -> String {
  case value {
    v if v < 10 -> "0" <> int.to_string(v)
    _ -> int.to_string(value)
  }
}

fn pad3(value: Int) -> String {
  case value {
    v if v < 10 -> "00" <> int.to_string(v)
    v if v < 100 -> "0" <> int.to_string(v)
    _ -> int.to_string(value)
  }
}

pub fn now() -> String {
  let time = utc_now_ms()

  let year = int.to_string(time.year)
  let month = pad2(time.month)
  let day = pad2(time.day)

  let hour = pad2(time.hour)
  let minute = pad2(time.minute)
  let second = pad2(time.second)
  let millisecond = pad3(time.millisecond)

  year <> "." <> month <> "." <> day
  <> " "
  <> hour <> ":" <> minute <> ":" <> second
  <> "." <> millisecond
}
