circuit Manchester_Encoding :
  module Manchester_Encoding :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<1>
    input io_start : UInt<1>
    output io_out : UInt<8>

    reg state : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state) @[Task2.scala 13:20]
    reg waveReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), waveReg) @[Task2.scala 14:21]
    node _T = eq(UInt<1>("h0"), state) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_start, UInt<1>("h1"), state) @[Task2.scala 18:24 Task2.scala 19:19 Task2.scala 13:20]
    node _GEN_1 = mux(io_start, UInt<1>("h0"), waveReg) @[Task2.scala 18:24 Task2.scala 15:8 Task2.scala 22:20]
    node _T_1 = eq(UInt<1>("h1"), state) @[Conditional.scala 37:30]
    node _T_2 = eq(io_start, UInt<1>("h0")) @[Task2.scala 26:14]
    node _waveReg_T = shl(waveReg, 1) @[Task2.scala 30:33]
    node _waveReg_T_1 = or(_waveReg_T, io_in) @[Task2.scala 30:39]
    node _GEN_2 = mux(_T_2, UInt<1>("h0"), state) @[Task2.scala 26:24 Task2.scala 27:19 Task2.scala 13:20]
    node _GEN_3 = mux(_T_2, waveReg, _waveReg_T_1) @[Task2.scala 26:24 Task2.scala 14:21 Task2.scala 30:21]
    node _GEN_4 = mux(_T_2, UInt<1>("h0"), waveReg) @[Task2.scala 26:24 Task2.scala 15:8 Task2.scala 31:20]
    node _GEN_5 = mux(_T_1, _GEN_2, state) @[Conditional.scala 39:67 Task2.scala 13:20]
    node _GEN_6 = mux(_T_1, _GEN_3, waveReg) @[Conditional.scala 39:67 Task2.scala 14:21]
    node _GEN_7 = mux(_T_1, _GEN_4, UInt<1>("h0")) @[Conditional.scala 39:67 Task2.scala 15:8]
    node _GEN_8 = mux(_T, _GEN_0, _GEN_5) @[Conditional.scala 40:58]
    node _GEN_9 = mux(_T, _GEN_1, _GEN_7) @[Conditional.scala 40:58]
    node _GEN_10 = mux(_T, waveReg, _GEN_6) @[Conditional.scala 40:58 Task2.scala 14:21]
    io_out <= _GEN_9
    state <= mux(reset, UInt<1>("h0"), _GEN_8) @[Task2.scala 13:20 Task2.scala 13:20]
    waveReg <= mux(reset, UInt<8>("h0"), bits(_GEN_10, 7, 0)) @[Task2.scala 14:21 Task2.scala 14:21]
