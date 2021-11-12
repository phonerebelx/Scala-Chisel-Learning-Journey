;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit gen_counter : 
  module gen_counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {result : UInt<1>}
    
    reg counter1 : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[ex3Counter.scala 10:29]
    node counter1_signed = asUInt(asSInt(UInt<4>("h07"))) @[ex3Counter.scala 11:29]
    node _counter1_T = eq(counter1, counter1_signed) @[ex3Counter.scala 12:22]
    when _counter1_T : @[ex3Counter.scala 12:35]
      counter1 <= UInt<1>("h00") @[ex3Counter.scala 13:19]
      skip @[ex3Counter.scala 12:35]
    else : @[ex3Counter.scala 15:20]
      node _counter1_count_T = add(counter1, UInt<1>("h01")) @[ex3Counter.scala 16:28]
      node _counter1_count_T_1 = tail(_counter1_count_T, 1) @[ex3Counter.scala 16:28]
      counter1 <= _counter1_count_T_1 @[ex3Counter.scala 16:19]
      skip @[ex3Counter.scala 15:20]
    node _io_result_T = bits(counter1, 2, 2) @[ex3Counter.scala 22:29]
    io.result <= _io_result_T @[ex3Counter.scala 22:17]
    
