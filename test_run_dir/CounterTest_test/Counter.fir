;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Counter : 
  module Counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {result : UInt<1>}
    
    node _max_T = dshl(UInt<1>("h01"), UInt<2>("h03")) @[ResetCounter.scala 7:20]
    node _max_T_1 = sub(_max_T, UInt<1>("h01")) @[ResetCounter.scala 7:37]
    node max = tail(_max_T_1, 1) @[ResetCounter.scala 7:37]
    reg count : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[ResetCounter.scala 8:25]
    node _T = dshr(count, UInt<4>("h0f")) @[ResetCounter.scala 9:17]
    node _T_1 = bits(_T, 0, 0) @[ResetCounter.scala 9:17]
    node _T_2 = eq(_T_1, UInt<1>("h01")) @[ResetCounter.scala 9:24]
    when _T_2 : @[ResetCounter.scala 9:36]
      count <= UInt<1>("h00") @[ResetCounter.scala 10:11]
      skip @[ResetCounter.scala 9:36]
    else : @[ResetCounter.scala 11:18]
      node _count_T = add(count, UInt<1>("h01")) @[ResetCounter.scala 12:20]
      node _count_T_1 = tail(_count_T, 1) @[ResetCounter.scala 12:20]
      count <= _count_T_1 @[ResetCounter.scala 12:11]
      skip @[ResetCounter.scala 11:18]
    node _io_result_T = dshr(count, UInt<4>("h0f")) @[ResetCounter.scala 14:26]
    node _io_result_T_1 = bits(_io_result_T, 0, 0) @[ResetCounter.scala 14:26]
    io.result <= _io_result_T_1 @[ResetCounter.scala 14:17]
    
