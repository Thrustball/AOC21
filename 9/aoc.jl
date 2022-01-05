heights = []

open("9/inputSmall.txt") do f
    global heights
    heights = []
    while !eof(f)
        c = readline(f)
        c = split(c, "")
        c = map(x -> parse(UInt8, x), c)
        push!(heights, c)
    end
end

function checkField(x,y)
    yMax = length(heights)
    xMax = length(heights[1])
    val = heights[y][x]


    r = true

    if x > 1
        if heights[y][x-1] <= val
            r = false
        end
    end

    if y > 1
        if heights[y-1][x] <= val
            r = false
        end
    end

    if x < xMax
        if heights[y][x+1] <= val
            r = false
        end
    end

    if y < yMax
        if heights[y+1][x] <= val
            r = false
        end
    end
    r
end

function solve1()
    yMax = length(heights)
    xMax = length(heights[1])

    s = 0

    for y in 1:yMax
        for x in 1:xMax
            if checkField(x,y)
                s += heights[y][x] + 1
            end
        end
    end
    s
end

function countBasing(x,y,l)

    if ((x,y) in l)
        return []
    end

    push!(l, (x,y))

    yMax = length(heights)
    xMax = length(heights[1])
    val = heights[y][x]
    r = []
    c = false

    if x > 1
        if 9 > heights[y][x-1] > val && !((x-1,y) in l) && val != 9
            # r = countBasing(x-1, y, l)
            # append!(l, r)
            push!(r, (x-1,y))
            c = true
        end
    end

    if y > 1
        if 9 > heights[y-1][x] > val && !((x,y-1) in l) && val != 9
            # r = countBasing(x, y-1, l)
            # append!(l, r)
            push!(r, (x,y-1))
            c = true
        end
    end

    if x < xMax
        if 9 > heights[y][x+1] > val && !((x+1,y) in l) && val != 9
            # r = countBasing(x+1, y, l)
            # append!(l, r)
            push!(r, (x+1,y))
            c = true
        end
    end

    if y < yMax
        if 9 > heights[y+1][x] > val && !((x,y+1) in l)
            # r = countBasing(x, y+1, l)
            # append!(l, r)
            push!(r, (x,y+1))
            c = true
        end
    end

    for x in r
        if !(x in l)
            cx, cy = x
            r1 = countBasing(cx, cy, l)
            filter!(x -> !(x in l),  r1)
            append!(l, r1)
        end
    end

    l
end

function solve2()
    yMax = length(heights)
    xMax = length(heights[1])

    basSize = []

    for y in 1:yMax
        for x in 1:xMax
            if checkField(x,y)
                l = countBasing(x,y,[])
                push!(basSize, l)
            end
        end
    end
    basSize
end
