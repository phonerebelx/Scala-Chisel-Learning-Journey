package lab8
import org.scalatest._
import chiseltest._
import chisel3._

class doForwardingTest extends FreeSpec with ChiselScalatestTester{
    "Mem1 lab8" in  {
        test (new doForwarding){c=>
        // c.io.enable.poke(1.B)
        c.io.write.poke(1.B)
        c.io.Raddrs.poke(101.U)
        c.io.Waddrs.poke(101.U)

       
        c.io.dataIn.poke(554.U)

        c.clock.step(50)
        }
    }
}