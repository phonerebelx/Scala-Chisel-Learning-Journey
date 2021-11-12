;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit up_down_counter : 
  module up_down_counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip up_down : UInt<1>, out : SInt<4>}
    
    reg counter : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h0a")))) @[Task4.scala 13:23]
    node _T = eq(io.up_down, UInt<1>("h01")) @[Task4.scala 14:17]
    when _T : @[Task4.scala 14:25]
      node _counter_T = add(counter, asSInt(UInt<2>("h01"))) @[Task4.scala 15:24]
      node _counter_T_1 = tail(_counter_T, 1) @[Task4.scala 15:24]
      node _counter_T_2 = asSInt(_counter_T_1) @[Task4.scala 15:24]
      counter <= _counter_T_2 @[Task4.scala 15:13]
      skip @[Task4.scala 14:25]
    else : @[Task4.scala 16:27]
      node _T_1 = eq(counter, asSInt(UInt<1>("h00"))) @[Task4.scala 16:19]
      when _T_1 : @[Task4.scala 16:27]
        counter <= asSInt(UInt<1>("h00")) @[Task4.scala 17:13]
        skip @[Task4.scala 16:27]
      else : @[Task4.scala 18:30]
        node _T_2 = eq(io.up_down, UInt<1>("h00")) @[Task4.scala 18:22]
        when _T_2 : @[Task4.scala 18:30]
          node _counter_T_3 = sub(counter, asSInt(UInt<2>("h01"))) @[Task4.scala 19:24]
          node _counter_T_4 = tail(_counter_T_3, 1) @[Task4.scala 19:24]
          node _counter_T_5 = asSInt(_counter_T_4) @[Task4.scala 19:24]
          counter <= _counter_T_5 @[Task4.scala 19:13]
          skip @[Task4.scala 18:30]
        else : @[Task4.scala 21:11]
          counter <= asSInt(UInt<5>("h0a")) @[Task4.scala 22:13]
          skip @[Task4.scala 21:11]
    io.out <= counter @[Task4.scala 24:8]
    
