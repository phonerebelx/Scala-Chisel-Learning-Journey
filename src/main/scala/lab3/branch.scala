package lab3
import chisel3._
import chisel3.util._

trait Configss {
// word length configuration parameter
val WLEN = 32
// ALU operation control signal width
val ALUOP_SIG_LEN = 4
}

class ALUIOI extends Bundle with Configss {
val in_A = Input(UInt(WLEN.W))
val in_B = Input(UInt(WLEN.W))
val alu_Op = Input(UInt(4.W))
val out = Output(UInt(WLEN.W))
}

class ALUI extends Module with Configss {
val io = IO (new ALUIOI )
val sltt = io.in_A < io.in_B
val BEQ = io.in_A === io.in_B
val b_bGE = io.in_A > io.in_B
val BGE = b_bGE | BEQ
val BNE = ~BEQ

io.out := BGE
switch ( io.alu_Op(2,0) ) {
    is ("b000".U){
        io.out := BEQ
    } 
    is ("b001".U){
        
        io.out := BNE
    }
    is ("b100".U){
        
        io.out := sltt
    }
    is ("b101".U){
        io.out := BGE   
    }
    is ("b110".U){
        io.out := sltt

    }
}
}