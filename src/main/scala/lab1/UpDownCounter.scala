package lab1
import chisel3 . _
import chisel3 . util . _
import java . io . File
class counter_up_down(n:Int ) extends Module {
    val io = IO ( new Bundle {
    val data_in = Input ( UInt( n.W ) )
    val reload = Input ( Bool() )
    val out = Output (UInt())
    val out2 = Output(UInt())
    })

    val counter = RegInit (0.U ( n.W ) )
    val max_count = RegInit (6.U ( n.W ) )
    var flag = RegInit (0.U )
    io.out := 0.U
    when (counter === 0.U){
        io.out := 1.U
    }
    .elsewhen(counter === max_count){
        io.out := 1.U
    }
    when(counter =/= max_count-1.U && flag === 0.U){
        
        counter := counter + 1.U
        
        
    }.elsewhen(flag === 1.U){
        
        counter := counter - 1.U
        when(counter===0.U){
            
            counter := 0.U
            // io.out := 1.U
            flag := 0.U
            
        }
    }.otherwise{
        counter := counter + 1.U
        flag :=  1.U
    
    }
    io.out2 := counter
// 

    }