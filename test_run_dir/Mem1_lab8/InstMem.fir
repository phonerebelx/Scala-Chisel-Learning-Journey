;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit InstMem : 
  module InstMem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip addr : UInt<32>, inst : UInt<32>}
    
    cmem imem : UInt<32>[1024] @[ex3.scala 14:16]
    node _io_inst_T = bits(io.addr, 9, 0) @[ex3.scala 16:19]
    infer mport io_inst_MPORT = imem[_io_inst_T], clock @[ex3.scala 16:19]
    io.inst <= io_inst_MPORT @[ex3.scala 16:11]
    
