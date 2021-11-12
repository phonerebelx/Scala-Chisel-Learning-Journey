;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit doForwarding : 
  module doForwarding : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip write : UInt<1>, flip Raddrs : UInt<10>, flip Waddrs : UInt<10>, flip dataIn : UInt<32>, dataOut : UInt<32>}
    
    smem memory : UInt<32>[32], undefined @[ex2.scala 13:30]
    reg wrDataReg : UInt, clock @[ex2.scala 14:29]
    wrDataReg <= io.dataIn @[ex2.scala 14:29]
    node _doForwardReg_T = eq(io.Raddrs, io.Waddrs) @[ex2.scala 15:44]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io.write) @[ex2.scala 15:59]
    reg doForwardReg : UInt<1>, clock @[ex2.scala 15:32]
    doForwardReg <= _doForwardReg_T_1 @[ex2.scala 15:32]
    node _memData_T = bits(io.Raddrs, 4, 0) @[ex2.scala 16:33]
    read mport memData = memory[_memData_T], clock @[ex2.scala 16:33]
    when io.write : @[ex2.scala 18:5]
      node _T = bits(io.Waddrs, 4, 0)
      write mport MPORT = memory[_T], clock
      MPORT <= io.dataIn
      skip @[ex2.scala 18:5]
    node _io_dataOut_T = mux(doForwardReg, wrDataReg, memData) @[ex2.scala 21:24]
    io.dataOut <= _io_dataOut_T @[ex2.scala 21:17]
    
