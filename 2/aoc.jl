course = []
open("./2/input.txt") do f
    global course
    course = readlines(f)
end

function evaluate()
    depth = 0
    horizontalPos = 0
    for c in course
        cs = split(c, " ")
        n = parse(Int, cs[2])
        if cs[1] == "forward"
            horizontalPos += n
        elseif cs[1] == "down"
            depth += n
        elseif cs[1] == "up"
            depth -= n
        end
    end
    depth, horizontalPos
end

function evaluate2()
    depth = 0
    horizontalPos = 0
    aim = 0
    for c in course
        cs = split(c, " ")
        n = parse(Int, cs[2])
        if cs[1] == "forward"
            horizontalPos += n
            depth += (n * aim)
        elseif cs[1] == "down"
            aim += n
        elseif cs[1] == "up"
            aim -= n
        end
    end
    depth, horizontalPos
end