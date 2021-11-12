package lab8
import chisel3._
import chisel3.util._

class memory_assignment_1 extends Module {
    val io = IO (new Bundle {
    val memory_out = Decoupled( UInt (32. W ) )
    val requestor = Vec(4,Flipped(Decoupled ( UInt (32. W ) ) )) 
    val enable = Input(Bool())
    val Readaddr = Input ( UInt (5. W ) )
    val Writeaddr = Input ( UInt (5. W ) )
    })
    val Memory = Mem (32 , UInt (32. W ) )
    val queue0 = Queue (io.requestor(0),4)
    val queue1 = Queue (io.requestor(1),4)
    val queue2 = Queue (io.requestor(2),4)
    val queue3 = Queue (io.requestor(3),4)
    queue0.nodeq()
    queue1.nodeq()
    queue2.nodeq()
    queue3.nodeq()
    
    io.memory_out.valid:=1.B   
    val arbi = Module (new Arbiter(UInt(),2))
 
    // io.memory_out := Memory.read(io.Readaddr)
    arbi.io.in(1)<>queue1
    arbi.io.in(0)<>queue0
    arbi.io.in(1)<>queue2
    arbi.io.in(1)<>queue3
    arbi.io.out.ready :=1.B
    when(io.enable){
    Memory.write(io.Writeaddr,(arbi.io.out).asUInt)
    }
    
    io.memory_out.bits := Memory.read(io.Readaddr)
}