package lab6
import chisel3 . _
import chisel3 . util . _


class shift_reg_with_parallel_load (val len : Int = 4, max : Int = 5 ,min : Int = 0 ) extends Module {
val io = IO (new Bundle {
val out = Vec ( len , Output ( Bool () ) )
val load_in = Vec ( len , Input ( Bool () ) )
val in = Input ( Bool () )
val load = Input ( Bool () )
})

val mux1 = Mux(io.load,io.load_in(0),io.in)
val mux2 = Mux(io.load,io.load_in(1),mux1)
val mux3 = Mux(io.load,io.load_in(2),mux2)
val mux4 = Mux(io.load,io.load_in(3),mux3)
val reg_1 =  RegInit ( min . U ( log2Ceil ( max ) . W ) )
val reg_2 = RegInit ( min . U ( log2Ceil ( max ) . W ) )
val reg_3 = RegInit( min . U ( log2Ceil ( max ) . W ) )
val reg_4 = RegInit( min . U ( log2Ceil ( max ) . W ) )
reg_1 := mux1
reg_2 := mux2
reg_3 := mux3
reg_4 := mux4
io.out(0) := reg_1
io.out(1) := reg_2
io.out(2) := reg_3
io.out(3) := reg_4
 // Start Coding here
// End your code here
// Well , you can actually write classes too . So , technically you have no
// limit ; )
}