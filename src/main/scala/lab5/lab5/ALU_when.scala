package lab5
import chisel3 . _
import chisel3 . util . _
// import chisel3 . iotesters .{ Driver , PeekPokeTester }
class ALU ( width_parameter : Int ) extends Module {
val io = IO ( new IO_Interface ( width_parameter ) )
io . alu_out := 0. U
val index = log2Ceil ( width_parameter )
//AND
when(io.alu_oper === 0.U){
    io . alu_out := io . arg_x & io . arg_y
}
//OR
.elsewhen(io.alu_oper === 1.U){
    io . alu_out := io . arg_x | io . arg_y
}
 // ADD
 .elsewhen(io.alu_oper === 2.U){
    io . alu_out := io . arg_x + io . arg_y
 }

// SUB
.elsewhen(io.alu_oper === 6.U){
    io . alu_out := io . arg_x - io . arg_y
}
 // XOR
 .elsewhen(io.alu_oper === 3.U){
    io . alu_out := io . arg_x ^ io . arg_y

 }
// SLL
.elsewhen(io.alu_oper === 4.U){
    io . alu_out := io . arg_x << io . arg_y ( 4, 0)
} // SRL
.elsewhen(io.alu_oper === 5.U){
    io . alu_out := io . arg_x >> io . arg_y (4,0)
}
 // SRA
.elsewhen(io.alu_oper=== 7.U){
    io . alu_out := ( io . arg_x . asSInt >> io . arg_y (4 , 0) ) . asUInt
}
 // SLT
 .elsewhen (io.alu_oper === 8.U){
     io . alu_out := (io . arg_x . asSInt < io . arg_y . asSInt).asUInt
 }
// SLTU
.elsewhen(io.alu_oper === 9.U){
    io . alu_out := io . arg_x < io . arg_y
}

}


class IO_Interface ( width : Int ) extends Bundle {
val alu_oper = Input ( UInt ( 5 . W ) )
val arg_x = Input ( UInt ( width . W ) )
val arg_y = Input ( UInt ( width . W ) )
val alu_out = Output ( UInt ( width . W ) )
}
