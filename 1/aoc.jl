depths = []

open("input.txt") do f
    global depths
    depths = readlines(f)
    depths = map(e->parse(UInt, e), depths)
end

# println(typeof(depths[1]))

function result(depthArr)
    co = 0
    for i in 1:(length(depthArr)-1)
        if depthArr[i] < depthArr[i+1]
            co += 1
        end
    end
    co
end

# println(result())

function makeSlidingSum()
    slidingDepth = []
    for i in 1:(length(depths)-2)
        s = depths[i] + depths[i+1] + depths[i+2]
        push!(slidingDepth, s)
    end
    slidingDepth
end

println(result(makeSlidingSum()))