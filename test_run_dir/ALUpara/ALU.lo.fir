circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_alu_oper : UInt<5>
    input io_arg_x : UInt<32>
    input io_arg_y : UInt<32>
    output io_alu_out : UInt<32>

    node _T = eq(io_alu_oper, UInt<1>("h0")) @[ALU_when.scala 10:18]
    node _io_alu_out_T = and(io_arg_x, io_arg_y) @[ALU_when.scala 11:32]
    node _T_1 = eq(io_alu_oper, UInt<1>("h1")) @[ALU_when.scala 14:23]
    node _io_alu_out_T_1 = or(io_arg_x, io_arg_y) @[ALU_when.scala 15:32]
    node _T_2 = eq(io_alu_oper, UInt<2>("h2")) @[ALU_when.scala 18:24]
    node _io_alu_out_T_2 = add(io_arg_x, io_arg_y) @[ALU_when.scala 19:32]
    node _io_alu_out_T_3 = tail(_io_alu_out_T_2, 1) @[ALU_when.scala 19:32]
    node _T_3 = eq(io_alu_oper, UInt<3>("h6")) @[ALU_when.scala 23:23]
    node _io_alu_out_T_4 = sub(io_arg_x, io_arg_y) @[ALU_when.scala 24:32]
    node _io_alu_out_T_5 = tail(_io_alu_out_T_4, 1) @[ALU_when.scala 24:32]
    node _T_4 = eq(io_alu_oper, UInt<2>("h3")) @[ALU_when.scala 27:24]
    node _io_alu_out_T_6 = xor(io_arg_x, io_arg_y) @[ALU_when.scala 28:32]
    node _T_5 = eq(io_alu_oper, UInt<3>("h4")) @[ALU_when.scala 32:23]
    node _io_alu_out_T_7 = bits(io_arg_y, 4, 0) @[ALU_when.scala 33:46]
    node _io_alu_out_T_8 = dshl(io_arg_x, _io_alu_out_T_7) @[ALU_when.scala 33:32]
    node _T_6 = eq(io_alu_oper, UInt<3>("h5")) @[ALU_when.scala 35:23]
    node _io_alu_out_T_9 = bits(io_arg_y, 4, 0) @[ALU_when.scala 36:46]
    node _io_alu_out_T_10 = dshr(io_arg_x, _io_alu_out_T_9) @[ALU_when.scala 36:32]
    node _T_7 = eq(io_alu_oper, UInt<3>("h7")) @[ALU_when.scala 39:22]
    node _io_alu_out_T_11 = asSInt(io_arg_x) @[ALU_when.scala 40:36]
    node _io_alu_out_T_12 = bits(io_arg_y, 4, 0) @[ALU_when.scala 40:57]
    node _io_alu_out_T_13 = dshr(_io_alu_out_T_11, _io_alu_out_T_12) @[ALU_when.scala 40:43]
    node _io_alu_out_T_14 = asUInt(_io_alu_out_T_13) @[ALU_when.scala 40:69]
    node _T_8 = eq(io_alu_oper, UInt<4>("h8")) @[ALU_when.scala 43:25]
    node _io_alu_out_T_15 = asSInt(io_arg_x) @[ALU_when.scala 44:36]
    node _io_alu_out_T_16 = asSInt(io_arg_y) @[ALU_when.scala 44:58]
    node _io_alu_out_T_17 = lt(_io_alu_out_T_15, _io_alu_out_T_16) @[ALU_when.scala 44:43]
    node _T_9 = eq(io_alu_oper, UInt<4>("h9")) @[ALU_when.scala 47:23]
    node _io_alu_out_T_18 = lt(io_arg_x, io_arg_y) @[ALU_when.scala 48:32]
    node _GEN_0 = mux(_T_9, _io_alu_out_T_18, UInt<1>("h0")) @[ALU_when.scala 47:31 ALU_when.scala 48:18 ALU_when.scala 7:14]
    node _GEN_1 = mux(_T_8, _io_alu_out_T_17, _GEN_0) @[ALU_when.scala 43:33 ALU_when.scala 44:19]
    node _GEN_2 = mux(_T_7, _io_alu_out_T_14, _GEN_1) @[ALU_when.scala 39:30 ALU_when.scala 40:18]
    node _GEN_3 = mux(_T_6, _io_alu_out_T_10, _GEN_2) @[ALU_when.scala 35:31 ALU_when.scala 36:18]
    node _GEN_4 = mux(_T_5, _io_alu_out_T_8, _GEN_3) @[ALU_when.scala 32:31 ALU_when.scala 33:18]
    node _GEN_5 = mux(_T_4, _io_alu_out_T_6, _GEN_4) @[ALU_when.scala 27:32 ALU_when.scala 28:18]
    node _GEN_6 = mux(_T_3, _io_alu_out_T_5, _GEN_5) @[ALU_when.scala 23:31 ALU_when.scala 24:18]
    node _GEN_7 = mux(_T_2, _io_alu_out_T_3, _GEN_6) @[ALU_when.scala 18:32 ALU_when.scala 19:18]
    node _GEN_8 = mux(_T_1, _io_alu_out_T_1, _GEN_7) @[ALU_when.scala 14:31 ALU_when.scala 15:18]
    node _GEN_9 = mux(_T, _io_alu_out_T, _GEN_8) @[ALU_when.scala 10:26 ALU_when.scala 11:18]
    io_alu_out <= bits(_GEN_9, 31, 0)
