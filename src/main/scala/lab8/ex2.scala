package lab8
import chisel3 . _
import chisel3 .util. _
class doForwarding extends Module {
    val width : Int = 32
    val io = IO ( new Bundle {
        val write = Input ( Bool () )
        val Raddrs = Input ( UInt (10. W ) )
        val Waddrs = Input ( UInt (10. W ) )
        val dataIn = Input (UInt ( width . W )) 
        val dataOut = Output (UInt ( width . W )) 
    })
    val memory = SyncReadMem (32 , UInt ( width . W ) )
    val wrDataReg = RegNext ( io .dataIn)
    val doForwardReg = RegNext ( io.Raddrs === io .Waddrs && io .write )
    val memData = memory . read ( io . Raddrs )
    when ( io .write)
    {
    memory . write ( io . Waddrs , io .dataIn)
    }
    io .dataOut := Mux ( doForwardReg , wrDataReg , memData )

}