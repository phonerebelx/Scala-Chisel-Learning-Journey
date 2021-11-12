circuit memory_assignment_1 :
  module Queue :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : UInt<32>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : UInt<32>
    output io_count : UInt<3>

    mem ram : @[Decoupled.scala 218:16]
      data-type => UInt<32>
      depth => 4
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    reg value : UInt<2>, clock with :
      reset => (UInt<1>("h0"), value) @[Counter.scala 60:40]
    reg value_1 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), value_1) @[Counter.scala 60:40]
    reg maybe_full : UInt<1>, clock with :
      reset => (UInt<1>("h0"), maybe_full) @[Decoupled.scala 221:27]
    node ptr_match = eq(value, value_1) @[Decoupled.scala 223:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[Decoupled.scala 224:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 224:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 225:24]
    node _do_enq_T = and(io_enq_ready, io_enq_valid) @[Decoupled.scala 40:37]
    node _do_deq_T = and(io_deq_ready, io_deq_valid) @[Decoupled.scala 40:37]
    node wrap = eq(value, UInt<2>("h3")) @[Counter.scala 72:24]
    node _value_T = add(value, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
    node do_enq = _do_enq_T
    node _GEN_0 = validif(do_enq, value) @[Decoupled.scala 229:17 Decoupled.scala 230:8]
    node _GEN_1 = validif(do_enq, clock) @[Decoupled.scala 229:17 Decoupled.scala 230:8]
    node _GEN_2 = mux(do_enq, UInt<1>("h1"), UInt<1>("h0")) @[Decoupled.scala 229:17 Decoupled.scala 230:8 Decoupled.scala 218:16]
    node _GEN_3 = validif(do_enq, UInt<1>("h1")) @[Decoupled.scala 229:17 Decoupled.scala 230:24]
    node _GEN_4 = validif(do_enq, io_enq_bits) @[Decoupled.scala 229:17 Decoupled.scala 230:24]
    node _GEN_5 = mux(do_enq, _value_T_1, value) @[Decoupled.scala 229:17 Counter.scala 76:15 Counter.scala 60:40]
    node wrap_1 = eq(value_1, UInt<2>("h3")) @[Counter.scala 72:24]
    node _value_T_2 = add(value_1, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 76:24]
    node do_deq = _do_deq_T
    node _GEN_6 = mux(do_deq, _value_T_3, value_1) @[Decoupled.scala 233:17 Counter.scala 76:15 Counter.scala 60:40]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    node _GEN_7 = mux(_T, do_enq, maybe_full) @[Decoupled.scala 236:28 Decoupled.scala 237:16 Decoupled.scala 221:27]
    node _io_deq_valid_T = eq(empty, UInt<1>("h0")) @[Decoupled.scala 240:19]
    node _io_enq_ready_T = eq(full, UInt<1>("h0")) @[Decoupled.scala 241:19]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 259:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<3>("h4"), UInt<1>("h0")) @[Decoupled.scala 259:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 259:62]
    io_enq_ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    io_deq_valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    io_deq_bits <= ram.io_deq_bits_MPORT.data @[Decoupled.scala 242:15]
    io_count <= _io_count_T_2 @[Decoupled.scala 259:14]
    ram.io_deq_bits_MPORT.addr <= value_1 @[Decoupled.scala 242:21]
    ram.io_deq_bits_MPORT.en <= UInt<1>("h1") @[Decoupled.scala 242:21]
    ram.io_deq_bits_MPORT.clk <= clock @[Decoupled.scala 242:21]
    ram.MPORT.addr <= _GEN_0
    ram.MPORT.en <= _GEN_2
    ram.MPORT.clk <= _GEN_1
    ram.MPORT.data <= _GEN_4
    ram.MPORT.mask <= _GEN_3
    value <= mux(reset, UInt<2>("h0"), _GEN_5) @[Counter.scala 60:40 Counter.scala 60:40]
    value_1 <= mux(reset, UInt<2>("h0"), _GEN_6) @[Counter.scala 60:40 Counter.scala 60:40]
    maybe_full <= mux(reset, UInt<1>("h0"), _GEN_7) @[Decoupled.scala 221:27 Decoupled.scala 221:27]

  module Arbiter :
    input clock : Clock
    input reset : UInt<1>
    output io_in_0_ready : UInt<1>
    input io_in_0_valid : UInt<1>
    input io_in_0_bits : UInt<32>
    output io_in_1_ready : UInt<1>
    input io_in_1_valid : UInt<1>
    input io_in_1_bits : UInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<32>
    output io_chosen : UInt<1>

    node _GEN_0 = mux(io_in_0_valid, UInt<1>("h0"), UInt<1>("h1")) @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
    node _GEN_1 = mux(io_in_0_valid, io_in_0_bits, io_in_1_bits) @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
    node grant_1 = eq(io_in_0_valid, UInt<1>("h0")) @[Arbiter.scala 31:78]
    node _io_in_0_ready_T = and(UInt<1>("h1"), io_out_ready) @[Arbiter.scala 134:19]
    node _io_in_1_ready_T = and(grant_1, io_out_ready) @[Arbiter.scala 134:19]
    node _io_out_valid_T = eq(grant_1, UInt<1>("h0")) @[Arbiter.scala 135:19]
    node _io_out_valid_T_1 = or(_io_out_valid_T, io_in_1_valid) @[Arbiter.scala 135:31]
    io_in_0_ready <= _io_in_0_ready_T @[Arbiter.scala 134:14]
    io_in_1_ready <= _io_in_1_ready_T @[Arbiter.scala 134:14]
    io_out_valid <= _io_out_valid_T_1 @[Arbiter.scala 135:16]
    io_out_bits <= _GEN_1
    io_chosen <= _GEN_0

  module memory_assignment_1 :
    input clock : Clock
    input reset : UInt<1>
    input io_memory_out_ready : UInt<1>
    output io_memory_out_valid : UInt<1>
    output io_memory_out_bits : UInt<32>
    output io_requestor_0_ready : UInt<1>
    input io_requestor_0_valid : UInt<1>
    input io_requestor_0_bits : UInt<32>
    output io_requestor_1_ready : UInt<1>
    input io_requestor_1_valid : UInt<1>
    input io_requestor_1_bits : UInt<32>
    output io_requestor_2_ready : UInt<1>
    input io_requestor_2_valid : UInt<1>
    input io_requestor_2_bits : UInt<32>
    output io_requestor_3_ready : UInt<1>
    input io_requestor_3_valid : UInt<1>
    input io_requestor_3_bits : UInt<32>
    input io_enable : UInt<1>
    input io_Readaddr : UInt<5>
    input io_Writeaddr : UInt<5>

    mem Memory : @[task1.scala 13:22]
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => io_memory_out_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    inst queue0 of Queue @[Decoupled.scala 296:21]
    inst queue1 of Queue @[Decoupled.scala 296:21]
    inst queue2 of Queue @[Decoupled.scala 296:21]
    inst queue3 of Queue @[Decoupled.scala 296:21]
    inst arbi of Arbiter @[task1.scala 24:23]
    node hi = cat(arbi.io_out_ready, arbi.io_out_valid) @[task1.scala 33:45]
    node _T = cat(hi, arbi.io_out_bits) @[task1.scala 33:45]
    node _GEN_0 = validif(io_enable, io_Writeaddr) @[task1.scala 32:20]
    node _GEN_1 = validif(io_enable, clock) @[task1.scala 32:20]
    node _GEN_2 = mux(io_enable, UInt<1>("h1"), UInt<1>("h0")) @[task1.scala 32:20 task1.scala 13:22]
    node _GEN_3 = validif(io_enable, UInt<1>("h1")) @[task1.scala 32:20]
    node _GEN_4 = validif(io_enable, _T) @[task1.scala 32:20]
    io_memory_out_valid <= UInt<1>("h1") @[task1.scala 23:24]
    io_memory_out_bits <= Memory.io_memory_out_bits_MPORT.data @[task1.scala 36:24]
    io_requestor_0_ready <= queue0.io_enq_ready @[Decoupled.scala 299:17]
    io_requestor_1_ready <= queue1.io_enq_ready @[Decoupled.scala 299:17]
    io_requestor_2_ready <= queue2.io_enq_ready @[Decoupled.scala 299:17]
    io_requestor_3_ready <= queue3.io_enq_ready @[Decoupled.scala 299:17]
    Memory.io_memory_out_bits_MPORT.addr <= io_Readaddr @[task1.scala 36:38]
    Memory.io_memory_out_bits_MPORT.en <= UInt<1>("h1") @[task1.scala 36:38]
    Memory.io_memory_out_bits_MPORT.clk <= clock @[task1.scala 36:38]
    Memory.MPORT.addr <= _GEN_0
    Memory.MPORT.en <= _GEN_2
    Memory.MPORT.clk <= _GEN_1
    Memory.MPORT.data <= bits(_GEN_4, 31, 0)
    Memory.MPORT.mask <= _GEN_3
    queue0.clock <= clock
    queue0.reset <= reset
    queue0.io_enq_valid <= io_requestor_0_valid @[Decoupled.scala 297:22]
    queue0.io_enq_bits <= io_requestor_0_bits @[Decoupled.scala 298:21]
    queue0.io_deq_ready <= arbi.io_in_0_ready @[task1.scala 28:18]
    queue1.clock <= clock
    queue1.reset <= reset
    queue1.io_enq_valid <= io_requestor_1_valid @[Decoupled.scala 297:22]
    queue1.io_enq_bits <= io_requestor_1_bits @[Decoupled.scala 298:21]
    queue1.io_deq_ready <= arbi.io_in_1_ready @[task1.scala 27:18]
    queue2.clock <= clock
    queue2.reset <= reset
    queue2.io_enq_valid <= io_requestor_2_valid @[Decoupled.scala 297:22]
    queue2.io_enq_bits <= io_requestor_2_bits @[Decoupled.scala 298:21]
    queue2.io_deq_ready <= arbi.io_in_1_ready @[task1.scala 29:18]
    queue3.clock <= clock
    queue3.reset <= reset
    queue3.io_enq_valid <= io_requestor_3_valid @[Decoupled.scala 297:22]
    queue3.io_enq_bits <= io_requestor_3_bits @[Decoupled.scala 298:21]
    queue3.io_deq_ready <= arbi.io_in_1_ready @[task1.scala 30:18]
    arbi.clock <= clock
    arbi.reset <= reset
    arbi.io_in_0_valid <= queue0.io_deq_valid @[task1.scala 28:18]
    arbi.io_in_0_bits <= queue0.io_deq_bits @[task1.scala 28:18]
    arbi.io_in_1_valid <= queue3.io_deq_valid @[task1.scala 30:18]
    arbi.io_in_1_bits <= queue3.io_deq_bits @[task1.scala 30:18]
    arbi.io_out_ready <= UInt<1>("h1") @[task1.scala 31:23]
