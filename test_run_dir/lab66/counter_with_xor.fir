;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit counter_with_xor : 
  module counter_with_xor : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<3>}
    
    reg counter : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[task2.scala 10:27]
    node _count_buffer_T = bits(counter, 2, 2) @[task2.scala 14:42]
    node _count_buffer_T_1 = xor(UInt<1>("h01"), _count_buffer_T) @[task2.scala 14:33]
    node _count_buffer_T_2 = add(counter, UInt<1>("h01")) @[task2.scala 14:73]
    node _count_buffer_T_3 = tail(_count_buffer_T_2, 1) @[task2.scala 14:73]
    node count_buffer = mux(_count_buffer_T_1, _count_buffer_T_3, UInt<1>("h00")) @[task2.scala 14:27]
    counter <= count_buffer @[task2.scala 15:13]
    io.out <= counter @[task2.scala 16:12]
    
