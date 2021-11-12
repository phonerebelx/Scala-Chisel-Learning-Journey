circuit Adder :
  module Adder :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<32>
    input io_in_1 : UInt<32>
    output io_sum2 : UInt<32>

    node _io_sum2_T = add(io_in_0, io_in_1) @[Para_Adder.scala 13:22]
    node _io_sum2_T_1 = tail(_io_sum2_T, 1) @[Para_Adder.scala 13:22]
    io_sum2 <= _io_sum2_T_1 @[Para_Adder.scala 13:11]
