package lab4
import chisel3 . _
import chisel3 . util
import org . scalatest . _
import chiseltest . _
import chiseltest . experimental . TestOptionBuilder . _
import chiseltest . internal . VerilatorBackendAnnotation
import scala . util . Random
import BALUOP._

class BranchCtrltest extends FreeSpec with ChiselScalatestTester {
    "Branching " in {
        test ( new BranchCtrl ) { c =>
        // Branch operations
            val array_op = Array ( BEQ , BNE , BLT, BGE, BLTU )
            for ( i <- 0 until 100) {
                // println(s"***$i****")
                val src_a = Random . nextLong () & 0xFFFFFFFFL
                val src_b = Random . nextLong () & 0xFFFFFFFFL
                val opr = Random . nextInt (5)
                val aluop = array_op ( opr )
                val brc = Random . nextInt (2)

                val result = aluop match {
                    case BEQ => if ( src_a . toInt == src_b . toInt )
                                            1
                                else
                                            0
                    case BNE => if ( src_a . toInt != src_b . toInt )
                                            1
                                else
                                            0
                    case BLT => if ( src_a . toInt < src_b . toInt )
                                            1
                                else
                                            0
                    case BGE => if ( src_a . toInt > src_b . toInt || src_a . toInt == src_b . toInt)
                                            1
                                else
                                            0
                    case BLTU => if ( src_a < src_b)
                                            1
                                else
                                            0

                    case _ => 0

                }
                val brn = if (result ==1 & brc == 1)
                                        1
                else 
                                        0
                
                c . io . a . poke ( src_a . S )
                c . io . b . poke ( src_b . S )
                c . io . sel. poke ( aluop )
                c . io . branch. poke ( brc.B )
                c . clock . step (1)
               c . io . br_taken . expect ( brn.B )
                c . io . out . expect ( result.S )
                
            }
            c . clock . step (200)
        }
    }
}
