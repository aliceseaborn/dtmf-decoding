% ECE 460 - PROJECT 2
%   INDENTIFY KEY FUNCTION
%
%   AUSTIN  DIAL
%   RAMYA   SAMBULO
%   TYLER   BUCHANAN
%
%   04/26/2019
%
% This function takes in the frequency pair of a spectrum analysis and
% returns the key pressed as well as a conditional variable called 'match'
% which tells the user if a key match was found or if the input frequencies
% fail to match a correct key.
%


function [match, kVal] = IdentifyKey( freqPair, tol )

    % Set key
    Key = [ 697, 697, 697, 770, 770, 770, 852, 852, 852, 941;           ...
            1209, 1336, 1477, 1209, 1336, 1477, 1209, 1336, 1477, 1336;];
    
    % Split saved frequencies
    pLow = min(freqPair);
    pHigh = max(freqPair);
    
    % Set match for start
    match = 1;
    
    % Check for match
    
        % Start with the low frequency
        L = (1 - tol) * pLow; % Estimate low value
        H = (1 + tol) * pLow; % Estimate high value

        temp = 1:size(Key(1,:),2);
        lIndx = temp(Key(1, :) >= L & Key(1, :) < H);

        % Now the high freq component
        L = (1 - tol) * pHigh; % Estimate low value
        H = (1 + tol) * pHigh; % Estimate high value

        temp = 1:size(Key(2,:),2);
        hIndx = temp(Key(2, :) >= L & Key(2, :) < H);

        % The number common to both lists is the key press value
        kVal = intersect(lIndx, hIndx);

        if ( kVal == 10 )
            kVal = 0;
        end
    
        
        % Check if empty
        if isempty(kVal)
            match = 0;
        end
    
    
end


