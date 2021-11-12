;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Router : 
  module Router : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inp : {data : SInt<32>, types : UInt<5>}, out : {data : SInt<32>, types : UInt<5>}}
    
    io.out.types <= io.inp.types @[lab5.scala 25:12]
    io.out.data <= io.inp.data @[lab5.scala 25:12]
    
