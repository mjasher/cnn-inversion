function [dx1,dx2,n1] = getint(L,dx,x)
%L为区域长度，dx为原始的单元间距，注意节点数=L/dx+1，
% 返回单元信息，间距为dx1的有n1个，则x位于(n1-1)*dx1,注意原点位于第一个节点上，即左边0.5*dx1不算，溶质源对应的节点序号为n1
% ,即满足x = (n1-1)*dx1
% 第一个节点与最后一个节点之间距离为L,x为源坐标
N = round(L/dx);
% dx1 = x/(0.5+floor(x/dx));
% dx2 = (L - x)/(N-floor(x/dx)-0.5);
% n1 = floor(x/dx)+1;
n1 = floor(x/(dx))+1;
dx1 = x./(n1-1);
n2 = N + 1 - n1;
dx2 = (L - (n1-0.5).*dx1)./(n2-0.5);