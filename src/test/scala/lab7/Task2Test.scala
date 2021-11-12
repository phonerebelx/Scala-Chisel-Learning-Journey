package lab7
import org.scalatest._
import chiseltest._
import chisel3._
class lab7Task2Test extends FreeSpec with ChiselScalatestTester{
    "manchester wave" in  {
        test (new Manchester_Encoding){c=>
        c.io.in.poke(1.U)
        c.io.start.poke(1.B)
         c.clock.step(5)
        c.io.in.poke(0.U)
        c.io.start.poke(1.B)
         c.clock.step(6)
        // c.io.in.poke(0.B)
        //  c.clock.step(7)
        // c.io.in.poke(1.B)
        // c.io.r1.poke(1.B)
        // c.io.r2.poke(1.B)
        // c.io.out.valid(1.B)
        // c.io.data_in(0).poke(8.U)
        // c.io.data_in(1).poke(6.U)
        // c.io.data_in(2).poke(2.U)
        // c.io.data_in(3).poke(9.U)
        // c.io.data_selector.poke(3.U)
        // c.io.addr.poke(5.U)
        // c.io.wr_en.poke(1.B)
        
        // c.io.out.expect(0.B)
        c.clock.step(200)}}}