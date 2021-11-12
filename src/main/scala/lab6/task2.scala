package lab6
import chisel3 . _
import chisel3 . util . _
class counter_with_xor( val max : Int = 5 ,min : Int = 0) extends Module {
val io = IO (new Bundle {
    
    val out = Output(UInt((log2Ceil(max).W ) ) )
})
// 
    val counter = RegInit ( min . U ( log2Ceil ( max ) . W ) )

    
    
    val count_buffer = Mux((1.B ^ counter((log2Ceil ( max )-1))),counter+1.U,min.U)
    counter := count_buffer
    io.out := counter

}