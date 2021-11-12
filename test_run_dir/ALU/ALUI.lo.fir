circuit ALUI :
  module ALUI :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_alu_Op : UInt<4>
    output io_out : UInt<32>

    node sltt = lt(io_in_A, io_in_B) @[branch.scala 21:20]
    node BEQ = eq(io_in_A, io_in_B) @[branch.scala 22:19]
    node b_bGE = gt(io_in_A, io_in_B) @[branch.scala 23:21]
    node BGE = or(b_bGE, BEQ) @[branch.scala 24:17]
    node BNE = not(BEQ) @[branch.scala 25:11]
    node _T = bits(io_alu_Op, 2, 0) @[branch.scala 28:19]
    node _T_1 = eq(UInt<1>("h0"), _T) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<1>("h1"), _T) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<3>("h4"), _T) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<3>("h5"), _T) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<3>("h6"), _T) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_5, sltt, BGE) @[Conditional.scala 39:67 branch.scala 44:16 branch.scala 27:8]
    node _GEN_1 = mux(_T_4, BGE, _GEN_0) @[Conditional.scala 39:67 branch.scala 41:16]
    node _GEN_2 = mux(_T_3, sltt, _GEN_1) @[Conditional.scala 39:67 branch.scala 38:16]
    node _GEN_3 = mux(_T_2, BNE, _GEN_2) @[Conditional.scala 39:67 branch.scala 34:16]
    node _GEN_4 = mux(_T_1, BEQ, _GEN_3) @[Conditional.scala 40:58 branch.scala 30:16]
    io_out <= _GEN_4
