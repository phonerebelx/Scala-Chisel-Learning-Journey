package lab6
import org.scalatest._
import chiseltest._
import chisel3._
class shift_register_Test extends FreeSpec with ChiselScalatestTester{
    "lab66" in  {
        test (new shift_register){c=>
        c.io.in.poke(8.U)
        c.clock.step(200)}}}