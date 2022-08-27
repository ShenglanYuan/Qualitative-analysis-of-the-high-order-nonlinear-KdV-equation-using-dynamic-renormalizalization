clear;
clc;

xmin=-20;
xmax=20;
tmin=0;
tmax=10;

% global deltax A1 A2 p

%%% discretization
Nx=400;
xlin=linspace(xmin,xmax,Nx);
deltax=xlin(2)-xlin(1);
Nt=10000;
h=(tmax-tmin)/Nt;

%%% system parameters
p=2;
c=1;

%%% initialization
u0=(c*(p+1)/2*(sech(sqrt(c)*(p-1)/2*xlin)).^2).^(1/(p-1));
% figure;
% plot(xlin,u0);

A1=zeros(Nx,Nx);
% A1(1,1)=1;
% A1(end,end)=-1;
A1(3:end,1:end-2)=A1(3:end,1:end-2)-eye(Nx-2);
A1(2:end,1:end-1)=A1(2:end,1:end-1)+2*eye(Nx-1);
A1(1:end-1,2:end)=A1(1:end-1,2:end)-2*eye(Nx-1);
A1(1:end-2,3:end)=A1(1:end-2,3:end)+eye(Nx-2);

A2=zeros(Nx,Nx);
% A2(1,1)=-1;
% A2(end,end)=1;
A2(2:end,1:end-1)=A2(2:end,1:end-1)-eye(Nx-1);
A2(1:end-1,2:end)=A2(1:end-1,2:end)+eye(Nx-1);

A=eye(Nx)+h/2/deltax^3*A1;

% u=zeros(Nx,Nt+1);
% u(:,1)=u0';
u=u0';
u1=u0';
for i=1:Nt
    u2=A\u1-h/2/deltax*p*(A\A2*u1).*u1.^(p-1);
%     u(:,i+1)=u2;
    u1=u2;
    if mod(i,Nt/10)==1
        u=[u u2];
    end
end


figure;
for i=1:11
    plot(xlin,u(:,i));
    hold on
end
hold off

% syms x t c p
% u=(c*(p+1)/2*(sech(sqrt(c)*(p-1)/2*(x-c*t)))^2)^(1/(p-1));
% ux=gradient(u,x);
% uxx=gradient(ux,x);
% uxxx=gradient(uxx,x);
% upx=gradient(u^p,x);
% ut=gradient(u,t);
