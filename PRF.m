% program to find given rational function is a PRF or not
clc
clear
t=0;k=0;l=0;denomi=0;answer=0;answer2=0;check=0;answer3=0;
fprintf('\nZ(s)=N(s)/D(s)');
fprintf('\nconditions that will be checked are :\n1.Z(s) is real for real s\n2.(N(s)+D(s)) is HURWITZ');
fprintf('\n3.D(s) is HURWITZ\n4.Poles on Imag Axis are SIMPLE\n5.Residue of poles on Imag Axis are real and positive');
fprintf('\n6.Residue of poles on Imag Axis are complex conjugate(two pure reals are also cosidered complex conjugate)');
fprintf('\n7.Re(Z(jw))>0 for all w');
n=input('\n\nenter numerator coefficients ');
d=input('enter denominator coefficients ');
d2=d;
n2=n;
if(length(n)>length(d))
    len=length(d);
    for k=1:length(d)
        temp(k)=d(k);
    end
    for k=1:length(n)
        d(k)=0;
    end
    for k=1:len
        d(length(n)-len+k)=temp(k);
    end
end
if(length(d)>length(n))
    len=length(n);
    for k=1:length(n)
        temp(k)=n(k);
    end
    for k=1:length(d)
        n(k)=0;
    end
    for k=1:len
        n(length(d)-len+k)=temp(k);
    end
end
den=roots(d);
z=n+d;
q=0;
r=roots(z);
for k=1:length(den)
    if(real(den(k))>0.000000000000001)   %exact checking with zero gave some error
        denomi=1;                        %of positive zero and negative zero thus
        break;                           %checking with minimum possible lower limit
    end
end
for k=1:length(r)
    if(real(r(k))>-0.000000000000001)
        q=1;
        break
    end
end
for k=1:length(z)
    if(real(z(k))~=z(k))
        l=1;
        break
    end
end
[r1,p1,k1]=residue(n,d);
for k=1:length(p1)
    if(real(p1(k))==0)
        for ch=k+1:length(p1)
            if(p1(k)==p1(ch))
                answer=1;
            end
            
        end
        for ch=1:k-1
            if(p1(k)==p1(ch))
                answer=1;
            end
        end
    end
end
for k=1:length(p1)
    if(real(p1(k))==0)
        if(imag(r1(k))~=0||real(r1(k))<0.000000000000001)
            answer2=1;
            break;
        end
    end
end
for k=1:length(p1)
    if(real(p1(k))==0)
        for check=1:length(r1)
            if(imag(r1(k))==-imag(r1(check))&&real(r1(k))==real(r1(check)))
                answer3=answer3+1;
            end
            break;
        end
    end
end
if(l==0)
    fprintf('\npolynomial passed test one ')
else
    fprintf('\npolynomial failed test one ')
end
if(q==0)
    fprintf('\npolynomial passed test two ')
else
    fprintf('\npolynomial failed test two ')
end
if(denomi==0)
    fprintf('\npolynomial passed test three ')
else
    fprintf('\npolynomial failed test three ')
end
if(answer==0)
    fprintf('\npolynomial passed test four ')
else
    fprintf('\npolynomial failed test four ')
end
if(answer2==0)
    fprintf('\npolynomial passed test five ')
else
    fprintf('\npolynomial failed test five ')
end
if(rem(answer3,2)==0)
    fprintf('\npolynomial passed test six ')
else
    fprintf('\npolynomial failed test six ')
end
for k=1:length(n2)
    n2(k)=n2(k)/n2(1);
end
for k=1:length(d2)
    d2(k)=d2(k)/d2(1);
end
if(length(n2)<4&&length(d2)<4)
    if(length(n2)==2&&length(d2)==3)
        if(n2(2)>0&&d2(2)>0&&d2(3)>0&&d2(2)>=n2(2))
            fprintf('\npolynomial passed test 7');
        end
    else if(length(n2)==3&&length(d2)==3)
            if(  n2(2)*d2(2)>= (sqrt(n2(3))-sqrt(d2(3)))^2  )
                fprintf('\npolynomial passed test 7');
                
            end
        end
    end
else fprintf('\nCondition 7 can only be checked for (linear/quadratic) OR (quadratic/quadratic) rational functions\n');
end
