% ECE 460 - PROJECT 2
%   DTMF EXECUTE
%
%   AUSTIN  DIAL
%   RAMYA   SAMBULO
%   TYLER   BUCHANAN
%
%   04/13/2019 - 4/30/2019
%


%% LOAD
%

    clear all; clc;
    
    % Turn off automatic plotting
    set(0, 'DefaultFigureVisible', 'off')

    % Sampling rate of 44.1 kHz
    fs = 44100;

    % Load all data
    ALLSETS = load('All_Data.mat');

    % Pull data sets
        SET1 = ALLSETS.dataset1;
        T1   = ALLSETS.t1;

        SET2 = ALLSETS.dataset2;
        T2   = ALLSETS.t2;

        SET3 = ALLSETS.dataset3;
        T3   = ALLSETS.t3;
    

%% TEST ALL SAMPLES
%

    % Set inputs
    
        % Set the width of the moving FFT window
        width = 10000;

        % Set plt to 1 for plots, then check Plots folder
        plt = 0;
    
    % Run analysis
    
tic
            % Set 1 analysis
            number = DTMF( SET1, T1, fs, width, 'Sample1', plt );
            fprintf('Sample 1 %s \n', number);
toc

tic
            % Set 2 analysis
            number = DTMF( SET2, T2, fs, width, 'Sample2', plt );
            fprintf('Sample 2 %s \n', number);
toc

tic
            % Set 3 analysis
            number = DTMF( SET3, T3, fs, width, 'Sample3', plt );
            fprintf('Sample 3 %s \n', number);
toc



