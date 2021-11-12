package lab3
import org.scalatest._
import chiseltest._
import chisel3._

class bitextendertest extends FreeSpec with ChiselScalatestTester{
    "BitExtender" in {
        test (new bitextend){ c =>
        c.io.extender.poke(5.U)
        c.io.opcod.poke("b1100011".U)
        c.clock.step(20)
        
}}
}