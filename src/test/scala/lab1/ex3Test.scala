package lab1

import org.scalatest._
import chiseltest._
import chisel3._

class gen_counterTest extends FreeSpec with ChiselScalatestTester{
    "Ex 3" in {
        test(new gen_counter(3 , 7.S)){ c=>
        c.clock.step(20)
        
        }
    }
}