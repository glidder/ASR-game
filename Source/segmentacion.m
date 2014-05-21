function segmentos = segmentacion(senal, num_muestras, despl)
    num_segmentos = ceil((size(senal, 1) - num_muestras) / despl) + 1;
    posicion = 1;
    segmentos = zeros(num_muestras, num_segmentos);
    for i = 1 : num_segmentos
        segmentos(:, i) = senal(posicion : posicion + num_muestras - 1);
        posicion = posicion + despl;
    end
end

