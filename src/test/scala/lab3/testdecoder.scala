package lab3
import org.scalatest._
import chiseltest._
import chisel3._
import chisel3.util._

class testdecoder extends FreeSpec with ChiselScalatestTester{
    "decode"  in {
     test (new decoder_with_valid()){ c =>
        c.io.in.poke("b10".U)




        c.io.out.valid.expect(1.B)
      
      
         
        c.clock.step(10)
        }
    }
}