clc
clear
n=0
y2=0
while(1)
    t=0:.1:10
    y1=((4)/(n*pi))*sin(n*t);
    y2=y2+y1;
    plot(y1)
    n=n+2
    hold on
    if(n==20)
        break
    end
end
hold on
plot(y2)