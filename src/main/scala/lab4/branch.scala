package lab4
import chisel3 . _
import chisel3 . util . _
class BranchControl extends Bundle {
    val sel= Input ( UInt (5. W ) )
    val branch= Input ( Bool () )
    val a= Input ( SInt (32. W ) )
    val b= Input ( SInt (32. W ) )
    val out= Output ( SInt (32. W ) )
    val br_taken = Output ( Bool () )
}

object BALUOP {
    val BEQ = 16.U(5.W)
    val BNE = 17.U(5.W)
    val BLT = 20.U(5.W)
    val BGE = 21.U(5.W)
    val BLTU= 22.U(5.W)
 
}
class BranchCtrl extends Module {
    val io = IO ( new BranchControl )
    // Start Coding here
    io.out := 0.S
    switch(io.sel){
        //BEQ
        is(16.U){
            when(io.a === io.b){
                io.out:= 1.S
            }.otherwise{
                io.out:=0.S
            }
        }
        //bne
        is(17.U){
            when(io.a =/= io.b){
                io.out:= 1.S
            }.otherwise{
                io.out:=0.S
            }
        }
        //blt
        is(20.U){
            when(io.a < io.b){
                io.out:= 1.S
            }.otherwise{
                io.out:=0.S
            }
        }
        //bge
        is(21.U){
            when(io.a >= io.b){
                io.out:= 1.S
            }.otherwise{
                io.out:=0.S
            }
        }
        //bltu
        is(22.U){
            when(io.a.asUInt < io.b.asUInt){
                io.out:= 1.S
            }.otherwise{
                io.out:=0.S
            }
        }

    }
    when (io.out === 1.S & io.sel(4,3) === "b10".U & io.branch === 1.B){
        io.br_taken := 1.B
    }.otherwise{
        io.br_taken := 0.B
    }
// End your code here
}
