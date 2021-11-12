package lab5
import org.scalatest._
import chiseltest._
import chisel3._
import scala.util.Random

class Mux_PAra_Test extends FreeSpec with ChiselScalatestTester{
    "Muxpara" in {
        test (new Mux_Module){ c=>
        // for (i<-0 until 50){
        // val src_a = Random.nextLong()& 0xFFFFFFFFL
        // val src_b = Random.nextLong()& 0xFFFFFFFFL
        // val aluop = Random.nextInt(9)
        c.io.in1.poke(25.U)
        c.io.in2.poke(35.U)
        c.io.sel.poke(1.B)
        // c.clock.step(1)
        // c.io.sel.poke(1.U)
        // }
        // c.clock.step(50)
        
}}
}

