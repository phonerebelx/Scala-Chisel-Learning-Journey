circuit Mux_Module :
  module Mux_Module :
    input clock : Clock
    input reset : UInt<1>
    input io_in1 : UInt<32>
    input io_in2 : UInt<32>
    output io_out : UInt<32>
    input io_sel : UInt<1>

    node _io_out_T = mux(io_sel, io_in1, io_in2) @[para_Mux.scala 13:17]
    io_out <= _io_out_T @[para_Mux.scala 13:11]
