package lab4
import chisel3 . _
import chisel3 . util
import org . scalatest . _
import chiseltest . _
import chiseltest . experimental . TestOptionBuilder . _
import chiseltest . internal . VerilatorBackendAnnotation
import scala . util . Random

class ImmGentest extends FreeSpec with ChiselScalatestTester {
    "Imm.Gen " in {
        test ( new Extender ) { c =>
        // IMM operations
            val array_ins = Array ( 53478035,5251619,239)
            for ( i <- 0 until 4) {
                // println(s"***$i****")
                val opr_ins = 0//Random . nextInt(3)
                val src_ins = array_ins(opr_ins)

                val src_pc = 0 
                val result = src_ins match {
                    case 53478035 => 51
                    case 5251619 => 4
                    case 239 => 0
                }
            
             

                c.io.Instruction. poke ( src_ins.S)
                c . io . PC. poke ( src_pc . S)    
                c . clock . step (1)
                c . io . out . expect ( result.S )
                
            }
            c . clock . step (200)
        }
    }
}
