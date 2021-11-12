package lab4
import chisel3 . _
import chisel3 . util
import org . scalatest . _
import chiseltest . _
import chiseltest . experimental . TestOptionBuilder . _
import chiseltest . internal . VerilatorBackendAnnotation
import scala . util . Random
import ALUOP._

class Test_ALU extends FreeSpec with ChiselScalatestTester {
    "ALU__Test" in {
        test ( new ALU ) { c =>
        // ALU operations
            val array_op = Array ( ALU_ADD , ALU_SUB , ALU_AND , ALU_OR , ALU_XOR , ALU_SLT ,
            ALU_SLL , ALU_SRL , ALU_SRA )
            for ( i <- 0 until 100) {
                // println(s"i=>$i")
                val src_a = Random . nextLong () & 0xFFFFFFFFL
                val src_b = Random . nextLong () & 0xFFFFFFFFL
                val opr =Random.nextInt(9)
                val aluop = array_op ( opr )
                // println(s"aluop=>$aluop")
                // println(s"srcA=>$src_a*")

                // println(s"srcB=>$src_b")
                val result = aluop match {
                    case ALU_ADD => src_a + src_b
                    case ALU_SLL => src_a << ( src_b & 0x1F )
                    case ALU_SLT => if (src_a < src_b) 1  else 0
                    case ALU_SRA => src_a >> ( src_b & 0x1F )
                    case ALU_XOR => src_a ^ src_b
                    case ALU_SRL => src_a >> ( src_b & 0x1F )
                    case ALU_OR => src_a | src_b
                    case ALU_AND => src_a & src_b
                    case ALU_SUB => src_a - src_b
                    case ALU_SLTU => if (src_a < src_b) 1  else 0
                    // case ALU_SRA => src_a . toInt >> ( src_b & 0x1F )
                    // case ALU_COPY_A => src_a
                    // case ALU_COPY_B => src_b
                    // case _ => 0
                }
                // println(s"result=>$result")
                // println(s"opr=>$opr")
                val result1 : BigInt = if ( result < 0)
                    ( BigInt(0xFFFFFFFFL ) + result +1 ) & 0xFFFFFFFFL
                
                else (result & 0xFFFFFFFFL)

                   // println(s"srcA=>$src_a*")

                // println(s"srcB=>$src_b")
                // println(s"***$aluop****")
                
                 println(s"result1=>$result1")
                

                    c . io . in_1 . poke ( src_a . U )
                    c . io . in_2 . poke ( src_b . U )
                    c . io . select . poke ( aluop )
                    c . clock . step (1)
                    c . io . output . expect ( result1.U )
                
            }
            c . clock . step (200)
        }
    }
}
