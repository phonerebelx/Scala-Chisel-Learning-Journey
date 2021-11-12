circuit counter_up_down :
  module counter_up_down :
    input clock : Clock
    input reset : UInt<1>
    input io_data_in : UInt<8>
    input io_reload : UInt<1>
    output io_out : UInt<1>
    output io_out2 : UInt<8>

    reg counter : UInt<8>, clock with :
      reset => (UInt<1>("h0"), counter) @[UpDownCounter.scala 13:27]
    reg max_count : UInt<8>, clock with :
      reset => (UInt<1>("h0"), max_count) @[UpDownCounter.scala 14:29]
    reg flag : UInt<1>, clock with :
      reset => (UInt<1>("h0"), flag) @[UpDownCounter.scala 15:24]
    node _T = eq(counter, UInt<1>("h0")) @[UpDownCounter.scala 17:19]
    node _T_1 = eq(counter, max_count) @[UpDownCounter.scala 20:23]
    node _GEN_0 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[UpDownCounter.scala 20:37 UpDownCounter.scala 21:16 UpDownCounter.scala 16:12]
    node _GEN_1 = mux(_T, UInt<1>("h1"), _GEN_0) @[UpDownCounter.scala 17:27 UpDownCounter.scala 18:16]
    node _T_2 = sub(max_count, UInt<1>("h1")) @[UpDownCounter.scala 23:31]
    node _T_3 = tail(_T_2, 1) @[UpDownCounter.scala 23:31]
    node _T_4 = neq(counter, _T_3) @[UpDownCounter.scala 23:18]
    node _T_5 = eq(flag, UInt<1>("h0")) @[UpDownCounter.scala 23:44]
    node _T_6 = and(_T_4, _T_5) @[UpDownCounter.scala 23:36]
    node _counter_T = add(counter, UInt<1>("h1")) @[UpDownCounter.scala 25:28]
    node _counter_T_1 = tail(_counter_T, 1) @[UpDownCounter.scala 25:28]
    node _T_7 = eq(flag, UInt<1>("h1")) @[UpDownCounter.scala 28:21]
    node _counter_T_2 = sub(counter, UInt<1>("h1")) @[UpDownCounter.scala 30:28]
    node _counter_T_3 = tail(_counter_T_2, 1) @[UpDownCounter.scala 30:28]
    node _T_8 = eq(counter, UInt<1>("h0")) @[UpDownCounter.scala 31:21]
    node _GEN_2 = mux(_T_8, UInt<1>("h0"), _counter_T_3) @[UpDownCounter.scala 31:28 UpDownCounter.scala 33:21 UpDownCounter.scala 30:17]
    node _GEN_3 = mux(_T_8, UInt<1>("h0"), flag) @[UpDownCounter.scala 31:28 UpDownCounter.scala 35:18 UpDownCounter.scala 15:24]
    node _counter_T_4 = add(counter, UInt<1>("h1")) @[UpDownCounter.scala 39:28]
    node _counter_T_5 = tail(_counter_T_4, 1) @[UpDownCounter.scala 39:28]
    node _GEN_4 = mux(_T_7, _GEN_2, _counter_T_5) @[UpDownCounter.scala 28:29 UpDownCounter.scala 39:17]
    node _GEN_5 = mux(_T_7, _GEN_3, UInt<1>("h1")) @[UpDownCounter.scala 28:29 UpDownCounter.scala 40:14]
    node _GEN_6 = mux(_T_6, _counter_T_1, _GEN_4) @[UpDownCounter.scala 23:52 UpDownCounter.scala 25:17]
    node _GEN_7 = mux(_T_6, flag, _GEN_5) @[UpDownCounter.scala 23:52 UpDownCounter.scala 15:24]
    io_out <= _GEN_1
    io_out2 <= counter @[UpDownCounter.scala 43:13]
    counter <= mux(reset, UInt<8>("h0"), _GEN_6) @[UpDownCounter.scala 13:27 UpDownCounter.scala 13:27]
    max_count <= mux(reset, UInt<8>("h6"), max_count) @[UpDownCounter.scala 14:29 UpDownCounter.scala 14:29 UpDownCounter.scala 14:29]
    flag <= mux(reset, UInt<1>("h0"), _GEN_7) @[UpDownCounter.scala 15:24 UpDownCounter.scala 15:24]
