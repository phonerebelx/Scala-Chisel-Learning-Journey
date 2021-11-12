package lab5
import chisel3 . _
import chisel3 . util . _
// import chisel3 . iotesters .{ ChiselFlatSpec , Driver , PeekPokeTester }

class DataPacket [T<:Data](generic:T) extends Bundle{
    val databits = generic
    val addressbits = UInt(5.W)
}
class Router extends Module {
    val io = IO ( new Bundle {
        val in = Input(new DataPacket(UInt(32.W))) 
        val out = Output (in)    
    })
    
    io.out := io.in
}