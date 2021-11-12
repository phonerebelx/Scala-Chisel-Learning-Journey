circuit Router :
  module Router :
    input clock : Clock
    input reset : UInt<1>
    input io_inp_data : SInt<32>
    input io_inp_types : UInt<5>
    output io_out_data : SInt<32>
    output io_out_types : UInt<5>

    io_out_data <= io_inp_data @[lab5.scala 25:12]
    io_out_types <= io_inp_types @[lab5.scala 25:12]
