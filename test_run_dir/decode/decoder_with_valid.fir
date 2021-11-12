;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit decoder_with_valid : 
  module decoder_with_valid : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<2>, out : {valid : UInt<1>, bits : UInt<4>}}
    
    io.out.bits <= UInt<3>("h04") @[decoder.scala 10:23]
    io.out.valid <= UInt<1>("h01") @[decoder.scala 11:22]
    node _T = eq(UInt<1>("h00"), io.in) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      io.out.bits <= UInt<1>("h01") @[decoder.scala 14:29]
      io.out.valid <= UInt<1>("h00") @[decoder.scala 15:22]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<1>("h01"), io.in) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        io.out.bits <= UInt<2>("h02") @[decoder.scala 18:23]
        io.out.valid <= UInt<1>("h01") @[decoder.scala 19:22]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_2 = eq(UInt<2>("h02"), io.in) @[Conditional.scala 37:30]
        when _T_2 : @[Conditional.scala 39:67]
          io.out.bits <= UInt<2>("h03") @[decoder.scala 22:23]
          io.out.valid <= UInt<1>("h01") @[decoder.scala 23:22]
          skip @[Conditional.scala 39:67]
    
