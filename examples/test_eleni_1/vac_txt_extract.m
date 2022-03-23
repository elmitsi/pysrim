%%%%% Calculate damage in vacancy.txt

clear
clf

C = dlmread("VACANCY.txt");
i = find ((C(:,1) > 400) | (C(:,1) == 400));
i(1) = min(i);
for nn = i(1):(rows(C)),
A(nn-i(1)+1,:)= C(nn,:);
end
l = A(:,1);
Vac_ion = A(:,2);
Vac_rec = A(:,3);
Vac_all = Vac_ion+Vac_rec;
dpa_cs = Vac_all*400/(40000*1e-8*8.48*1e22);
vac_per_ion = Vac_all*400;

%%% range data

R = dlmread("RANGE.txt");
i = find ((R(:,1) > 400) | (R(:,1) == 400));
i(1) = min(i);
for nn = i(1):(rows(R)),
B(nn-i(1)+1,:)= R(nn,:);
end
l2 = B(:,1);
Range_ion = B(:,2);
Range_rec = B(:,3);
Implanted_all = Range_ion+Range_rec;


plotyy(l,vac_per_ion,l2,Implanted_all)

vac = sum(Vac_all);
cs = vac/(8.48*1e16);

% store data in format [Z Energy dpa]

info = [5 8.0 vac cs]
%save('../B_vac_all.dat', 'info', '-append', '-ascii')