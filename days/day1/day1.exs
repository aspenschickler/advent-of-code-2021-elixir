{:ok, contents} = File.read("days/day1/input.txt")
IO.puts "Day 1\n------"
IO.puts "Part 1"
contents
|> String.split("\n")
|> Enum.map(&String.to_integer/1)
|> Enum.chunk_every(2, 1, :discard)
|> Enum.count(fn [a, b] -> b > a end)
|> IO.inspect()

IO.puts "Part 2"
contents
|> String.split("\n")
|> Enum.map(&String.to_integer/1)
|> Enum.chunk_every(4, 1, :discard)
|> Enum.count(fn [a, b, c, d] -> b + c + d > a + b + c end)
|> IO.inspect()

IO.puts "\n"