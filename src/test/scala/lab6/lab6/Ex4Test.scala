package lab6
import org.scalatest._
import chiseltest._
import chisel3._
class My_Queue_Test extends FreeSpec with ChiselScalatestTester{
    "lab6task4" in  {
        test (new My_Queue){c=>
        c.io.in0.bits.poke(24.U)
        c.io.out.ready.poke(1.B)
        c.io.in0.valid.poke(1.B)
        // c.io.out.valid.poke(1.B)
        // c.io.in.poke(0.B)
        //c.io.up_down.poke(1.B)
        c.clock.step(40)}}} 
