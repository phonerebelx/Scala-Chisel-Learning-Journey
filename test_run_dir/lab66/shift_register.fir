;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit shift_register : 
  module shift_register : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h01"))) @[Ex1.scala 8:21]
    state <= io.in @[Ex1.scala 11:7]
    io.out <= state @[Ex1.scala 12:10]
    
