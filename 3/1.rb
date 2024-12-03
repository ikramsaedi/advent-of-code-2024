sample = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

regex = /mul\((\d+),(\d+)\)/

multiplying_factors = sample.scan(regex)

multiples = multiplying_factors.map do |factors|
  factors[0].to_i * factors[1].to_i
end

pp multiples.sum