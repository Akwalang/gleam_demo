import gleam/io

import date
import stl

pub type Logger {
  Logger(component: String)
}

pub fn new(name: String) -> Logger {
  Logger(name)
}

fn write(
  logger: Logger,
  level: String,
  message: String,
  time_color: String,
  message_color: String,
) -> Nil {
  let Logger(component) = logger

  io.println(
    level <> " " <> time_color <>
    "[" <> date.now() <> "] " <> stl.reset <>
    stl.purple <> stl.italic <> component <> ": " <> stl.reset <>
    message_color <> message <> stl.reset
  )
}

pub fn dbg(logger: Logger, message: String) -> Nil {
  write(logger, stl.bg_gray <> stl.black <> " DBG " <> stl.reset, message, stl.gray, stl.gray)
}

pub fn log(logger: Logger, message: String) -> Nil {
  write(logger, stl.bg_blue <> stl.black <> " LOG " <> stl.reset, message, stl.blue, stl.white)
}

pub fn warn(logger: Logger, message: String) -> Nil {
  write(logger, stl.bg_yellow <> stl.black <> " WRN " <> stl.reset, message, stl.yellow, stl.yellow)
}

pub fn error(logger: Logger, message: String) -> Nil {
  write(logger, stl.bg_red <> stl.black <> " ERR " <> stl.reset, message, stl.red, stl.red)
}
