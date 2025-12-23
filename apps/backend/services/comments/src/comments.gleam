
import gleam/io
import infra

pub fn main() -> Nil {
  let logger = infra.new("Comments service")

  infra.dbg(logger, "Comments service started")
  infra.log(logger, "Comments service started")
  infra.warn(logger, "Comments service started")
  infra.error(logger, "Comments service started")

  io.println("Hello from comments!")
}
