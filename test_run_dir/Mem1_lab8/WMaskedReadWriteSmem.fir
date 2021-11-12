;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit WMaskedReadWriteSmem : 
  module WMaskedReadWriteSmem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enable : UInt<1>, flip write : UInt<1>, flip addr : UInt<10>, flip mask : UInt<2>, flip dataIn : UInt<32>, dataOut : UInt<32>}
    
    smem mem : UInt<32>[1024], undefined @[ex1.scala 16:27]
    write mport MPORT = mem[io.addr], clock
    MPORT <= io.dataIn
    node _T = eq(UInt<1>("h01"), io.mask) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      node _T_1 = bits(io.dataIn, 7, 0) @[ex1.scala 21:50]
      write mport MPORT_1 = mem[io.addr], clock
      MPORT_1 <= _T_1
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_2 = eq(UInt<2>("h02"), io.mask) @[Conditional.scala 37:30]
      when _T_2 : @[Conditional.scala 39:67]
        node _T_3 = bits(io.dataIn, 15, 0) @[ex1.scala 24:50]
        write mport MPORT_2 = mem[io.addr], clock
        MPORT_2 <= _T_3
        skip @[Conditional.scala 39:67]
    wire _io_dataOut_WIRE : UInt @[ex1.scala 29:32]
    _io_dataOut_WIRE is invalid @[ex1.scala 29:32]
    when io.enable : @[ex1.scala 29:32]
      _io_dataOut_WIRE <= io.addr @[ex1.scala 29:32]
      node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<10>("h00")) @[ex1.scala 29:32]
      node _io_dataOut_T_1 = bits(_io_dataOut_T, 9, 0) @[ex1.scala 29:32]
      read mport io_dataOut_MPORT = mem[_io_dataOut_T_1], clock @[ex1.scala 29:32]
      skip @[ex1.scala 29:32]
    io.dataOut <= io_dataOut_MPORT @[ex1.scala 29:18]
    
