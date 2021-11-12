circuit WMaskedReadWriteSmem :
  module WMaskedReadWriteSmem :
    input clock : Clock
    input reset : UInt<1>
    input io_enable : UInt<1>
    input io_write : UInt<1>
    input io_addr : UInt<10>
    input io_mask : UInt<2>
    input io_dataIn : UInt<32>
    output io_dataOut : UInt<32>

    mem mem : @[ex1.scala 16:27]
      data-type => UInt<32>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => io_dataOut_MPORT
      writer => MPORT
      writer => MPORT_1
      writer => MPORT_2
      read-under-write => undefined
    node _T = eq(UInt<1>("h1"), io_mask) @[Conditional.scala 37:30]
    node _T_1 = bits(io_dataIn, 7, 0) @[ex1.scala 21:50]
    node _T_2 = eq(UInt<2>("h2"), io_mask) @[Conditional.scala 37:30]
    node _T_3 = bits(io_dataIn, 15, 0) @[ex1.scala 24:50]
    node _GEN_0 = validif(_T_2, io_addr) @[Conditional.scala 39:67]
    node _GEN_1 = validif(_T_2, clock) @[Conditional.scala 39:67]
    node _GEN_2 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 ex1.scala 16:27]
    node _GEN_3 = validif(_T_2, UInt<1>("h1")) @[Conditional.scala 39:67]
    node _GEN_4 = validif(_T_2, _T_3) @[Conditional.scala 39:67]
    node _GEN_5 = validif(_T, io_addr) @[Conditional.scala 40:58]
    node _GEN_6 = validif(_T, clock) @[Conditional.scala 40:58]
    node _GEN_7 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 ex1.scala 16:27]
    node _GEN_8 = validif(_T, UInt<1>("h1")) @[Conditional.scala 40:58]
    node _GEN_9 = validif(_T, _T_1) @[Conditional.scala 40:58]
    node _GEN_10 = validif(eq(_T, UInt<1>("h0")), _GEN_0) @[Conditional.scala 40:58]
    node _GEN_11 = validif(eq(_T, UInt<1>("h0")), _GEN_1) @[Conditional.scala 40:58]
    node _GEN_12 = mux(_T, UInt<1>("h0"), _GEN_2) @[Conditional.scala 40:58 ex1.scala 16:27]
    node _GEN_13 = validif(eq(_T, UInt<1>("h0")), _GEN_3) @[Conditional.scala 40:58]
    node _GEN_14 = validif(eq(_T, UInt<1>("h0")), _GEN_4) @[Conditional.scala 40:58]
    node _GEN_15 = validif(io_enable, io_addr) @[ex1.scala 29:32 ex1.scala 29:32]
    node _io_dataOut_WIRE = _GEN_15 @[ex1.scala 29:32]
    node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<10>("h0")) @[ex1.scala 29:32]
    node _io_dataOut_T_1 = bits(_io_dataOut_T, 9, 0) @[ex1.scala 29:32]
    node _GEN_16 = mux(io_enable, UInt<1>("h1"), UInt<1>("h0")) @[ex1.scala 29:32 ex1.scala 29:32 ex1.scala 16:27]
    node _GEN_17 = validif(io_enable, _io_dataOut_T_1) @[ex1.scala 29:32 ex1.scala 29:32]
    node _GEN_18 = validif(io_enable, clock) @[ex1.scala 29:32 ex1.scala 29:32]
    io_dataOut <= mem.io_dataOut_MPORT.data @[ex1.scala 29:18]
    mem.io_dataOut_MPORT.addr <= _GEN_17
    mem.io_dataOut_MPORT.en <= _GEN_16
    mem.io_dataOut_MPORT.clk <= _GEN_18
    mem.MPORT.addr <= io_addr
    mem.MPORT.en <= UInt<1>("h1")
    mem.MPORT.clk <= clock
    mem.MPORT.data <= io_dataIn
    mem.MPORT.mask <= UInt<1>("h1")
    mem.MPORT_1.addr <= _GEN_5
    mem.MPORT_1.en <= _GEN_7
    mem.MPORT_1.clk <= _GEN_6
    mem.MPORT_1.data <= _GEN_9
    mem.MPORT_1.mask <= _GEN_8
    mem.MPORT_2.addr <= _GEN_10
    mem.MPORT_2.en <= _GEN_12
    mem.MPORT_2.clk <= _GEN_11
    mem.MPORT_2.data <= _GEN_14
    mem.MPORT_2.mask <= _GEN_13
