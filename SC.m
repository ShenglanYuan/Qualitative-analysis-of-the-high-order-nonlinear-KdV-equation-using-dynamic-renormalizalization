% Hamiltonian
figure
fsize=15;
ezsurfc('(y^2-v^2)/2+v^3/3',[-2,2]);
set(gca,'XTick',-2:1:2,'FontSize',fsize)
set(gca,'YTick',-2:1:2,'FontSize',fsize)
xlabel('\phi','FontSize',fsize)
ylabel('y','FontSize',fsize)
zlabel('H','FontSize',fsize)
title('Surface and Contour')
