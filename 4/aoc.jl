numbers = []
fields = []
set = []
open("4/input.txt") do f
    global numbers, fields
    numbers = map(x -> parse(Int, x),  split(readline(f),  ","))
    curField = zeros(Int, (5,5))
    readline(f)
    i = 1
    while !eof(f)
        l = readline(f)

        if l == ""
            push!(fields, curField)
            push!(set, zeros(Int, (5,5)))
            curField = zeros(Int, (5,5))
            i = 1
            continue
        end

        curField[i,:] = map(x -> parse(Int, x), filter(x -> x != "", split(l, " ")))
        i += 1
        #println(map(x -> parse(UInt, x), filter(x -> x != "", split(l, " "))))

    end
    push!(fields, curField)
    push!(set, zeros(Int, (5,5)))
end

function checkBingo()
    winningBoards = []
    for i in 1:length(set)
        for j in 1:5
            if sum(set[i][j,:]) == 5
                push!(winningBoards, i)
            end
            if sum(set[i][:,j]) == 5
                push!(winningBoards, i)
            end
            s1 = set[i][1,1] + set[i][2,2] + set[i][3,3] + set[i][4,4] + set[i][5,5]
            s2 = set[i][1,5] + set[i][2,4] + set[i][3,3] + set[i][4,3] + set[i][5,1]
            if s1 == 5 || s2 == 5
                push!(winningBoards, i)
            end
        end
    end
    return winningBoards
end

function fillField()
    for i in numbers
        for j in 1:length(fields)
            for k in 1:25
                if fields[j][k] == i
                    set[j][k] = 1
                end
            end
        end
        b = checkBingo()
        if b != -1
            return (b, i)
        end
    end
end

function result1(wT)
    fN, lN = wT
    wB = fields[fN]
    wS = set[fN]
    s = 0

    for i in 1:25
        if wS[i] == 0
            s += wB[i]
        end
    end

    return s * lN
end

function deleteArray(arr, ind)
    newArray = []
    for i in 1:length(arr)
        if i == ind
            continue
        end
        push!(newArray, arr[i])
    end
    newArray
end

function deleteField()
    global fields, set
    for i in numbers
        for j in 1:length(fields)
            for k in 1:25
                if fields[j][k] == i
                    set[j][k] = 1
                end
            end
        end
        b = checkBingo()
        if length(fields) == 1 && b != []
            return (fields[1], set[1], i)
        end

        if b != []
            for bi in b
                fields = deleteArray(fields, bi)
                set = deleteArray(set, bi)
            end
        end

    end
end

function result2(wT)
    lB, lS, lN = wT
    s = 0

    for i in 1:25
        if lS[i] == 0 && lB[i] != lN
            s += lB[i]
        end
    end

    return s * lN
end