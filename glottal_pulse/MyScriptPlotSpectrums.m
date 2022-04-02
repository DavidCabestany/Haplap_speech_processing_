clear all;clear all;
load('VariablesGP');
Fs=10000;%It's fixed in the main program
t=0:1/Fs:(length(imp_train)-1)/Fs;
figure();
plot(t,imp_train); title('Impulse train');
[G_imp,f]=pwelch(imp_train,[],[],[],Fs);
%figure()
%plot(f,G_imp);title('Impulse train spectrum - linear')
figure()
plot(f,10*log10(G_imp));title('Impulse train spectrum - logarithmic')

figure()
plot(gs(1:length(gs)/2));
title('Glottal pulse spectrum - logarithmic')
%figure();plot(10.^(gs(1:(length(gs)/2)))/10);
%title('Glottal pulse spectrum - linear')
figure()
[G_pt,f]=pwelch(pulse_train,[],[],[],10000);
plot(f,10*log10(G_pt));
title('Glottal pulse train spectrum - logarithmic ')
%figure();plot(f,(G_pt))
%title('Glottal pulse train spectrum - linear ')

[G_speech,f]=pwelch(zout, [],[],[],10000);
%figure();plot(f, G_speech);title('Speech spectrum - linear');
figure();plot(f, 10*log10(G_speech));title('Speech spectrum - logarithmic');
