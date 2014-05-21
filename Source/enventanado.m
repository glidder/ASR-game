function segmentos_enventanados = enventanado(segmentos, ventana)
    h = ventanal(ventana, size(segmentos,1));
    nMuestras = size(segmentos, 2);
    segmentos_enventanados = zeros(size(segmentos, 1), size(segmentos, 2));
    for i = 1 : nMuestras
        segmentos_enventanados(:, i) = segmentos(:, i) .* h;
    end
end
