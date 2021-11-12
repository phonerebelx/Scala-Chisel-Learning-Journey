package lab6
import chisel3 . _
import chisel3 . util . _

class My_Queue extends Module {
    val io = IO ( new Bundle {
        val in0 = Flipped ( Decoupled ( UInt (8. W ) ) ) // valid = Input , ready = Output , bits = Input

        val out = Decoupled ( UInt (8. W ) )   // valid = Output , ready =Input , bits = Output
    })

    val queue0 = Queue (io.in0)
    val queue1 = Queue (queue0)
    queue0.nodeq()
    queue1.nodeq()
    io.out.bits:=0.U
    io.out.valid:=0.U
    io.out.valid (1.B)
    switch ( queue1.valid && io.out.ready){
       is(1.B) {
        io.out.enq(queue1.deq())
    }}

}