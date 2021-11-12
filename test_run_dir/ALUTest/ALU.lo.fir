circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_alu_Op : UInt<4>
    output io_out : UInt<32>

    node _sum_T = bits(io_alu_Op, 3, 3) @[And.scala 41:36]
    node _sum_T_1 = sub(UInt<1>("h0"), io_in_B) @[And.scala 41:42]
    node _sum_T_2 = tail(_sum_T_1, 1) @[And.scala 41:42]
    node _sum_T_3 = mux(_sum_T, _sum_T_2, io_in_B) @[And.scala 41:24]
    node _sum_T_4 = add(io_in_A, _sum_T_3) @[And.scala 41:19]
    node sum = tail(_sum_T_4, 1) @[And.scala 41:19]
    node andd = and(io_in_A, io_in_B) @[And.scala 44:20]
    node orr = or(io_in_A, io_in_B) @[And.scala 45:19]
    node xorr = xor(io_in_A, io_in_B) @[And.scala 46:20]
    node _slll_T = bits(io_in_B, 4, 0) @[And.scala 47:30]
    node slll = dshl(io_in_A, _slll_T) @[And.scala 47:20]
    node sltt = lt(io_in_A, io_in_B) @[And.scala 48:21]
    node _sr_T = bits(io_in_B, 4, 0) @[And.scala 49:28]
    node sr = dshr(io_in_A, _sr_T) @[And.scala 49:18]
    node _T = bits(io_alu_Op, 2, 0) @[And.scala 60:19]
    node _T_1 = eq(UInt<1>("h0"), _T) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<1>("h1"), _T) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<2>("h2"), _T) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<2>("h3"), _T) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<3>("h4"), _T) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<3>("h5"), _T) @[Conditional.scala 37:30]
    node _T_7 = eq(UInt<3>("h6"), _T) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_7, orr, andd) @[Conditional.scala 39:67 And.scala 86:16 And.scala 59:8]
    node _GEN_1 = mux(_T_6, sr, _GEN_0) @[Conditional.scala 39:67 And.scala 83:16]
    node _GEN_2 = mux(_T_5, xorr, _GEN_1) @[Conditional.scala 39:67 And.scala 78:16]
    node _GEN_3 = mux(_T_4, sltt, _GEN_2) @[Conditional.scala 39:67 And.scala 75:16]
    node _GEN_4 = mux(_T_3, sltt, _GEN_3) @[Conditional.scala 39:67 And.scala 70:16]
    node _GEN_5 = mux(_T_2, slll, _GEN_4) @[Conditional.scala 39:67 And.scala 66:16]
    node _GEN_6 = mux(_T_1, sum, _GEN_5) @[Conditional.scala 40:58 And.scala 63:16]
    io_out <= bits(_GEN_6, 31, 0)
