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


def report_safety_check(report, og_trend)
    is_safe = true
    # iterate through report
    for i in 0..report.length do
        break if i + 1 >= report.length

        diff = get_diff(i, report)
        unless validate_diff(diff)
            is_safe = false
            break
        end

        curr_trend = get_trend(diff)
        if curr_trend != og_trend
            is_safe = false
            break
        end
    end

    is_safe
end

def safety_check_without_unsafe_level(unsafe_index, report)
    cloned_report = report.clone
    cloned_report.delete_at(unsafe_index)

    # og trend needs to update for the new cloned report
    diff = get_diff(0, cloned_report)
    og_trend = get_trend(diff)
    
    return report_safety_check(cloned_report, og_trend)
end

def get_safety_count(reports)
    safety_count = 0
    reports.each do |report|
        is_safe = true

        diff = get_diff(0, report)
        og_trend = get_trend(diff)
        is_safe = report_safety_check(report, og_trend)

        unless is_safe

            for i in 0..report.length do
                if safety_check_without_unsafe_level(i, report)
                    is_safe = true
                    break
                end
            end
        end

        safety_count+= 1 if is_safe
    end
    
    safety_count
end

reports = parse_reports_from_file
pp get_safety_count(reports)