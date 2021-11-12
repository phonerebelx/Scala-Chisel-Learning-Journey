package lab6
import org.scalatest._
import chiseltest._
import chisel3._
class counter_with_xor_test extends FreeSpec with ChiselScalatestTester{
    "lab66" in  {
        test (new counter_with_xor){c=>
        // c.io.in.poke(0.B)
        c.clock.step(200)}}}