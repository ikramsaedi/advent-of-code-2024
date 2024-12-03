file = File.open("puzzle_input.txt")

regex = /mul\((\d+),(\d+)\)/
sums = file.readlines.map do |line|
  multiplying_factors = line.scan(regex)

  multiples = multiplying_factors.map do |factors|
    factors[0].to_i * factors[1].to_i
  end

  multiples.sum
end

final_sum = sums.sum

pp final_sum