;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Router : 
  module Router : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {databits : UInt<32>, addressbits : UInt<5>}, out : {databits : UInt<32>, addressbits : UInt<5>}}
    
    io.out.addressbits <= io.in.addressbits @[Router_packet.scala 16:12]
    io.out.databits <= io.in.databits @[Router_packet.scala 16:12]
    
