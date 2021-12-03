diagnostics = []
open("3/input.txt") do f
    global diagnostics
    diagnostics = readlines(f)
end

function binaryToDecimal(s)
    sr = reverse(s)
    i = 0
    result = 0
    for s in sr
        if s == '1'
            result += 2^i
        end
        i+=1
    end
    result
end

function getPower()
    sl = length(diagnostics[1])
    gamma = ""
    epsilon = ""
    for i in 1:sl
        o = 0
        z = 0
        for dn in diagnostics
            if dn[i] == '1'
                o += 1
            elseif dn[i] == '0'
                z += 1
            end
        end
        if o > z
            gamma = gamma * "1"
            epsilon = epsilon * "0"
        else
            gamma = gamma * "0"
            epsilon = epsilon * "1"
        end

    end
    binaryToDecimal(gamma) * binaryToDecimal(epsilon)
end

function getOxygenRating()
    sl = length(diagnostics[1])
    oxygen = diagnostics
    for i in 1:sl
        o = 0
        z = 0
        for dn in diagnostics
            if dn[i] == '1'
                o += 1
            elseif dn[i] == '0'
                z += 1
            end
        end
        if o >= z
            oxygen = filter((x) -> x[i] == '1', oxygen)
        else
            oxygen = filter((x) -> x[i] == '0', oxygen)
        end

        if length(oxygen) == 1
            return oxygen[1]
        end
    end
    # binaryToDecimal(gamma) * binaryToDecimal(epsilon)
end

function getCO2Rating()
    sl = length(diagnostics[1])
    oxygen = diagnostics
    for i in 1:sl
        o = 0
        z = 0
        for dn in diagnostics
            if dn[i] == '1'
                o += 1
            elseif dn[i] == '0'
                z += 1
            end
        end
        if o < z
            oxygen = filter((x) -> x[i] == '1', oxygen)
        else
            oxygen = filter((x) -> x[i] == '0', oxygen)
        end

        if length(oxygen) == 1
            return oxygen[1]
        end
    end
    # binaryToDecimal(gamma) * binaryToDecimal(epsilon)
end