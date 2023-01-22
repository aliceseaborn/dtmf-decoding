% ECE 460 - PROJECT 2
%   PEAKS FUNCTION
%
%   AUSTIN  DIAL
%   RAMYA   SAMBULO
%   TYLER   BUCHANAN
%
%   04/26/2019
%
% Here we take the sample that we've segmented and send it through this
% function in order to get the peaks of that small window sample. Then we
% send the results of this function the IdentifyKey function to determine
% if the match is true or false. 
%


function fPair = TwinPeaks( sample, freq )

    % Perform FFT within frequency range 1 to 2 kHz
    sampleSpectrum = fft(sample, freq);
    sampleSpectrum = sampleSpectrum(1:2000);
    
    % Find peaks
    tempTime = linspace(600, 2000, length(sampleSpectrum(600:2000)));
    pks = findpeaks(abs(sampleSpectrum(600:2000)), tempTime, 'MinPeakDistance', 120, 'MinPeakHeight', 0.000002, 'SortStr', 'descend');
    
    % Capture two highest peaks
    
        % Find lower frequency
        indx = find(abs(sampleSpectrum) == pks(1));
        fPair(1) = indx(1);

        % Find higher frequency
        indx = find(abs(sampleSpectrum) == pks(2));
        fPair(2) = indx(1);
    
end