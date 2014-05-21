function h = ventanal(ventana, longitud)
    if strcmp(ventana,'rectwin')
        h = rectwin(longitud);
    end
    if strcmp(ventana,'hamming')
        h = hamming(longitud);
    end
    if strcmp(ventana,'hanning')
        h = hanning(longitud);
    end
    if strcmp(ventana,'barlett')
        h = barlett(longitud);
    end
    if strcmp(ventana,'blackman')
        h = blackman(longitud);
    end
    if strcmp(ventana,'boxcar')
        h = boxcar(longitud);
    end
    if strcmp(ventana,'triang')
        h = triang(longitud);
    end
    if strcmp(ventana,'gausswin')
        h = gausswin(longitud);
    end
    if strcmp(ventana,'blackmanharris')
        h = blackmanharris(longitud);
    end
end