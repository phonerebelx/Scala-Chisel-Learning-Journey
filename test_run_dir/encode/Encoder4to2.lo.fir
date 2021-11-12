circuit Encoder4to2 :
  module Encoder4to2 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<2>

    node _T = eq(UInt<1>("h1"), io_in) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<2>("h2"), io_in) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<3>("h4"), io_in) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_2, UInt<2>("h2"), UInt<2>("h3")) @[Conditional.scala 39:67 encoder.scala 23:16 encoder.scala 13:8]
    node _GEN_1 = mux(_T_1, UInt<1>("h1"), _GEN_0) @[Conditional.scala 39:67 encoder.scala 19:18]
    node _GEN_2 = mux(_T, UInt<1>("h0"), _GEN_1) @[Conditional.scala 40:58 encoder.scala 16:16]
    io_out <= _GEN_2
