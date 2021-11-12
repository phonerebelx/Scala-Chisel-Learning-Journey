;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit counter : 
  module counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<5>, out1 : UInt<1>}
    
    io.out1 <= UInt<1>("h01") @[Ex2.scala 10:8]
    reg counter : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[Ex2.scala 11:23]
    node _count_buffer_T = eq(counter, UInt<6>("h020")) @[Ex2.scala 14:33]
    node _count_buffer_T_1 = add(counter, UInt<1>("h01")) @[Ex2.scala 14:63]
    node _count_buffer_T_2 = tail(_count_buffer_T_1, 1) @[Ex2.scala 14:63]
    node count_buffer = mux(_count_buffer_T, UInt<1>("h00"), _count_buffer_T_2) @[Ex2.scala 14:23]
    counter <= count_buffer @[Ex2.scala 15:9]
    io.out <= counter @[Ex2.scala 16:10]
    
