lanternfishs = []

open("6/input.txt") do f
    global lanternfishs
    lanternfishs = []
    lanternfishs = split(readline(f), ",")
    lanternfishs = map(x -> parse(UInt8, x), lanternfishs)
end

function simulate1(arr, days)
    for _ in 1:days
        newArr = []
        for f in arr
            if f == 0
                push!(newArr, 6)
                push!(newArr, 8)
            else
                push!(newArr, f-1)
            end
        end
        arr = newArr
    end
    length(arr)
end

function simulate2(arr, days)
    dayCount = zeros(UInt128, 9)
    for f in arr
        dayCount[f+1] += 1
    end

    for _ in 1:days
        old = 0
        for d in 9:-1:2
            temp = dayCount[d]
            dayCount[d] = old
            old = temp
        end

        dayCount[9] = dayCount[1]
        dayCount[7] += dayCount[1]
        dayCount[1] = old

    end
    sum(dayCount)
end
