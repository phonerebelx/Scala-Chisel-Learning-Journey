circuit gen_counter :
  module gen_counter :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    reg counter1 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), counter1) @[ex3Counter.scala 10:29]
    node counter1_signed = asUInt(asSInt(UInt<4>("h7"))) @[ex3Counter.scala 11:29]
    node _counter1_T = eq(counter1, counter1_signed) @[ex3Counter.scala 12:22]
    node _counter1_count_T = add(counter1, UInt<1>("h1")) @[ex3Counter.scala 16:28]
    node _counter1_count_T_1 = tail(_counter1_count_T, 1) @[ex3Counter.scala 16:28]
    node _GEN_0 = mux(_counter1_T, UInt<1>("h0"), _counter1_count_T_1) @[ex3Counter.scala 12:35 ex3Counter.scala 13:19 ex3Counter.scala 16:19]
    node _io_result_T = bits(counter1, 2, 2) @[ex3Counter.scala 22:29]
    io_result <= _io_result_T @[ex3Counter.scala 22:17]
    counter1 <= mux(reset, UInt<3>("h0"), _GEN_0) @[ex3Counter.scala 10:29 ex3Counter.scala 10:29]
