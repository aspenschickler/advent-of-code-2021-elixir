

{:ok, contents} = File.read("days/day2/input.txt")
IO.puts "Day 2\n------"
IO.puts "Part 1"
contents
|> String.split("\n")
|> Enum.map(fn s -> String.split(s, " ") end)
|> Enum.map(fn [s, v] -> [s, String.to_integer(v)] end)
|> Enum.map(fn [s, v] -> [s, v, [0,0]] end)
|> Enum.map(fn [s, v, [h, d]] -> case s do
                                    "forward" -> [h + v, d]
                                    "up" -> [h, d - v]
                                    "down" -> [h, d + v]
                                end end)
|> Enum.reduce(fn [h, d], [acc_h, acc_d] -> [h + acc_h, d + acc_d] end)
|> Enum.product()
|> IO.inspect()

IO.puts "Part 2"
contents
|> String.split("\n")
|> Enum.map(fn s -> String.split(s, " ") end)
|> Enum.map(fn [s, v] -> [s, String.to_integer(v)] end)
|> Enum.map(fn [s, v] -> [s, v, [0,0,0]] end)
|> Enum.map(fn [s, v, [h, d, a]] -> case s do
                                    "forward" -> [h + v, d, a]
                                    "up" -> [h, d, a - v]
                                    "down" -> [h, d, a + v]
                                end end)
|> Enum.reduce(fn [h, _, a], [acc_h, acc_d, acc_a] ->
                    [h + acc_h, h * acc_a + acc_d, a + acc_a] end)
|> Enum.take(2)
|> Enum.product()
|> IO.inspect()

IO.puts "\n"