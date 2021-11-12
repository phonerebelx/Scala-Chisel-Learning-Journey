circuit Router :
  module Router :
    input clock : Clock
    input reset : UInt<1>
    input io_in_databits : UInt<32>
    input io_in_addressbits : UInt<5>
    output io_out_databits : UInt<32>
    output io_out_addressbits : UInt<5>

    io_out_databits <= io_in_databits @[Router_packet.scala 16:12]
    io_out_addressbits <= io_in_addressbits @[Router_packet.scala 16:12]
