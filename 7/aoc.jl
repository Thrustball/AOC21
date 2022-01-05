crabPos = []
open("7/input.txt") do f
    global crabPos
    crabPos = []
    crabPos = split(readline(f), ",")
    crabPos = map(x -> parse(UInt16, x), crabPos)
end

function solve1()
    ma = maximum(crabPos)
    minFuel = 99999999999
    for i in 0:ma
        curFuel = 0
        for c in crabPos
            curFuel += abs(i-c)
        end
        if curFuel < minFuel
            minFuel = curFuel
        end
    end
    minFuel
end

function solve2()
    ma = maximum(crabPos)
    minFuel = 999999999999999
    for i in 0:ma
        curFuel = 0
        for c in crabPos
            curFuel += sum(1:abs(i-c))
        end
        if curFuel < minFuel
            minFuel = curFuel
        end
    end
    minFuel
end
