package lab1
import chisel3 . _
import scala.language.postfixOps;
class gen_counter ( size : Int , maxValue : SInt ) extends Module {
    val io = IO ( new Bundle {
        val result = Output ( Bool () )
    })
    // ' genCounter ' with counter size 'n '
    def genCounter ( n : Int , max : SInt ) = {
        val count = RegInit (0. U ( n . W ) )
        val signed = (max) .asUInt
        when ( count === signed ) {
            count := 0. U
        } 
        .otherwise {
            count := count + 1. U
            }
        count
        }
    // genCounter instantiation
    val counter1 = genCounter ( size , maxValue )
    io . result := counter1 (size -1)
    }