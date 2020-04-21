
clear all;
close all;
clc;
x=load('Data_F_Ind0006.txt')
x1=(x(1:300,1));
subplot 331
plot(x1),grid,...
    title('Raw EEG(EPILEPSY)')
x2=arburg(x1,150);

subplot(332)
plot(x2),grid,...
    title('signal rep using arburg algo');
%delta
c=0.0001/500;
d=3/500;
% waveletFunction='db8';
[b,a]=butter(3,[c,d]);
feature_Delta=filter(b,a,x2);
subplot(3,3,3)
plot(feature_Delta),grid,...
    title('delta 0.5hz to 3hz')
%theta
c=4/500;
d=8/500;
[b,a]=butter(3,[c,d]);
% waveletFunction='db8';
feature_theta=filter(b,a,x2);
subplot(3,3,4)
plot(feature_theta),grid,...
    title('theta 4hz to 8hz')

%alpha
c=8/500;
d=13/500;
[b,a]=butter(3,[c,d]);
% waveletFunction='db8';
feature_alpha=filter(b,a,x2);
subplot(3,3,5)
plot(feature_alpha),grid,...
    title('alpha 8hz to 13hz')
%beta
c=14/500;
d=30/500;
[b,a]=butter(3,[c,d]);
% waveletFunction='db8';
feature_beta=filter(b,a,x2);
subplot(3,3,6)
plot(feature_beta),grid,...
    title('beta 14hz to 30hz')

