;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit shift_reg_with_parallel_load : 
  module shift_reg_with_parallel_load : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<1>[4], flip load_in : UInt<1>[4], flip in : UInt<1>, flip load : UInt<1>}
    
    node mux1 = mux(io.load, io.load_in[0], io.in) @[task3.scala 14:15]
    node mux2 = mux(io.load, io.load_in[1], mux1) @[task3.scala 15:15]
    node mux3 = mux(io.load, io.load_in[2], mux2) @[task3.scala 16:15]
    node mux4 = mux(io.load, io.load_in[3], mux3) @[task3.scala 17:15]
    reg reg_1 : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[task3.scala 18:22]
    reg reg_2 : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[task3.scala 19:21]
    reg reg_3 : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[task3.scala 20:20]
    reg reg_4 : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[task3.scala 21:20]
    reg_1 <= mux1 @[task3.scala 22:7]
    reg_2 <= mux2 @[task3.scala 23:7]
    reg_3 <= mux3 @[task3.scala 24:7]
    reg_4 <= mux4 @[task3.scala 25:7]
    io.out[0] <= reg_1 @[task3.scala 26:11]
    io.out[1] <= reg_2 @[task3.scala 27:11]
    io.out[2] <= reg_3 @[task3.scala 28:11]
    io.out[3] <= reg_4 @[task3.scala 29:11]
    
