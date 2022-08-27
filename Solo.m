clear;
sys = @(t,x) [x(2);x(1)-(x(1))^2];
vectorfield(sys,-2:.1:2,-2:.1:2)
hold on
for x0=-2:.1:2
for y0=-2:.1:2
[ts,xs] = ode45(sys,[0 2],[x0 y0]);
plot(xs(:,1),xs(:,2))
end
end
for x0=-2:.1:2
for y0=-2:.1:2
[ts,xs] = ode45(sys,[0 -2],[x0 y0]);
plot(xs(:,1),xs(:,2))
end
end
hold off
axis([-2 2 -2 2])
fsize=15;
set(gca,'XTick',-2:.5:2,'FontSize',fsize)
set(gca,'YTick',-2:.5:2,'FontSize',fsize)
xlabel('\phi','FontSize',fsize)
ylabel('y','FontSize',fsize)
hold off