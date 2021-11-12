package lab1
import org.scalatest._
import chisel3._
import chiseltest._

class CountTest extends FreeSpec with ChiselScalatestTester{
    "CounterTest test" in {
        test(new Counter(3.U)){ c=>
            c.clock.step(20)
            
         
           
        }
    }
}
