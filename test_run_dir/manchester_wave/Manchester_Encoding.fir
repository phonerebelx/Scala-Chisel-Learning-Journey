;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Manchester_Encoding : 
  module Manchester_Encoding : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, flip start : UInt<1>, out : UInt<8>}
    
    reg state : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Task2.scala 13:20]
    reg waveReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Task2.scala 14:21]
    io.out <= UInt<1>("h00") @[Task2.scala 15:8]
    node _T = eq(UInt<1>("h00"), state) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      when io.start : @[Task2.scala 18:24]
        state <= UInt<1>("h01") @[Task2.scala 19:19]
        skip @[Task2.scala 18:24]
      else : @[Task2.scala 21:20]
        io.out <= waveReg @[Task2.scala 22:20]
        skip @[Task2.scala 21:20]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<1>("h01"), state) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        node _T_2 = eq(io.start, UInt<1>("h00")) @[Task2.scala 26:14]
        when _T_2 : @[Task2.scala 26:24]
          state <= UInt<1>("h00") @[Task2.scala 27:19]
          skip @[Task2.scala 26:24]
        else : @[Task2.scala 28:20]
          node _waveReg_T = shl(waveReg, 1) @[Task2.scala 30:33]
          node _waveReg_T_1 = or(_waveReg_T, io.in) @[Task2.scala 30:39]
          waveReg <= _waveReg_T_1 @[Task2.scala 30:21]
          io.out <= waveReg @[Task2.scala 31:20]
          skip @[Task2.scala 28:20]
        skip @[Conditional.scala 39:67]
    
