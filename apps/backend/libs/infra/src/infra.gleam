import gleam/io
import gleam/option.{None, Some}

import tracer

import date
import stl

pub type Logger {
  Logger(component: String)
}

pub fn new(name: String) -> Logger {
  Logger(name)
}

fn get_trace_id() -> String {
  case tracer.get() {
    None -> ""
    Some(id) -> id <> " | "
  }
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
    get_trace_id() <>
    stl.purple <> stl.italic <> component <> ": " <> stl.reset <>
    message_color <> message <> stl.reset
  )
}

pub fn dbg(logger: Logger, message: String) -> Nil {
  write(logger, stl.bg_gray <> stl.white <> " DBG " <> stl.reset, message, stl.gray, stl.gray)
}

pub fn log(logger: Logger, message: String) -> Nil {
  write(logger, stl.bg_blue <> stl.white <> " LOG " <> stl.reset, message, stl.blue, stl.white)
}

pub fn warn(logger: Logger, message: String) -> Nil {
  write(logger, stl.bg_yellow <> stl.white <> " WRN " <> stl.reset, message, stl.yellow, stl.yellow)
}

pub fn error(logger: Logger, message: String) -> Nil {
  write(logger, stl.bg_red <> stl.white <> " ERR " <> stl.reset, message, stl.red, stl.red)
}
