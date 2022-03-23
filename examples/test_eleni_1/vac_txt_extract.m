%%%%% Calculate damage in vacancy.txt

clear
clf

C = dlmread("VACANCY.txt");
i = find ((C(:,1) > 2000) | (C(:,1) == 2000));
i(1) = min(i);
for nn = i(1):(rows(C)),
A(nn-i(1)+1,:)= C(nn,:);
end
l = A(:,1);
Vac_ion = A(:,2);
Vac_rec = A(:,3);
Vac_all = Vac_ion+Vac_rec;
plot(l,Vac_all)
xlabel('Depth (Angstr)','fontsize', 20)
ylabel('Vacancies/(Angstrom-Ion)', 'fontsize', 20)

vac = sum(Vac_all);
cs = vac/(8.48*1e16);

% store data in format [Z Energy dpa]

info_plot = [l Vac_ion Vac_rec];
info = [3 14.0 vac cs]
save('../Li_vac_all.dat', 'info', '-append', '-ascii')
save('Li_damage_all.dat', 'info', '-append', '-ascii')