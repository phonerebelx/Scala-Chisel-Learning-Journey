circuit counter_with_xor :
  module counter_with_xor :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<3>

    reg counter : UInt<3>, clock with :
      reset => (UInt<1>("h0"), counter) @[task2.scala 10:27]
    node _count_buffer_T = bits(counter, 2, 2) @[task2.scala 14:42]
    node _count_buffer_T_1 = xor(UInt<1>("h1"), _count_buffer_T) @[task2.scala 14:33]
    node _count_buffer_T_2 = add(counter, UInt<1>("h1")) @[task2.scala 14:73]
    node _count_buffer_T_3 = tail(_count_buffer_T_2, 1) @[task2.scala 14:73]
    node count_buffer = mux(_count_buffer_T_1, _count_buffer_T_3, UInt<1>("h0")) @[task2.scala 14:27]
    io_out <= counter @[task2.scala 16:12]
    counter <= mux(reset, UInt<3>("h0"), count_buffer) @[task2.scala 10:27 task2.scala 10:27 task2.scala 15:13]
