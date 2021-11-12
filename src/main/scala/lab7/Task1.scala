package lab7
import chisel3 . _
import chisel3 . util . _
// import chisel3 . iotesters .{
// ChiselFlatSpec , Driver , PeekPokeTester
// // }
class My_State_Machine extends Module {
val io = IO (new Bundle {
val f1 = Input ( Bool () )
val f2 = Input ( Bool () )
val r1 = Input ( Bool () )
val r2 = Input ( Bool () )
val out = Output (UInt(8.W) )
})
val s0 :: s1 :: s2  :: s3 :: s4 :: s5 :: Nil = Enum (6) // Enumeration type

val state = RegInit ( s0 ) 
io.out := 0.U
switch(state){
    is (s0){
        when (!io.f1 & !io.f2){
            state := s0
        }
        .elsewhen(io.f1){
            state:=s1
        }
        .otherwise{
            state:=s5 
        }

    }
    is (s1){
        when(!io.r1 & !io.f1){
            state := s1
        }
        .elsewhen(io.r1){
            state := s0
        }
        .otherwise{
            state :=s2
        }
    }
    is(s2){
        when(!io.r1 & !io.f1){
            state := s2
            io.out := 3.U
        }
        .elsewhen(io.r1){
            state := s1
            io.out := 3.U
        }
         .otherwise{
            state :=s3
            io.out := 3.U
        }

    }
    is (s3){
        state := s0
    }
    is (s4){
        when(!io.r2 & !io.f2){
            state := s4
            io.out := 7.U
        }.elsewhen(io.r2){
            state :=s5
            io.out := 7.U
        }.otherwise{
            state := s3
            io.out := 7.U
        }}
    is(s5){
        when(!io.r2 & !io.f2){
            state := s5
        }.elsewhen(io.f2){
            state:=s4

        }.elsewhen(io.r2){
            state:=s4

        }
        }
    

}
}