package lab1
import org.scalatest._
import chisel3._
import chiseltest._

class CountTest1 extends FreeSpec with ChiselScalatestTester{
    "CounterTest test" in {
        test(new Signed_Counter(3.U)){ c=>
            c.clock.step(20)
            
         
           
        }
    }
}
