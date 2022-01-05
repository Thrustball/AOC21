inputOne = []

open("8/inputSmall.txt") do f
    global inputOne
    inputOne = []
    while !eof(f)
        cL = readline(f)
        c1 = split(cL, "|")[1]
        cR = split(cL, "|")[2]
        cT1 = split(c1, " ")[1:end-1]
        cT = split(cR, " ")[2:end]
        push!(inputOne, ((cT1),(cT)))
    end
end

function solve1()
    c = 0
    for i in inputOne
        for j in i
            if length(j) in [2,4,3,7]
                c += 1
            end
        end
    end
    c
end

function solve2()
