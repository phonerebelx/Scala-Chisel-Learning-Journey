
package lab6
import org.scalatest._
import chiseltest._
import chisel3._
class shift_reg_with_parallel_load_Test extends FreeSpec with ChiselScalatestTester{
    "lab66" in  {
        test (new shift_reg_with_parallel_load){c=>
        // c.io.in.poke(0.B)
        c.io.load_in(0).poke(0.B)
        c.io.load_in(1).poke(1.B)
        c.io.load_in(2).poke(1.B)
        c.io.load_in(3).poke(0.B)
        c.io.in.poke(0.B)
        c.io.load.poke(1.B)
        c.clock.step(200)}}}