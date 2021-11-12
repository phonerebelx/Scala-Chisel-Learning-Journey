package lab3
import chisel3._
import chisel3.util._
// import ALUOP ._
trait Configs {
// word length configuration parameter
val WLEN = 32
// ALU operation control signal width

}

class extend_for extends Bundle with Configs {

val  extender = Input(UInt(32 .W))
val opcod = Input(UInt(7.W))

val out = Output(UInt(32.W))

 

}
class bitextend extends Module with Config {
val io = IO (new extend_for )
val const = (0.U(1.W)) 

val ex_1 = "b1111111111111111111".U
val ex_0 = "b0000000000000000000".U


io.out := ex_1

switch(io.opcod){
    is ("b0001101".U){
        val out1 = io.extender(31,20)
        val ex_t= Mux(io.extender(31),Cat(ex_1,io.extender(31)),Cat(ex_0,io.extender(31)))
        io.out := Cat(ex_t,out1)
    }
    is ("b0100011".U){
        val out1 = io.extender(11,7)
        val out2 = io.extender(31,25)
        val ex_t= Mux(io.extender(31),Cat(ex_1,io.extender(31)),Cat(ex_0,io.extender(31)))
        val out3 = Cat(out2,out1)
        io.out := Cat(ex_t,out3)
    }
    is ("b1100011".U){
        val out1 = io.extender(7)
        val out2 = io.extender(11,8)
        val out3 = io.extender(30,25)
        val ex_t = Mux(io.extender(31),Cat(ex_1,io.extender(31)),Cat(ex_0,io.extender(31)))
        val out4 =  Cat(Cat(ex_t,out3),Cat(out2,const))
        io.out := out4
        
    
    }
    is ("b1100111".U){
        val out1 = io.extender(19,12)
        val out2 = io.extender(20)
        val out3 = io.extender(21)
        val out4 = io.extender(30,22)
        val ex_t = Mux(io.extender(31),Cat(ex_1,io.extender(31)),Cat(ex_0,io.extender(31)))

        val out5 = Cat(Cat(ex_t,Cat(Cat(out1,out2),Cat(out4,out3))),const)
        io.out := out5



    }
    
}


}