package lab3
import org.scalatest._
import chiseltest._
import chisel3._

class ALUtest extends FreeSpec with ChiselScalatestTester{
    "ALU" in {
        test(new ALU){ c=>
        c.io.in_A.poke(41.U)
        c.io.in_B.poke(9.U)
        c.io.alu_Op.poke("b0100".U)
        c.io.mem_write.poke(0.B)
        c.io.mem_to_reg.poke(0.B)
        c.io.branch.poke(1.B)
        // c.io.alu_Op.poke("b0000".U)
        // c.io.out.poke(0.U)
        // c.io.sum.poke(0.U)

        // c.io.a.poke(256.U)
        // c.io.sel.poke(3.U)
        // c.io.shifter.poke(1.B)
        // c.io.out.(0.U)
       
        c.clock.step(20)
        
}}
}
