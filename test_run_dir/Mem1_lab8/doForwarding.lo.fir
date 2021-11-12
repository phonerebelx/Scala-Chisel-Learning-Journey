circuit doForwarding :
  module doForwarding :
    input clock : Clock
    input reset : UInt<1>
    input io_write : UInt<1>
    input io_Raddrs : UInt<10>
    input io_Waddrs : UInt<10>
    input io_dataIn : UInt<32>
    output io_dataOut : UInt<32>

    mem memory : @[ex2.scala 13:30]
      data-type => UInt<32>
      depth => 32
      read-latency => 1
      write-latency => 1
      reader => memData
      writer => MPORT
      read-under-write => undefined
    reg wrDataReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), wrDataReg) @[ex2.scala 14:29]
    node _doForwardReg_T = eq(io_Raddrs, io_Waddrs) @[ex2.scala 15:44]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io_write) @[ex2.scala 15:59]
    reg doForwardReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg) @[ex2.scala 15:32]
    node _memData_T = bits(io_Raddrs, 4, 0) @[ex2.scala 16:33]
    node _T = bits(io_Waddrs, 4, 0)
    node _GEN_0 = validif(io_write, _T) @[ex2.scala 18:5]
    node _GEN_1 = validif(io_write, clock) @[ex2.scala 18:5]
    node _GEN_2 = mux(io_write, UInt<1>("h1"), UInt<1>("h0")) @[ex2.scala 18:5 ex2.scala 13:30]
    node _GEN_3 = validif(io_write, UInt<1>("h1")) @[ex2.scala 18:5]
    node _GEN_4 = validif(io_write, io_dataIn) @[ex2.scala 18:5]
    node _io_dataOut_T = mux(doForwardReg, wrDataReg, memory.memData.data) @[ex2.scala 21:24]
    io_dataOut <= _io_dataOut_T @[ex2.scala 21:17]
    memory.memData.addr <= _memData_T @[ex2.scala 16:33]
    memory.memData.en <= UInt<1>("h1") @[ex2.scala 16:33]
    memory.memData.clk <= clock @[ex2.scala 16:33]
    memory.MPORT.addr <= _GEN_0
    memory.MPORT.en <= _GEN_2
    memory.MPORT.clk <= _GEN_1
    memory.MPORT.data <= _GEN_4
    memory.MPORT.mask <= _GEN_3
    wrDataReg <= io_dataIn @[ex2.scala 14:29]
    doForwardReg <= _doForwardReg_T_1 @[ex2.scala 15:32]
