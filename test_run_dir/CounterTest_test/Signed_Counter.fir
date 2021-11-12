;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Signed_Counter : 
  module Signed_Counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {result : UInt<1>}
    
    node _max1_T = dshl(UInt<1>("h01"), UInt<2>("h03")) @[SignedCounter.scala 7:21]
    node _max1_T_1 = sub(_max1_T, UInt<1>("h01")) @[SignedCounter.scala 7:38]
    node max1 = tail(_max1_T_1, 1) @[SignedCounter.scala 7:38]
    node max = asSInt(max1) @[SignedCounter.scala 8:20]
    reg count : SInt<16>, clock with : (reset => (reset, asSInt(UInt<16>("h00")))) @[SignedCounter.scala 9:25]
    node _T = eq(count, max) @[SignedCounter.scala 11:18]
    when _T : @[SignedCounter.scala 11:28]
      count <= asSInt(UInt<1>("h00")) @[SignedCounter.scala 12:11]
      skip @[SignedCounter.scala 11:28]
    else : @[SignedCounter.scala 13:18]
      node _count_T = add(count, asSInt(UInt<2>("h01"))) @[SignedCounter.scala 14:20]
      node _count_T_1 = tail(_count_T, 1) @[SignedCounter.scala 14:20]
      node _count_T_2 = asSInt(_count_T_1) @[SignedCounter.scala 14:20]
      count <= _count_T_2 @[SignedCounter.scala 14:11]
      skip @[SignedCounter.scala 13:18]
    node _io_result_T = dshr(count, UInt<1>("h00")) @[SignedCounter.scala 16:26]
    node _io_result_T_1 = bits(_io_result_T, 0, 0) @[SignedCounter.scala 16:26]
    io.result <= _io_result_T_1 @[SignedCounter.scala 16:17]
    
