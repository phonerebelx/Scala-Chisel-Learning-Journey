circuit Counter :
  module Counter :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    node _max_T = dshl(UInt<1>("h1"), UInt<2>("h3")) @[ResetCounter.scala 7:20]
    node _max_T_1 = sub(_max_T, UInt<1>("h1")) @[ResetCounter.scala 7:37]
    node max = tail(_max_T_1, 1) @[ResetCounter.scala 7:37]
    reg count : UInt<16>, clock with :
      reset => (UInt<1>("h0"), count) @[ResetCounter.scala 8:25]
    node _T = dshr(count, UInt<4>("hf")) @[ResetCounter.scala 9:17]
    node _T_1 = bits(_T, 0, 0) @[ResetCounter.scala 9:17]
    node _T_2 = eq(_T_1, UInt<1>("h1")) @[ResetCounter.scala 9:24]
    node _count_T = add(count, UInt<1>("h1")) @[ResetCounter.scala 12:20]
    node _count_T_1 = tail(_count_T, 1) @[ResetCounter.scala 12:20]
    node _GEN_0 = mux(_T_2, UInt<1>("h0"), _count_T_1) @[ResetCounter.scala 9:36 ResetCounter.scala 10:11 ResetCounter.scala 12:11]
    node _io_result_T = dshr(count, UInt<4>("hf")) @[ResetCounter.scala 14:26]
    node _io_result_T_1 = bits(_io_result_T, 0, 0) @[ResetCounter.scala 14:26]
    io_result <= _io_result_T_1 @[ResetCounter.scala 14:17]
    count <= mux(reset, UInt<16>("h0"), _GEN_0) @[ResetCounter.scala 8:25 ResetCounter.scala 8:25]
