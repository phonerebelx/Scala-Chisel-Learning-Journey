circuit shift_reg_with_parallel_load :
  module shift_reg_with_parallel_load :
    input clock : Clock
    input reset : UInt<1>
    output io_out_0 : UInt<1>
    output io_out_1 : UInt<1>
    output io_out_2 : UInt<1>
    output io_out_3 : UInt<1>
    input io_load_in_0 : UInt<1>
    input io_load_in_1 : UInt<1>
    input io_load_in_2 : UInt<1>
    input io_load_in_3 : UInt<1>
    input io_in : UInt<1>
    input io_load : UInt<1>

    node mux1 = mux(io_load, io_load_in_0, io_in) @[task3.scala 14:15]
    node mux2 = mux(io_load, io_load_in_1, mux1) @[task3.scala 15:15]
    node mux3 = mux(io_load, io_load_in_2, mux2) @[task3.scala 16:15]
    node mux4 = mux(io_load, io_load_in_3, mux3) @[task3.scala 17:15]
    reg reg_1 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), reg_1) @[task3.scala 18:22]
    reg reg_2 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), reg_2) @[task3.scala 19:21]
    reg reg_3 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), reg_3) @[task3.scala 20:20]
    reg reg_4 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), reg_4) @[task3.scala 21:20]
    io_out_0 <= bits(reg_1, 0, 0) @[task3.scala 26:11]
    io_out_1 <= bits(reg_2, 0, 0) @[task3.scala 27:11]
    io_out_2 <= bits(reg_3, 0, 0) @[task3.scala 28:11]
    io_out_3 <= bits(reg_4, 0, 0) @[task3.scala 29:11]
    reg_1 <= mux(reset, UInt<3>("h0"), mux1) @[task3.scala 18:22 task3.scala 18:22 task3.scala 22:7]
    reg_2 <= mux(reset, UInt<3>("h0"), mux2) @[task3.scala 19:21 task3.scala 19:21 task3.scala 23:7]
    reg_3 <= mux(reset, UInt<3>("h0"), mux3) @[task3.scala 20:20 task3.scala 20:20 task3.scala 24:7]
    reg_4 <= mux(reset, UInt<3>("h0"), mux4) @[task3.scala 21:20 task3.scala 21:20 task3.scala 25:7]
