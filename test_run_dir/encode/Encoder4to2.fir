;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Encoder4to2 : 
  module Encoder4to2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<2>}
    
    io.out <= UInt<2>("h03") @[encoder.scala 13:8]
    node _T = eq(UInt<1>("h01"), io.in) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      io.out <= UInt<1>("h00") @[encoder.scala 16:16]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<2>("h02"), io.in) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        io.out <= UInt<1>("h01") @[encoder.scala 19:18]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_2 = eq(UInt<3>("h04"), io.in) @[Conditional.scala 37:30]
        when _T_2 : @[Conditional.scala 39:67]
          io.out <= UInt<2>("h02") @[encoder.scala 23:16]
          skip @[Conditional.scala 39:67]
    
