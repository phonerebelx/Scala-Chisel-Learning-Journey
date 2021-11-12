;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit ALUI : 
  module ALUI : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_A : UInt<32>, flip in_B : UInt<32>, flip alu_Op : UInt<4>, out : UInt<32>}
    
    node sltt = lt(io.in_A, io.in_B) @[branch.scala 21:20]
    node BEQ = eq(io.in_A, io.in_B) @[branch.scala 22:19]
    node b_bGE = gt(io.in_A, io.in_B) @[branch.scala 23:21]
    node BGE = or(b_bGE, BEQ) @[branch.scala 24:17]
    node BNE = not(BEQ) @[branch.scala 25:11]
    io.out <= BGE @[branch.scala 27:8]
    node _T = bits(io.alu_Op, 2, 0) @[branch.scala 28:19]
    node _T_1 = eq(UInt<1>("h00"), _T) @[Conditional.scala 37:30]
    when _T_1 : @[Conditional.scala 40:58]
      io.out <= BEQ @[branch.scala 30:16]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_2 = eq(UInt<1>("h01"), _T) @[Conditional.scala 37:30]
      when _T_2 : @[Conditional.scala 39:67]
        io.out <= BNE @[branch.scala 34:16]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_3 = eq(UInt<3>("h04"), _T) @[Conditional.scala 37:30]
        when _T_3 : @[Conditional.scala 39:67]
          io.out <= sltt @[branch.scala 38:16]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_4 = eq(UInt<3>("h05"), _T) @[Conditional.scala 37:30]
          when _T_4 : @[Conditional.scala 39:67]
            io.out <= BGE @[branch.scala 41:16]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_5 = eq(UInt<3>("h06"), _T) @[Conditional.scala 37:30]
            when _T_5 : @[Conditional.scala 39:67]
              io.out <= sltt @[branch.scala 44:16]
              skip @[Conditional.scala 39:67]
    
