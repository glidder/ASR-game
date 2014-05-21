function value=DTW(p, t)
	DTWs=zeros(size(p,2),size(t,2));
	for i=2:size(p,2)
		DTWs(i,1)=inf;
	end
	for j=2:size(t,2)
		DTWs(1,j)=inf;
	DTWs(1,1)=0;
	end
	
	for i=2:size(p,2)
		for j=2:size(t,2)
			dist=norm(p(:,i)-t(:,j));
			DTWs(i,j)=dist+min([DTWs(i-1,j) DTWs(i,j-1) DTWs(i-1,j-1)]);
		end
	end
	value=DTWs(size(p,2),size(t,2));
end
