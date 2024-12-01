
location_ids_1 = []
location_ids_2 = []

File.foreach("puzzle_input.txt") do |line|
    location_ids = line.chomp.split("   ")

    location_ids_1.push(location_ids[0].to_i)
    location_ids_2.push(location_ids[1].to_i)
end

location_ids_1 = location_ids_1.sort
location_ids_2 = location_ids_2.sort

total_distance = 0

# We know the lists are the same size
location_ids_1.length.times do |i|
    dist = location_ids_1[i] - location_ids_2[i]
    total_distance += dist.abs
end

pp total_distance
