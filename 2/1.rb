def parse_reports_from_file
    file = File.open("sample_input.txt")
    file.readlines.map do |line|
        levels = line.chomp.split(" ").map {|n| n.to_i}
    end
end

def get_trend(i, report)
    # Bounds check, if there's only one report or smth then there's no change
    return 0 if report.length == 1
    curr_level = report[i]
    next_level = report[i+1]
    diff = curr_level - next_level
    # Using the combined comparison operator
    # If the difference is pos, it will return 1
    # if the diff is neg, it will return -1
    # if the diff is 0, it will return 0
    return diff <=> 0
end

def get_safety_count(reports)
    safety_count = 0
    reports.each do |report|
        # you need the length and you need the index to access
        is_safe = true
        og_trend = get_trend(0, report)
        for i in 0..report.length do
            break if i + 1 >= report.length
            curr_trend = get_trend(i, report)

            if curr_trend != og_trend
                is_safe = false
            end
        end

        safety_count+= 1 if is_safe
    end
    
    safety_count
end

reports = parse_reports_from_file
pp get_safety_count(reports)



