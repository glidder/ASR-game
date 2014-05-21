function p=normaliza(coef)
	%m=zeros(size(coef,1),size(coef,2));
	media=repmat(mean(coef),size(coef,1),1);
	des=repmat(std(coef),size(coef,1),1);
	%m(size(coef,1),:)=repmat(mean(coef),;
	%s(size(coef,1),:)=std(coef);
	%p=(coef-m)./s;
	p=(coef-media)./des;
end
