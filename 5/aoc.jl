vents = []
xMax, yMax = 1000, 1000
open("5/input.txt") do f
    global vents
    while !eof(f)
        s = readline(f)
        s = split(s, " ")
        s1 = split(s[1], ",")
        s2 = split(s[3], ",")
        x1 = parse(UInt, s1[1])
        y1 = parse(UInt, s1[2])
        x2 = parse(UInt, s2[1])
        y2 = parse(UInt, s2[2])
        push!(vents, ((x1, y1), (x2, y2)))
    end
end

playfield = zeros((xMax, yMax))

function markFields(x1, y1, x2, y2)
    # if x2 < x1
    #     x1, x2 = x2, x1
    # end
    #
    # if y2 < y1
    #     y1, y2 = y2, y1
    # end
    while true

        playfield[x1+1, y1+1] += 1
        if x1 == x2 && y1 == y2
            break
        end
        if x1 != x2
            if x1 < x2
                x1 += 1
            else
                x1 -= 1
            end
        end
        if y1 != y2
            if y1 < y2
                y1 += 1
            else
                y1 -= 1
            end
        end


    end
end

function printField()
    for x in 0:xMax-1
        for y in 0:yMax-1
            cV = playfield[y+1, x+1]
            if cV == 0
                print(". ")
            else
                print(convert(Int, cV), " ")
            end
        end
        println()
    end
end

function markFieldsL()
    for v in vents
        ((x1, y1), (x2, y2)) = v
        markFields(x1,y1,x2,y2)
    end
end

markFieldsL()

a = length(filter((x) -> x >= 2, playfield))
