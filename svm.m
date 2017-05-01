B=[1;1];
b=-1/2;
n=input('请输入一个正整数');
f=@(x)x'*B+b;
y=@(x1)-1*x1+1/2;
x1=-1/2:0.1:1;
x2=y(x1);
hold on;
plot(x1,x2,'k');
X=-1/2+3/2*rand(2,n);%%%生成[-1/2,1]*[-1/2,1]范围的点。
x_1=X(1,:);
y_11=X(2,:);
x_11=y(x_1);
x_1=X(1,y_11>=x_11);
y_1=X(2,y_11>=x_11);
x_2=X(1,y_11<x_11);
y_2=X(2,y_11<x_11);
plot(x_1,y_1,'r.',x_2,y_2,'b.');
xlabel('x1');
ylabel('x2');
yj_1=sign(f([x_1;y_1]));
yj_2=sign(f([x_2;y_2]));
X1=[ones(1,size(x_1,2));x_1;y_1]';
X2=[ones(1,size(x_2,2));x_2;y_2]';
C=[1,1,1];
d=0;
A1=[];
A2=[];
for i=1:length(yj_1)
    A1=[A1;yj_1(i)*X1(i,:)];
end
for i=1:length(yj_2)
    A2=[A2;yj_2(i)*X2(i,:)];
end
A=[A1;A2];
b=ones(n,1);
B1=lsqlin(C,d,-A,-b);
B1_x2=-(B1(1)+B1(2)*x1)/B1(3);
B2_x2=-(B1(1)+B1(2)*x1+1)/B1(3);
B3_x2=-(B1(1)+B1(2)*x1-1)/B1(3);
plot(x1,B1_x2,'r',x1,B2_x2,'g-.',x1,B3_x2,'g-.')
hold off;
b0=B1_x2(1);
b1=B1_x2(2:3);
