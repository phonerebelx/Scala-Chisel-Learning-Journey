package lab3
import org.scalatest._
import chiseltest._
import chisel3._

class branchtest extends FreeSpec with ChiselScalatestTester{
    "ALU" in {
        test(new ALUI){ c=>
        c.io.in_A.poke(41.U)
        c.io.in_B.poke(9.U)
        c.io.alu_Op.poke("b0100".U)
        // c.io.mem_write.poke(0.B)
        // c.io.mem_to_reg.poke(0.B)
        // c.io.branch.poke(1.B)

       
        c.clock.step(20)
        
}}
}
