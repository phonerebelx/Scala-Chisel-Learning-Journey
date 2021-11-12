;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Mux_Module : 
  module Mux_Module : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in1 : UInt<32>, flip in2 : UInt<32>, out : UInt<32>, flip sel : UInt<1>}
    
    node _io_out_T = mux(io.sel, io.in1, io.in2) @[para_Mux.scala 13:17]
    io.out <= _io_out_T @[para_Mux.scala 13:11]
    
