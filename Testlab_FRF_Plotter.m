clc
clear all
close all

data_1= load('PLA4_AccelX_FRF.mat');
data_2= load('PLA4_AccelY_FRF.mat');
data_3= load('PLA4_AccelZ_FRF.mat');
% 
data_4= load('PLA5_AccelX_FRF.mat');
data_5= load('PLA5_AccelY_FRF.mat');
data_6= load('PLA5_AccelZ_FRF.mat');
% 
data_7= load('PLA1_AccelX_FRF.mat');
data_8= load('PLA1_AccelY_FRF.mat');
data_9= load('PLA1_AccelZ_FRF.mat');
%
data_10= load('PLA2ImpactFRF.mat');
data_11= load('PLA3ImpactFRF.mat');

%%
% Assigning time resolution and magnitudes to each t

tx = data_1.FRF.x_values.start_value : data_1.FRF.x_values.increment : ...
     (data_1.FRF.x_values.increment * (data_1.FRF.x_values.number_of_values - 1));
tx = tx';
dx = data_1.FRF.y_values.values(:, 1);
magx = abs(dx);

ty = data_2.FRF.x_values.start_value : data_2.FRF.x_values.increment : ...
     (data_2.FRF.x_values.increment * (data_2.FRF.x_values.number_of_values - 1));
ty = ty';
dy = data_2.FRF.y_values.values(:, 1);
magy = abs(dy);

tz = data_3.FRF.x_values.start_value : data_3.FRF.x_values.increment : ...
     (data_3.FRF.x_values.increment * (data_3.FRF.x_values.number_of_values - 1));
tz = tz';
dz = data_3.FRF.y_values.values(:, 1);
magz = abs(dz);

ta = data_4.FRF.x_values.start_value : data_4.FRF.x_values.increment : ...
     (data_4.FRF.x_values.increment * (data_4.FRF.x_values.number_of_values - 1));
ta = ta';
da = data_4.FRF.y_values.values(:, 1);
maga = abs(da);

tb = data_5.FRF.x_values.start_value : data_5.FRF.x_values.increment : ...
     (data_5.FRF.x_values.increment * (data_5.FRF.x_values.number_of_values - 1));
tb = tb';
db = data_5.FRF.y_values.values(:, 1);
magb = abs(db);

tc = data_6.FRF.x_values.start_value : data_6.FRF.x_values.increment : ...
     (data_6.FRF.x_values.increment * (data_6.FRF.x_values.number_of_values - 1));
tc = tc';
dc = data_6.FRF.y_values.values(:, 1);
magc = abs(dc);

tl = data_7.FRF.x_values.start_value : data_7.FRF.x_values.increment : ...
     (data_7.FRF.x_values.increment * (data_7.FRF.x_values.number_of_values - 1));
tl = tl';
dl = data_7.FRF.y_values.values(:, 1);
magl = abs(dl);

tm = data_8.FRF.x_values.start_value : data_8.FRF.x_values.increment : ...
     (data_8.FRF.x_values.increment * (data_8.FRF.x_values.number_of_values - 1));
tm = tm';
dm = data_8.FRF.y_values.values(:, 1);
magm = abs(dm);

tn = data_9.FRF.x_values.start_value : data_9.FRF.x_values.increment : ...
     (data_9.FRF.x_values.increment * (data_9.FRF.x_values.number_of_values - 1));
tn = tn';
dn = data_9.FRF.y_values.values(:, 1);
magn = abs(dn);
%%
%Pulling out values for PLA 2 and PLA3 they were saved differently than the
%files above 
t10 = data_10.FRF.x_values.start_value : data_10.FRF.x_values.increment : ...
     (data_10.FRF.x_values.increment * (data_10.FRF.x_values.number_of_values - 1));
t10 = t10';
d10x = data_10.FRF.y_values.values(:, 1);
d10y = data_10.FRF.y_values.values(:, 2);
d10z = data_10.FRF.y_values.values(:, 3);
mag10x = abs(d10x);
mag10y = abs(d10y);
mag10z = abs(d10z);

t11 = data_11.FRF.x_values.start_value : data_11.FRF.x_values.increment : ...
     (data_11.FRF.x_values.increment * (data_11.FRF.x_values.number_of_values - 1));
t11 = t11';
d11x = data_11.FRF.y_values.values(:, 1);
d11y = data_11.FRF.y_values.values(:, 2);
d11z = data_11.FRF.y_values.values(:, 3);
mag11x = abs(d11x);
mag11y = abs(d11y);
mag11z = abs(d11z);
%%
figure;
semilogy(tx,magx,'LineWidth',1.5);
hold on;
semilogy(ty,magy,'LineWidth',1.5);
semilogy(tz,magz,'LineWidth',1.5);
% semilogy(ta,maga,'LineWidth',1.5);
% semilogy(tb,magb,'LineWidth',1.5);
% semilogy(tc,magc,'LineWidth',1.5);
title('PLA4 Impact FRF')
xlabel('Frequency (Hz)');
ylabel('Amplitude (g/N)');
legend('X response','Y response','Z response','PLA1','PLA2','PLA3');
xlim([0 200])
ylim([10^-2 10^2]);
%%
figure;
semilogy(ta,maga,'LineWidth',1.5);
hold on;
semilogy(tb,magb,'LineWidth',1.5);
semilogy(tc,magc,'LineWidth',1.5);
title('PLA5 Impact FRF')
xlabel('Frequency (Hz)');
ylabel('Amplitude (g/N)');
legend('X response','Y response','Z response');
xlim([0 200])
ylim([10^-2 10^2]);
%%
figure;
semilogy(tl,magl,'LineWidth',1.5);
hold on;
semilogy(tm,magm,'LineWidth',1.5);
semilogy(tn,magn,'LineWidth',1.5);
title('PLA1 Impact FRF')
xlabel('Frequency (Hz)');
ylabel('Amplitude (g/N)');
legend('X response','Y response','Z response');
xlim([0 200])
ylim([10^-2 10^2]);
%%
figure;
semilogy(t10,mag10x,'LineWidth',1.5);
hold on;
semilogy(t10,mag10y,'LineWidth',1.5);
semilogy(t10,mag10z,'LineWidth',1.5);
title('PLA2 Impact FRF')
xlabel('Frequency (Hz)');
ylabel('Amplitude (g/N)');
legend('X response','Y response','Z response');
xlim([0 200])
ylim([10^-2 10^2]);

%%
figure;
semilogy(t11,mag11x,'LineWidth',1.5);
hold on;
semilogy(t11,mag11y,'LineWidth',1.5);
semilogy(t11,mag11z,'LineWidth',1.5);
title('PLA3 Impact FRF')
xlabel('Frequency (Hz)');
ylabel('Amplitude (g/N)');
legend('X response','Y response','Z response');
xlim([0 200])
ylim([10^-2 10^2]);