circuit BranchCtrl :
  module BranchCtrl :
    input clock : Clock
    input reset : UInt<1>
    input io_sel : UInt<5>
    input io_branch : UInt<1>
    input io_a : SInt<32>
    input io_b : SInt<32>
    output io_out : SInt<32>
    output io_br_taken : UInt<1>

    node _T = eq(UInt<5>("h10"), io_sel) @[Conditional.scala 37:30]
    node _T_1 = eq(io_a, io_b) @[branch.scala 28:23]
    node _GEN_0 = mux(_T_1, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[branch.scala 28:32 branch.scala 29:23 branch.scala 31:23]
    node _T_2 = eq(UInt<5>("h11"), io_sel) @[Conditional.scala 37:30]
    node _T_3 = neq(io_a, io_b) @[branch.scala 36:23]
    node _GEN_1 = mux(_T_3, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[branch.scala 36:32 branch.scala 37:23 branch.scala 39:23]
    node _T_4 = eq(UInt<5>("h14"), io_sel) @[Conditional.scala 37:30]
    node _T_5 = lt(io_a, io_b) @[branch.scala 44:23]
    node _GEN_2 = mux(_T_5, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[branch.scala 44:30 branch.scala 45:23 branch.scala 47:23]
    node _T_6 = eq(UInt<5>("h15"), io_sel) @[Conditional.scala 37:30]
    node _T_7 = geq(io_a, io_b) @[branch.scala 52:23]
    node _GEN_3 = mux(_T_7, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[branch.scala 52:31 branch.scala 53:23 branch.scala 55:23]
    node _T_8 = eq(UInt<5>("h16"), io_sel) @[Conditional.scala 37:30]
    node _T_9 = asUInt(io_a) @[branch.scala 60:23]
    node _T_10 = asUInt(io_b) @[branch.scala 60:37]
    node _T_11 = lt(_T_9, _T_10) @[branch.scala 60:30]
    node _GEN_4 = mux(_T_11, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[branch.scala 60:44 branch.scala 61:23 branch.scala 63:23]
    node _GEN_5 = mux(_T_8, _GEN_4, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 branch.scala 24:12]
    node _GEN_6 = mux(_T_6, _GEN_3, _GEN_5) @[Conditional.scala 39:67]
    node _GEN_7 = mux(_T_4, _GEN_2, _GEN_6) @[Conditional.scala 39:67]
    node _GEN_8 = mux(_T_2, _GEN_1, _GEN_7) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T, _GEN_0, _GEN_8) @[Conditional.scala 40:58]
    node _T_12 = eq(io_out, asSInt(UInt<2>("h1"))) @[branch.scala 68:18]
    node _T_13 = bits(io_sel, 4, 3) @[branch.scala 68:34]
    node _T_14 = eq(_T_13, UInt<2>("h2")) @[branch.scala 68:40]
    node _T_15 = and(_T_12, _T_14) @[branch.scala 68:26]
    node _T_16 = eq(io_branch, UInt<1>("h1")) @[branch.scala 68:64]
    node _T_17 = and(_T_15, _T_16) @[branch.scala 68:52]
    node _GEN_10 = mux(_T_17, UInt<1>("h1"), UInt<1>("h0")) @[branch.scala 68:72 branch.scala 69:21 branch.scala 71:21]
    io_out <= _GEN_9
    io_br_taken <= _GEN_10
