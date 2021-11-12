circuit counter :
  module counter :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<5>
    output io_out1 : UInt<1>

    reg counter : UInt<5>, clock with :
      reset => (UInt<1>("h0"), counter) @[Ex2.scala 11:23]
    node _count_buffer_T = eq(counter, UInt<6>("h20")) @[Ex2.scala 14:33]
    node _count_buffer_T_1 = add(counter, UInt<1>("h1")) @[Ex2.scala 14:63]
    node _count_buffer_T_2 = tail(_count_buffer_T_1, 1) @[Ex2.scala 14:63]
    node count_buffer = mux(_count_buffer_T, UInt<1>("h0"), _count_buffer_T_2) @[Ex2.scala 14:23]
    io_out <= counter @[Ex2.scala 16:10]
    io_out1 <= UInt<1>("h1") @[Ex2.scala 10:8]
    counter <= mux(reset, UInt<5>("h0"), count_buffer) @[Ex2.scala 11:23 Ex2.scala 11:23 Ex2.scala 15:9]
