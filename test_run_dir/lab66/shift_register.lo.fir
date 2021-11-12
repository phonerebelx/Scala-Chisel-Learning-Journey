circuit shift_register :
  module shift_register :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<4>

    reg state : UInt<4>, clock with :
      reset => (UInt<1>("h0"), state) @[Ex1.scala 8:21]
    io_out <= state @[Ex1.scala 12:10]
    state <= mux(reset, UInt<4>("h1"), io_in) @[Ex1.scala 8:21 Ex1.scala 8:21 Ex1.scala 11:7]
