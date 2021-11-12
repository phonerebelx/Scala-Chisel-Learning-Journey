circuit up_down_counter :
  module up_down_counter :
    input clock : Clock
    input reset : UInt<1>
    input io_up_down : UInt<1>
    output io_out : SInt<4>

    reg counter : SInt<5>, clock with :
      reset => (UInt<1>("h0"), counter) @[Task4.scala 13:23]
    node _T = eq(io_up_down, UInt<1>("h1")) @[Task4.scala 14:17]
    node _counter_T = add(counter, asSInt(UInt<2>("h1"))) @[Task4.scala 15:24]
    node _counter_T_1 = tail(_counter_T, 1) @[Task4.scala 15:24]
    node _counter_T_2 = asSInt(_counter_T_1) @[Task4.scala 15:24]
    node _T_1 = eq(counter, asSInt(UInt<1>("h0"))) @[Task4.scala 16:19]
    node _T_2 = eq(io_up_down, UInt<1>("h0")) @[Task4.scala 18:22]
    node _counter_T_3 = sub(counter, asSInt(UInt<2>("h1"))) @[Task4.scala 19:24]
    node _counter_T_4 = tail(_counter_T_3, 1) @[Task4.scala 19:24]
    node _counter_T_5 = asSInt(_counter_T_4) @[Task4.scala 19:24]
    node _GEN_0 = mux(_T_2, _counter_T_5, asSInt(UInt<5>("ha"))) @[Task4.scala 18:30 Task4.scala 19:13 Task4.scala 22:13]
    node _GEN_1 = mux(_T_1, asSInt(UInt<1>("h0")), _GEN_0) @[Task4.scala 16:27 Task4.scala 17:13]
    node _GEN_2 = mux(_T, _counter_T_2, _GEN_1) @[Task4.scala 14:25 Task4.scala 15:13]
    io_out <= asSInt(bits(counter, 3, 0)) @[Task4.scala 24:8]
    counter <= mux(reset, asSInt(UInt<5>("ha")), _GEN_2) @[Task4.scala 13:23 Task4.scala 13:23]
