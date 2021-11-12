package lab8
import org.scalatest._
import chiseltest._
import chisel3._

class memorytest extends FreeSpec with ChiselScalatestTester{
    "Mem1 lab8" in  {
        test (new InstMem("/home/phonerebelx/scala-chisel-learning-journey/src/main/scala")){c=>
        c.io.addr.poke(1.U)
        // c.io.inst.expect(1049235.U)
        c.clock.step(50)
        }
    }
}
