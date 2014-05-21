function ceps=cepstrum (senv, limite)
	aux = rceps(senv);
	ceps = aux(2 : limite, :);
end
