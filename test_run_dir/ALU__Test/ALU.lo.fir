circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_in_1 : UInt<32>
    input io_in_2 : UInt<32>
    input io_select : UInt<5>
    output io_output : UInt<32>

    node _T = eq(UInt<1>("h0"), io_select) @[Conditional.scala 37:30]
    node _io_output_T = add(io_in_1, io_in_2) @[ALU.scala 41:34]
    node _io_output_T_1 = tail(_io_output_T, 1) @[ALU.scala 41:34]
    node _T_1 = eq(UInt<1>("h1"), io_select) @[Conditional.scala 37:30]
    node _io_output_T_2 = bits(io_in_2, 4, 0) @[ALU.scala 45:44]
    node _io_output_T_3 = dshl(io_in_1, _io_output_T_2) @[ALU.scala 45:34]
    node _T_2 = eq(UInt<2>("h2"), io_select) @[Conditional.scala 37:30]
    node _T_3 = lt(io_in_1, io_in_2) @[ALU.scala 49:26]
    node _GEN_0 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[ALU.scala 49:36 ALU.scala 50:26 ALU.scala 52:26]
    node _T_4 = eq(UInt<2>("h3"), io_select) @[Conditional.scala 37:30]
    node _io_output_T_4 = bits(io_in_2, 4, 0) @[ALU.scala 58:46]
    node _io_output_T_5 = dshr(io_in_1, _io_output_T_4) @[ALU.scala 58:36]
    node _T_5 = eq(UInt<3>("h4"), io_select) @[Conditional.scala 37:30]
    node _io_output_T_6 = xor(io_in_1, io_in_2) @[ALU.scala 71:31]
    node _T_6 = eq(UInt<3>("h5"), io_select) @[Conditional.scala 37:30]
    node _io_output_T_7 = bits(io_in_2, 4, 0) @[ALU.scala 75:42]
    node _io_output_T_8 = dshr(io_in_1, _io_output_T_7) @[ALU.scala 75:32]
    node _T_7 = eq(UInt<3>("h6"), io_select) @[Conditional.scala 37:30]
    node _io_output_T_9 = or(io_in_1, io_in_2) @[ALU.scala 79:32]
    node _T_8 = eq(UInt<3>("h7"), io_select) @[Conditional.scala 37:30]
    node _io_output_T_10 = and(io_in_1, io_in_2) @[ALU.scala 84:32]
    node _T_9 = eq(UInt<4>("h8"), io_select) @[Conditional.scala 37:30]
    node _io_output_T_11 = sub(io_in_1, io_in_2) @[ALU.scala 88:32]
    node _io_output_T_12 = tail(_io_output_T_11, 1) @[ALU.scala 88:32]
    node _T_10 = eq(UInt<4>("h9"), io_select) @[Conditional.scala 37:30]
    node _io_output_T_13 = bits(io_in_2, 4, 0) @[ALU.scala 92:42]
    node _io_output_T_14 = dshr(io_in_1, _io_output_T_13) @[ALU.scala 92:32]
    node _GEN_1 = mux(_T_10, _io_output_T_14, UInt<1>("h0")) @[Conditional.scala 39:67 ALU.scala 92:22 ALU.scala 38:15]
    node _GEN_2 = mux(_T_9, _io_output_T_12, _GEN_1) @[Conditional.scala 39:67 ALU.scala 88:22]
    node _GEN_3 = mux(_T_8, _io_output_T_10, _GEN_2) @[Conditional.scala 39:67 ALU.scala 84:22]
    node _GEN_4 = mux(_T_7, _io_output_T_9, _GEN_3) @[Conditional.scala 39:67 ALU.scala 79:22]
    node _GEN_5 = mux(_T_6, _io_output_T_8, _GEN_4) @[Conditional.scala 39:67 ALU.scala 75:22]
    node _GEN_6 = mux(_T_5, _io_output_T_6, _GEN_5) @[Conditional.scala 39:67 ALU.scala 71:22]
    node _GEN_7 = mux(_T_4, _io_output_T_5, _GEN_6) @[Conditional.scala 39:67 ALU.scala 58:26]
    node _GEN_8 = mux(_T_2, _GEN_0, _GEN_7) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_1, _io_output_T_3, _GEN_8) @[Conditional.scala 39:67 ALU.scala 45:23]
    node _GEN_10 = mux(_T, _io_output_T_1, _GEN_9) @[Conditional.scala 40:58 ALU.scala 41:23]
    io_output <= bits(_GEN_10, 31, 0)
