circuit My_State_Machine :
  module My_State_Machine :
    input clock : Clock
    input reset : UInt<1>
    input io_f1 : UInt<1>
    input io_f2 : UInt<1>
    input io_r1 : UInt<1>
    input io_r2 : UInt<1>
    output io_out : UInt<8>

    reg state : UInt<3>, clock with :
      reset => (UInt<1>("h0"), state) @[Task1.scala 17:21]
    node _T = eq(UInt<3>("h0"), state) @[Conditional.scala 37:30]
    node _T_1 = eq(io_f1, UInt<1>("h0")) @[Task1.scala 21:15]
    node _T_2 = eq(io_f2, UInt<1>("h0")) @[Task1.scala 21:24]
    node _T_3 = and(_T_1, _T_2) @[Task1.scala 21:22]
    node _GEN_0 = mux(io_f1, UInt<3>("h1"), UInt<3>("h5")) @[Task1.scala 24:25 Task1.scala 25:18 Task1.scala 28:18]
    node _GEN_1 = mux(_T_3, UInt<3>("h0"), _GEN_0) @[Task1.scala 21:31 Task1.scala 22:19]
    node _T_4 = eq(UInt<3>("h1"), state) @[Conditional.scala 37:30]
    node _T_5 = eq(io_r1, UInt<1>("h0")) @[Task1.scala 33:14]
    node _T_6 = eq(io_f1, UInt<1>("h0")) @[Task1.scala 33:23]
    node _T_7 = and(_T_5, _T_6) @[Task1.scala 33:21]
    node _GEN_2 = mux(io_r1, UInt<3>("h0"), UInt<3>("h2")) @[Task1.scala 36:25 Task1.scala 37:19 Task1.scala 40:19]
    node _GEN_3 = mux(_T_7, UInt<3>("h1"), _GEN_2) @[Task1.scala 33:30 Task1.scala 34:19]
    node _T_8 = eq(UInt<3>("h2"), state) @[Conditional.scala 37:30]
    node _T_9 = eq(io_r1, UInt<1>("h0")) @[Task1.scala 44:14]
    node _T_10 = eq(io_f1, UInt<1>("h0")) @[Task1.scala 44:23]
    node _T_11 = and(_T_9, _T_10) @[Task1.scala 44:21]
    node _GEN_4 = mux(io_r1, UInt<3>("h1"), UInt<3>("h3")) @[Task1.scala 48:25 Task1.scala 49:19 Task1.scala 53:19]
    node _GEN_5 = mux(io_r1, UInt<2>("h3"), UInt<2>("h3")) @[Task1.scala 48:25 Task1.scala 50:20 Task1.scala 54:20]
    node _GEN_6 = mux(_T_11, UInt<3>("h2"), _GEN_4) @[Task1.scala 44:30 Task1.scala 45:19]
    node _GEN_7 = mux(_T_11, UInt<2>("h3"), _GEN_5) @[Task1.scala 44:30 Task1.scala 46:20]
    node _T_12 = eq(UInt<3>("h3"), state) @[Conditional.scala 37:30]
    node _T_13 = eq(UInt<3>("h4"), state) @[Conditional.scala 37:30]
    node _T_14 = eq(io_r2, UInt<1>("h0")) @[Task1.scala 62:14]
    node _T_15 = eq(io_f2, UInt<1>("h0")) @[Task1.scala 62:23]
    node _T_16 = and(_T_14, _T_15) @[Task1.scala 62:21]
    node _GEN_8 = mux(io_r2, UInt<3>("h5"), UInt<3>("h3")) @[Task1.scala 65:26 Task1.scala 66:19 Task1.scala 69:19]
    node _GEN_9 = mux(io_r2, UInt<3>("h7"), UInt<3>("h7")) @[Task1.scala 65:26 Task1.scala 67:20 Task1.scala 70:20]
    node _GEN_10 = mux(_T_16, UInt<3>("h4"), _GEN_8) @[Task1.scala 62:30 Task1.scala 63:19]
    node _GEN_11 = mux(_T_16, UInt<3>("h7"), _GEN_9) @[Task1.scala 62:30 Task1.scala 64:20]
    node _T_17 = eq(UInt<3>("h5"), state) @[Conditional.scala 37:30]
    node _T_18 = eq(io_r2, UInt<1>("h0")) @[Task1.scala 73:14]
    node _T_19 = eq(io_f2, UInt<1>("h0")) @[Task1.scala 73:23]
    node _T_20 = and(_T_18, _T_19) @[Task1.scala 73:21]
    node _GEN_12 = mux(io_r2, UInt<3>("h4"), state) @[Task1.scala 78:26 Task1.scala 79:18 Task1.scala 17:21]
    node _GEN_13 = mux(io_f2, UInt<3>("h4"), _GEN_12) @[Task1.scala 75:26 Task1.scala 76:18]
    node _GEN_14 = mux(_T_20, UInt<3>("h5"), _GEN_13) @[Task1.scala 73:30 Task1.scala 74:19]
    node _GEN_15 = mux(_T_17, _GEN_14, state) @[Conditional.scala 39:67 Task1.scala 17:21]
    node _GEN_16 = mux(_T_13, _GEN_10, _GEN_15) @[Conditional.scala 39:67]
    node _GEN_17 = mux(_T_13, _GEN_11, UInt<1>("h0")) @[Conditional.scala 39:67 Task1.scala 18:8]
    node _GEN_18 = mux(_T_12, UInt<3>("h0"), _GEN_16) @[Conditional.scala 39:67 Task1.scala 59:15]
    node _GEN_19 = mux(_T_12, UInt<1>("h0"), _GEN_17) @[Conditional.scala 39:67 Task1.scala 18:8]
    node _GEN_20 = mux(_T_8, _GEN_6, _GEN_18) @[Conditional.scala 39:67]
    node _GEN_21 = mux(_T_8, _GEN_7, _GEN_19) @[Conditional.scala 39:67]
    node _GEN_22 = mux(_T_4, _GEN_3, _GEN_20) @[Conditional.scala 39:67]
    node _GEN_23 = mux(_T_4, UInt<1>("h0"), _GEN_21) @[Conditional.scala 39:67 Task1.scala 18:8]
    node _GEN_24 = mux(_T, _GEN_1, _GEN_22) @[Conditional.scala 40:58]
    node _GEN_25 = mux(_T, UInt<1>("h0"), _GEN_23) @[Conditional.scala 40:58 Task1.scala 18:8]
    io_out <= _GEN_25
    state <= mux(reset, UInt<3>("h0"), _GEN_24) @[Task1.scala 17:21 Task1.scala 17:21]
