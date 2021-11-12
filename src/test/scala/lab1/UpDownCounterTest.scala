package lab1
import org.scalatest._
import chisel3._
import chiseltest._

class CountTest2 extends FreeSpec with ChiselScalatestTester{
    "c ounter_up_down test" in {
        test(new counter_up_down(8)){c=>
            c.clock.step(20)
            
         
           
        }
    }
}
