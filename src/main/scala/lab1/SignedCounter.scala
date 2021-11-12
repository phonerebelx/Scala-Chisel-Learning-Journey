package lab1
import chisel3 . _
class Signed_Counter ( counterBits : UInt ) extends Module {
    val io = IO ( new Bundle {
    val result = Output ( Bool () )
    })
    val max1 = (1.U << counterBits ) - 1.U
    val max = max1.asSInt
    val count = RegInit (0.S (16.W ) )
    
    when ( count === max ) {
    count := 0.S
    } .otherwise {
    count := count + 1.S
    }
    io . result := count (0.U)
    // println ( s"counter created with max value $max " )
    }
