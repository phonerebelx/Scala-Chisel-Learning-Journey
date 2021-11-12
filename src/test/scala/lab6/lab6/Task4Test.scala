package lab6
import org.scalatest._
import chiseltest._
import chisel3._
class up_down_counter_Test extends FreeSpec with ChiselScalatestTester{
    "lab6task4" in  {
        test (new up_down_counter){c=>
        // c.io.in.poke(0.B)
        c.io.up_down.poke(1.B)
        c.clock.step(40)
        }
    }
}