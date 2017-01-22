% Fourier Series
clc;
clear;
syms x

fprintf('CONSTANT FUNCTIONS ARE NOT SUPPORTED AT THIS TIME\nFunction should be in form of variable x\nLIMITS ARE IN RADIANS\nFUNCTION SHOULD BE BOUNDED(because of no checking criteria in this program)\n');
n=input('input no. of terms of (an) or (bn) ');
bn=zeros(1,n);an=zeros(1,n);
a0=0;

discontinuity=input('enter no. of discontinuities (0 for no disconuity) ');
if(discontinuity)
    symmetry=input('is function splitting symmetrical  ','s');
    if(symmetry=='y'||'Y')
        lower=input('enter lower limit of whole function ');
        upper=input('enter upper limit of whole function ');
        for loop=0:discontinuity
            fprintf('enter function discretely (i.e. partwise)\n');
            y=input('Enter your function (variable x) \n  ');
            lower=input('enter lower limit of discrete function ');
            upper=input('enter upper limit of discrete function ');
            for k=1:n
                f=y*cos(k*x);
                an(k)=an(k)+(2/((discontinuity+1)*(upper-lower)))*(integral(@(x) eval(vectorize(f)),lower,upper));
            end
            for k=1:n
                f=y*sin(k*x);
                bn(k)=bn(k)+(2/((discontinuity+1)*(upper-lower)))*(integral(@(x) eval(vectorize(f)),lower,upper));
            end
            a0=a0+(1/((discontinuity+1)*(upper-lower)))*(integral(@(x) eval(vectorize(y)),lower,upper));
            
        end
    else
        lower1=input('enter lower limit of whole function ');
        upper1=input('enter upper limit of whole function ');
        for loop=0:discontinuity
            fprintf('enter function discretely (i.e. partwise)\n');
            y=input('Enter your function (variable x) \n  ');
            lower=input('input lower limit(partwise) ');
            upper=input('input upper limit(partwise) ');
            for k=1:n
                f=y*cos(k*x);
                an(k)=an(k)+(integral(@(x) eval(vectorize(f)),lower,upper));
            end
            for k=1:n
                f=y*sin(k*x);
                bn(k)=bn(k)+(integral(@(x) eval(vectorize(f)),lower,upper));
            end
            a0=a0+(integral(@(x) eval(vectorize(y)),lower,upper));
            for k=1:n
                an(k)=an(k)*2/(upper1-lower1);
                bn(k)=bn(k)*2/(upper1-lower1);                
            end
        end
    end
    
else
    y=input('enter function\n');
    lower=input('input lower limit ');
    upper=input('input upper limit ');
    for k=1:n
        f=y*cos(k*x);
        an(k)=an(k)+(2/(upper-lower))*(integral(@(x) eval(vectorize(f)),lower,upper));
    end
    for k=1:n
        f=y*sin(k*x);
        bn(k)=bn(k)+(2/(upper-lower))*(integral(@(x) eval(vectorize(f)),lower,upper));
    end
    a0=a0+(1/(upper-lower))*(integral(@(x) eval(vectorize(y)),lower,upper));
end
fprintf('\nEnter a0,an,bn for coefficient matrix\n');

