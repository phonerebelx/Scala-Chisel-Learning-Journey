;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit ALU : 
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_A : UInt<32>, flip in_B : UInt<32>, flip alu_Op : UInt<4>, out : UInt<32>, sum : UInt<32>, flip mem_write : UInt<1>, flip mem_to_reg : UInt<1>, flip branch : UInt<1>}
    
    node _sum_T = bits(io.alu_Op, 3, 3) @[ALU.scala 25:36]
    node _sum_T_1 = sub(UInt<1>("h00"), io.in_B) @[ALU.scala 25:42]
    node _sum_T_2 = tail(_sum_T_1, 1) @[ALU.scala 25:42]
    node _sum_T_3 = mux(_sum_T, _sum_T_2, io.in_B) @[ALU.scala 25:24]
    node _sum_T_4 = add(io.in_A, _sum_T_3) @[ALU.scala 25:19]
    node sum = tail(_sum_T_4, 1) @[ALU.scala 25:19]
    node andd = and(io.in_A, io.in_B) @[ALU.scala 27:20]
    node orr = or(io.in_A, io.in_B) @[ALU.scala 28:19]
    node xorr = xor(io.in_A, io.in_B) @[ALU.scala 29:20]
    node _slll_T = bits(io.in_B, 4, 0) @[ALU.scala 30:30]
    node slll = dshl(io.in_A, _slll_T) @[ALU.scala 30:20]
    node sltt = lt(io.in_A, io.in_B) @[ALU.scala 31:20]
    node _sr_T = bits(io.in_B, 4, 0) @[ALU.scala 32:28]
    node sr = dshr(io.in_A, _sr_T) @[ALU.scala 32:18]
    node BEQ = eq(io.in_A, io.in_B) @[ALU.scala 35:19]
    node b_bGE = gt(io.in_A, io.in_B) @[ALU.scala 36:21]
    node BGE = or(b_bGE, BEQ) @[ALU.scala 37:17]
    node BNE = not(BEQ) @[ALU.scala 38:11]
    io.sum <= sum @[ALU.scala 40:8]
    node _io_out_T = mux(io.branch, BGE, andd) @[ALU.scala 41:14]
    io.out <= _io_out_T @[ALU.scala 41:8]
    node _T = bits(io.alu_Op, 2, 0) @[ALU.scala 42:19]
    node _T_1 = eq(UInt<1>("h00"), _T) @[Conditional.scala 37:30]
    when _T_1 : @[Conditional.scala 40:58]
      node _io_out_T_1 = mux(io.branch, BEQ, io.sum) @[ALU.scala 44:22]
      io.out <= _io_out_T_1 @[ALU.scala 44:16]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_2 = eq(UInt<1>("h01"), _T) @[Conditional.scala 37:30]
      when _T_2 : @[Conditional.scala 39:67]
        node _io_out_T_2 = mux(io.branch, BNE, slll) @[ALU.scala 48:22]
        io.out <= _io_out_T_2 @[ALU.scala 48:16]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_3 = eq(UInt<2>("h02"), _T) @[Conditional.scala 37:30]
        when _T_3 : @[Conditional.scala 39:67]
          node _io_out_T_3 = add(io.in_A, io.in_B) @[ALU.scala 53:42]
          node _io_out_T_4 = tail(_io_out_T_3, 1) @[ALU.scala 53:42]
          node _io_out_T_5 = add(io.in_A, io.in_B) @[ALU.scala 53:76]
          node _io_out_T_6 = tail(_io_out_T_5, 1) @[ALU.scala 53:76]
          node _io_out_T_7 = mux(io.mem_to_reg, _io_out_T_6, sltt) @[ALU.scala 53:55]
          node _io_out_T_8 = mux(io.mem_write, _io_out_T_4, _io_out_T_7) @[ALU.scala 53:22]
          io.out <= _io_out_T_8 @[ALU.scala 53:16]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_4 = eq(UInt<2>("h03"), _T) @[Conditional.scala 37:30]
          when _T_4 : @[Conditional.scala 39:67]
            io.out <= sltt @[ALU.scala 56:16]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_5 = eq(UInt<3>("h04"), _T) @[Conditional.scala 37:30]
            when _T_5 : @[Conditional.scala 39:67]
              node _io_out_T_9 = mux(io.branch, sltt, xorr) @[ALU.scala 60:22]
              io.out <= _io_out_T_9 @[ALU.scala 60:16]
              skip @[Conditional.scala 39:67]
            else : @[Conditional.scala 39:67]
              node _T_6 = eq(UInt<3>("h05"), _T) @[Conditional.scala 37:30]
              when _T_6 : @[Conditional.scala 39:67]
                node _io_out_T_10 = mux(io.branch, BGE, sr) @[ALU.scala 63:22]
                io.out <= _io_out_T_10 @[ALU.scala 63:16]
                skip @[Conditional.scala 39:67]
              else : @[Conditional.scala 39:67]
                node _T_7 = eq(UInt<3>("h06"), _T) @[Conditional.scala 37:30]
                when _T_7 : @[Conditional.scala 39:67]
                  node _io_out_T_11 = mux(io.branch, sltt, orr) @[ALU.scala 68:22]
                  io.out <= _io_out_T_11 @[ALU.scala 68:16]
                  skip @[Conditional.scala 39:67]
    
