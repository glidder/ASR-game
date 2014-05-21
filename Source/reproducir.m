function [] = reproducir(senal, freq)
    if nargin<2
           freq=8000;
    end
	if isunix
        soundsc(senal,freq);
    else 
    	wavplay(senal,freq);
    end
end

