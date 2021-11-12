package lab8
import org.scalatest._
import chiseltest._
import chisel3._

class WMaskedReadWriteSmemtest extends FreeSpec with ChiselScalatestTester{
    "Mem1 lab8" in  {
        test (new WMaskedReadWriteSmem){c=>
        c.io.enable.poke(1.B)
        c.io.write.poke(1.B)
        c.io.addr.poke(10.U)
        c.io.mask.poke(0.U)
       
        c.io.dataIn.poke(554.U)

        c.clock.step(50)
        }
    }
}