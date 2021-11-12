package lab6
import chisel3 . _
class shift_register ( val init : Int = 1) extends Module {
val io = IO (new Bundle {
val in = Input ( UInt (4. W ) )
val out = Output ( UInt (4. W ) )
})
val state = RegInit ( init . U (4. W ) ) // register initialization
// serial data in at LSB

state := io.in
io . out := state
}