function senal = preenfasis(senal, a)
    senal = filter(1 - a, 1, abs(senal));
end

