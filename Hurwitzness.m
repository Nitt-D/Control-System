% Program to check Hurwitzness(not strict HURWITZNESS) of a Polynomial
clear;clc;
p=input('input coefficient matrix ');
r=roots(p);
q=1;g=1;
for k=1:length(p)
    if(real(p(k))~=p(k))  %condition F(s) is real for real s
        g=0;
        break
    end
end
for k = 1:length(r)
    
    if(real(r(k)) > -0.000000000000001)  %condition checking roots in RHP..........
        q=0;                            %exact checking with zero gave some error
        break;                          %of positive zero and negative zero thus
                                        %checking with minimum possible lower limit
    end
end
if(g==1)
    fprintf('Function is real for real s\n ')
    
else
    fprintf('Function is not real for real s\n ')
end
if(q==0 && g==1)
    fprintf('non hurwitz');
else if(q==1 && g==1)
        fprintf('hurwitz');
    end
end
c=input('\nDo u want roots y/n  ','s');
if(c=='y'||c=='Y')
    fprintf('roots are : ');
    for k=1:length(r)
        r(k)                                %roots of function F(s)
    end
end
