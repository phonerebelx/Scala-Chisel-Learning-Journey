package lab3
import org.scalatest._
import chiseltest._
import chisel3._

class encodertest extends FreeSpec with ChiselScalatestTester{
    "encode" in  {
        test (new Encoder4to2){ c =>
        c.io.in.poke("b0001".U )
           
        // c.io.out(1).expect(1.B)
        c.clock.step(10)
        }
    }
}