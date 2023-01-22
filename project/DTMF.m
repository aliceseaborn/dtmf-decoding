% ECE 460 - PROJECT 2
%   DTMF FUNCTION
%
%   AUSTIN  DIAL
%   RAMYA   SAMBULO
%   TYLER   BUCHANAN
%
%   04/26/2019
%
% In order to test multiple samples efficiently, this function takes a
% sample, it's sampling frequency, in the window with which it must be
% analyzed and returns the phone number within the sample.
%


function phone_number = DTMF ( sample, time, frequency, window_width, ext, plt )

    % Initialize
    start = 1;
    step_size = window_width / 2;
    Window = sample( start : window_width );
    tWindow = time( start: window_width );
    phone_number = 'Phone Number: ';
    fs = frequency;
    count = 1;

    % Run logic
    cont = 1;

    while(cont == 1)

        % Run FFT and Find peaks
        fPair = TwinPeaks( Window, fs );

        % Detect Signal in peaks
        [check, key] = IdentifyKey( fPair, 0.01 );

        if check

            % Append key
            phone_number = [phone_number, mat2str(key)];
            
            % Plot sampled signal
            if plt
                
                % Plot time series
                p = figure; subplot(211);
                plot(tWindow, Window);
                grid on;
                xlabel('Time [ms]');
                ylabel('Amplitude');
                titleStr = sprintf('Digit %i Time Series @ Fs = %i Hz', key, fs);
                title(titleStr);

                % Plot frequency spectrum
                subplot(212);
                DigitSpectrum = fft(Window, frequency);
                DigitSpectrum = DigitSpectrum(1:2000);
                plot(abs(DigitSpectrum));
                titleStr = sprintf('Digit %i Spectrum @ Fs = %i Hz', key, fs);
                title(titleStr);
                xlabel('Frequency [Hz]');
                ylabel('Amplitude');
                grid on;
                
                % Save figure
                name = ['/Plots/' ext '_' 'Digit#' num2str(count) '.jpg'];
                saveas( p, [pwd name] );
                count = count + 1;
            end

            while check

                % Step window forward
                Window = sample( start : start + step_size );
                tWindow = time( start : start + step_size );
                start = start + step_size;

                % Peaks and identify
                fPair = TwinPeaks( Window, fs );
                [check, ~] = IdentifyKey( fPair, 0.01 );

            end

        end

        % Make sure we don't exceed sample length
        if ( (start + step_size) > length(sample) )
            break;
        end

        % Step window forward
        Window = sample( start : start + step_size );
        tWindow = time( start : start + step_size );
        start = start + step_size;

    end

end