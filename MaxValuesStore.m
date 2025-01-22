clc
clear all
close all
%%
% Load data
data_1= load('PLA4_AccelX_FRF.mat');
data_2= load('PLA4_AccelY_FRF.mat');
data_3= load('PLA4_AccelZ_FRF.mat');

data_4= load('PLA5_AccelX_FRF.mat');
data_5= load('PLA5_AccelY_FRF.mat');
data_6= load('PLA5_AccelZ_FRF.mat');

data_7= load('PLA1_AccelX_FRF.mat');
data_8= load('PLA1_AccelY_FRF.mat');
data_9= load('PLA1_AccelZ_FRF.mat');
%%
% Extract data and compute magnitudes
responses = {'X', 'Y', 'Z'};
data = {data_1, data_2, data_3, data_4, data_5, data_6, data_7, data_8, data_9};
maxValues = zeros(length(data), 1); % Preallocate array for max amplitudes
maxFrequencies = zeros(length(data), 1); % Preallocate array for corresponding frequencies

for i = 1:length(data)
    t = data{i}.FRF.x_values.start_value : data{i}.FRF.x_values.increment : ...
     (data{i}.FRF.x_values.increment * (data{i}.FRF.x_values.number_of_values - 1));
    t = t';
    y = data{i}.FRF.y_values.values(:, 1);
    mag = abs(y); % Magnitude

    % Filter for frequencies up to 100 Hz
    idx = t <= 160;
    t_filtered = t(idx);
    mag_filtered = mag(idx);

    % Find maximum value in the filtered range and its corresponding frequency
    [maxValues(i), maxIdx] = max(mag_filtered);
    maxFrequencies(i) = t_filtered(maxIdx);
end

% Write results to a CSV file
csvFileName = 'MaxValues_UpTo100Hz_withFrequencies.csv';
T = table((1:length(maxValues))', maxFrequencies, maxValues, ...
    'VariableNames', {'Response_ID', 'Frequency_at_Max_Amplitude_Hz', 'Max_Amplitude_g_N'});
writetable(T, csvFileName);

disp(['Maximum values and corresponding frequencies saved to ', csvFileName]);
