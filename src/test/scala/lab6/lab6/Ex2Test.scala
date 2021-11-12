package lab6
import org.scalatest._
import chiseltest._
import chisel3._

class CounterTest extends FreeSpec with ChiselScalatestTester{
    "lab6" in  {
        test (new counter(32)){c=>
        // c.io.in.poke(0.B)
        c.clock.step(200)

        
         
}}}