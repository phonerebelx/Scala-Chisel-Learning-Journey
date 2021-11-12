circuit InstMem :
  module InstMem :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<32>
    output io_inst : UInt<32>

    mem imem : @[ex3.scala 14:16]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_inst_MPORT
      read-under-write => undefined
    node _io_inst_T = bits(io_addr, 9, 0) @[ex3.scala 16:19]
    io_inst <= imem.io_inst_MPORT.data @[ex3.scala 16:11]
    imem.io_inst_MPORT.addr <= _io_inst_T @[ex3.scala 16:19]
    imem.io_inst_MPORT.en <= UInt<1>("h1") @[ex3.scala 16:19]
    imem.io_inst_MPORT.clk <= clock @[ex3.scala 16:19]
