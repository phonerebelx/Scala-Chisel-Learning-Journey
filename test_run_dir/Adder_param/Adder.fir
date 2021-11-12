;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Adder : 
  module Adder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_0 : UInt<32>, flip in_1 : UInt<32>, sum2 : UInt<32>}
    
    node _io_sum2_T = add(io.in_0, io.in_1) @[Para_Adder.scala 13:22]
    node _io_sum2_T_1 = tail(_io_sum2_T, 1) @[Para_Adder.scala 13:22]
    io.sum2 <= _io_sum2_T_1 @[Para_Adder.scala 13:11]
    
