
# Bitstrings are a sequence of bits. They are used to store binary data.
IO.puts(:math.pow(2,4))

numa = <<14::4>> # 0000 bits
IO.inspect(numa)

numa = <<15::4>>
IO.inspect(numa)

numa = <<16::4>>
IO.inspect(numa)

numa = <<19::4>>
IO.inspect(numa)


num2 = <<19::4, 10::4, 8::4 >>
IO.inspect(num2)

a = <<1::2>> # 01
IO.inspect(a, label: "c en representación binaria")

defmodule BitstringHelper do
  def bitstring_to_binary_string(<<>>), do: ""

  def bitstring_to_binary_string(<<bit::1, rest::bitstring>>) do
  Integer.to_string(bit) <> bitstring_to_binary_string(rest)
  end


  def print_bitstring(bitstring) do
    IO.puts("----------------------bitString -> to binaryString     ---------------------- ")
    binary_string = bitstring_to_binary_string(bitstring)
    IO.inspect(bitstring, label: "bitstring: ")
    IO.puts("Es -> binary_string: #{binary_string}")
  end
end

IO.puts("----------------------Operaciones con bitstrings---------------------- ")
c = <<7::4>>
print = &BitstringHelper.print_bitstring/1

a = <<1::2>> # 01
b = <<3::2>> # 11
c = <<7::4>>
print.(a)
print.(b)
print.(c)

d = <<1::2, 3::2>> # 0101
print.(d)

IO.puts ( d == <<7::4>> )

f = <<19::4, 10::4, 8::4>>
print.(f)

IO.puts("----------------------binary---------------------- ")
# binary es un bitstring que es multiplo de 8
IO.inspect(<<25::8>>)
#omite el size si es multiplo de 8

IO.inspect(<<25::16>>) # 00011001 00000000 -> 25 en binario # 2 bytes de 8 bits

a = <<1::2, 3::2>> # 0101
IO.inspect(a, label: "a")
IO.inspect(is_bitstring(a), label: "is_bitstring(a)")
IO.inspect(is_bitstring(5), label: "is_bitstring(5)")
IO.inspect(is_bitstring(<<5>>), label: "is_bitstring(<<5>>)")
IO.inspect(is_binary(<<5::8>>), label: "is_binary(<<5::8>>)")
IO.inspect(is_binary(<<5::7>>), label: "is_binary(<<5::7>>)")
IO.inspect(is_bitstring("Hola"), label: 'is_bitstring("Hola")')
IO.inspect(is_binary("hola"), label: 'is_binary("hola")')
IO.inspect(is_bitstring('Hola'), label: "is_bitstring('Hola')")

#IO.inspect("Hola") #Data type BitString
#IO.inspect('Hola') #Data type List


#IO.inspect(<<5::4>> ++  <<7::4>>, label: "<<5::4>> <> <<7::4>>")
