function concef= delta(cepstrum, p)
	[n_filas, n_columnas] = size(cepstrum);
	mascara=zeros(1,2*p+n_columnas);
	mascara(p+1:p+n_columnas) = 1;

	lceps = [zeros(n_filas, p) cepstrum zeros(n_filas, p)];

	vector_p = -p:p;
	matriz_p = repmat(vector_p, n_filas, 1);

	contador = 1;
	for i=p+1:n_columnas+p
		ind = vector_p + i;
		num = sum(lceps(:, ind).*matriz_p, 2);
		den = sum((mascara(1, ind).*vector_p).^2, 2);
		C(:, contador) = num./den;
		contador = contador + 1;
	end

	coeficientes_delta = C;
	concef=[cepstrum;coeficientes_delta];
end
