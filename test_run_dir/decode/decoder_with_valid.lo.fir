circuit decoder_with_valid :
  module decoder_with_valid :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<2>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<4>

    node _T = eq(UInt<1>("h0"), io_in) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<1>("h1"), io_in) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<2>("h2"), io_in) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_2, UInt<2>("h3"), UInt<3>("h4")) @[Conditional.scala 39:67 decoder.scala 22:23 decoder.scala 10:23]
    node _GEN_1 = mux(_T_2, UInt<1>("h1"), UInt<1>("h1")) @[Conditional.scala 39:67 decoder.scala 23:22 decoder.scala 11:22]
    node _GEN_2 = mux(_T_1, UInt<2>("h2"), _GEN_0) @[Conditional.scala 39:67 decoder.scala 18:23]
    node _GEN_3 = mux(_T_1, UInt<1>("h1"), _GEN_1) @[Conditional.scala 39:67 decoder.scala 19:22]
    node _GEN_4 = mux(_T, UInt<1>("h1"), _GEN_2) @[Conditional.scala 40:58 decoder.scala 14:29]
    node _GEN_5 = mux(_T, UInt<1>("h0"), _GEN_3) @[Conditional.scala 40:58 decoder.scala 15:22]
    io_out_valid <= _GEN_5
    io_out_bits <= _GEN_4
