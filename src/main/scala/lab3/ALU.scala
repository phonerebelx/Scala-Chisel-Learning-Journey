package lab3
import chisel3._
import chisel3.util._
// import ALUOP ._
trait Config {
// word length configuration parameter
val WLEN = 32
// ALU operation control signal width
val ALUOP_SIG_LEN = 4
}

class ALUIO extends Bundle with Config {
val in_A = Input(UInt(WLEN.W))
val in_B = Input(UInt(WLEN.W))
val alu_Op = Input(UInt(4.W))
val out = Output(UInt(WLEN.W))
val sum = Output(UInt(WLEN.W))
val mem_write = Input(Bool())
val mem_to_reg = Input(Bool())
val branch = Input(Bool())

}
class ALU extends Module with Config {
val io = IO (new ALUIO )
val sum = io.in_A + Mux( io.alu_Op (3) , -io.in_B , io.in_B )
val Branches = io.branch
val andd = io.in_A & io.in_B
val orr = io.in_A | io.in_B
val xorr = io.in_A ^ io.in_B    
val slll = io.in_A << io.in_B(4,0)
val sltt = io.in_A < io.in_B
val sr = io.in_A >> io.in_B(4,0)
val mem_writes = io.mem_write
val mem_to_regs = io.mem_to_reg
val BEQ = io.in_A === io.in_B
val b_bGE = io.in_A > io.in_B
val BGE = b_bGE | BEQ
val BNE = ~BEQ

io.sum := sum
io.out := Mux(Branches,BGE,andd)
switch ( io.alu_Op(2,0) ) {
    is ("b000".U){
        io.out := Mux(Branches,BEQ,io.sum)
    } 
    is ("b001".U){
        // io.out := slll
        io.out := Mux(Branches,BNE,slll)
    }
    is ("b010".U){
        // io.out := sltt
        // val ful_mux = Mux()
        io.out := Mux(mem_writes,io.in_A + io.in_B,Mux(mem_to_regs,io.in_A + io.in_B,sltt))
    }
    is ("b011".U){
        io.out := sltt
    }
    is ("b100".U){
        // io.out := xorr
        io.out := Mux(Branches,sltt,xorr)
    }
    is ("b101".U){
        io.out := Mux(Branches,BGE,sr)
        // io.out := sr
    }
    is ("b110".U){
        // io.out := orr
        io.out := Mux(Branches,sltt,orr)

    }
}
}

