
location_ids_1 = []
location_ids_2 = []

# Parse the lines into arrays
File.foreach("puzzle_input.txt") do |line|
    location_ids = line.chomp.split("   ")

    location_ids_1.push(location_ids[0].to_i)
    location_ids_2.push(location_ids[1].to_i)
end

# Build up a frequency hash
location_id_freq = {}
location_ids_2.each do |id|
    # Check if
    freq = location_id_freq.fetch(id, nil)
    if freq == nil
        location_id_freq[id] = 1
    else
        location_id_freq[id] += 1
    end
end

# Now to calculate the similarity score
# iterate over every element in the first list
similarity_score = 0
location_ids_1.each do |id|
    freq = location_id_freq.fetch(id, 0)
    similarity_score += id * freq
end

pp similarity_score