def parse_reports_from_file
    file = File.open("puzzle_input.txt")
    file.readlines.map do |line|
        levels = line.chomp.split(" ").map {|n| n.to_i}
    end
end

# Gets diff between 2 adjacentlevels of a report
def get_diff(i, report)
    # Bounds check, if there's only one report then there's no change
    return 0 if report.length == 1
    curr_level = report[i]
    next_level = report[i+1]
    
    return curr_level - next_level
end

# Diff needs to be within bounds of 1 & 3
def validate_diff(diff)
    return diff.abs >= 1 && diff.abs <= 3
end

def get_trend(diff)
    # Using the combined comparison operator
    # If the difference is pos, it will return 1
    # if the diff is neg, it will return -1
    # if the diff is 0, it will return 0
    return diff <=> 0
end

def get_safety_count(reports)
    safety_count = 0
    reports.each do |report|
        is_safe = true

        diff = get_diff(0, report)
        og_trend = get_trend(diff)

        for i in 0..report.length do
            break if i + 1 >= report.length

            diff = get_diff(i, report)
            unless validate_diff(diff)
                is_safe = false
                break
            end

            curr_trend = get_trend(diff)
            is_safe = false if curr_trend != og_trend
        end

        safety_count+= 1 if is_safe
    end
    
    safety_count
end

reports = parse_reports_from_file
pp get_safety_count(reports)