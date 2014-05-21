function salida = cruces_por_cero(env)
    salida=sum(abs([(sign(env(:,1:end-1))-sign(env(:,2:end))) sign(env(:,end))])./2)./size(env,1);
end
