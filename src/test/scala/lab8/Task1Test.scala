package lab8
import org.scalatest._
import chiseltest._
import chisel3._
class memory_assignment_Test extends FreeSpec with ChiselScalatestTester{
    "Arbitor Memory1" in  {
        test (new memory_assignment_1){c=>
        c.io.requestor(0).bits.poke(24.U)
       
        c.io.requestor(0).valid.poke(1.B)
        c.io.requestor(1).bits.poke(4.U)
        c.io.requestor(2).bits.poke(10.U)
        c.io.requestor(3).bits.poke(6.U)
        // c.io.memory_out.ready.poke(1.B)
        c.io.requestor(1).valid.poke(1.B)
        c.io.requestor(2).valid.poke(1.B)
        c.io.requestor(3).valid.poke(1.B)
        c.io.Readaddr.poke(8.U)
        c.io.Writeaddr.poke(8.U)
        c.io.enable.poke(1.B)
        // c.io.out.valid.poke(1.B)
        // c.io.in.poke(0.B)
        //c.io.up_down.poke(1.B)
        c.clock.step(40)}}}