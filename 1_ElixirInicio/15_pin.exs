x = 5
IO.inspect(x)

x = 10
IO.inspect(x)

^x = 10
IO.inspect(x)

# ** (MatchError) no match of right hand side value: 5
# ^x = 5
# IO.inspect(x)

{:ok, ^x} = {:ok, 10}

{:ok, ^x, y} = {:ok, 10, 20}
IO.inspect(y)

# ** (MatchError) no match of right hand side value: {:ok, 1, 20}
# {:ok, ^x, y} = {:ok, 1, 20}
