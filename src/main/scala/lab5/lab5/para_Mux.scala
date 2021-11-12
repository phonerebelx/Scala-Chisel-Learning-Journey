package lab5	
import chisel3 . _
import chisel3 . util . _

class Mux_Bundle [ T <: Data ]( gen : T ) extends Bundle{
    val in1 =  Input (gen)
    val in2 =  Input (gen)
    val out = Output(gen)
    val sel =Input(Bool())
}
class Mux_Module extends Module{
    val io = IO(new Mux_Bundle(UInt(32.W)))
    io.out:=Mux (io.sel,io.in1,io.in2)
}
