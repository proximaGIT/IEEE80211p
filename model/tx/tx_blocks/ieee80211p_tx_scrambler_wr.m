function [  ] = ieee80211p_tx_scrambler_wr( IEEE80211P, FidLogFile )
%*******************************************************************************
%* Copyright (c) 2017 Telecommunications Lab, Saarland University
%*               Campus Building C6 3, Floors 10 & 9, 66123 Saarbrücken
%*
%*
%* Permission is hereby granted, free of charge, to any person obtaining a copy
%* of this software and associated documentation files (the "Software"), to deal
%* in the Software without restriction, including without limitation the rights
%* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%* copies of the Software, and to permit persons to whom the Software is
%* furnished to do so, subject to the following conditions:
%*
%* The above copyright notice and this permission notice shall be included in
%* all copies or substantial portions of the Software.
%*
%* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
%* THE SOFTWARE.
%*
%* This notice contains a licence of copyright only and does not grant
%* (implicitly or otherwise) any patent licence and no permission is given
%* under this notice with regards to any third party intellectual property
%* rights that might be used for the implementation of the Software.
%*
%* Derived from:
%* Copyright (c) 2011 AICIA, BBC, Pace, Panasonic, SIDSA
%*
%* Permission is hereby granted, free of charge, to any person obtaining a copy
%* of this software and associated documentation files (the "Software"), to deal
%* in the Software without restriction, including without limitation the rights
%* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%* copies of the Software, and to permit persons to whom the Software is
%* furnished to do so, subject to the following conditions:
%*
%* The above copyright notice and this permission notice shall be included in
%* all copies or substantial portions of the Software.
%*
%* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
%* THE SOFTWARE.
%*
%* This notice contains a licence of copyright only and does not grant
%* (implicitly or otherwise) any patent licence and no permission is given
%* under this notice with regards to any third party intellectual property
%* rights that might be used for the implementation of the Software.
%*
%******************************************************************************

%******************************************************************************
%* Project     : IEEE 802.11p Simulation Platform
%* Date        : $Date$
%* Version     : $Revision$
%* Author      : Praharsha Sirsi
%* Description :
%*
%*
%*
%*
%******************************************************************************

%------------------------------------------------------------------------------
% Input arguments checking
%------------------------------------------------------------------------------
switch(nargin)
    case 1,
        FidLogFile = 1; % Standard output
    case 2,
    otherwise,
        error('ieee80211p_tx_scrambler_wr SYNTAX');
end

%------------------------------------------------------------------------------
% Parameters Definition
%------------------------------------------------------------------------------
ENABLED  = IEEE80211P.TX.SCRAMBLER.ENABLE; % Enable
DI_FNAME = IEEE80211P.TX.SCRAMBLER_FDI;    % Input file
DO_FNAME = IEEE80211P.TX.SCRAMBLER_FDO;    % Output file
TYPE     = IEEE80211P.TX.SCRAMBLER.TYPE;   % Block type
SIM_DIR  = IEEE80211P.SIM.SIMDIR;    % Simulation directory

%------------------------------------------------------------------------------
% Procedure
%------------------------------------------------------------------------------
global DATA;

if ENABLED
    fprintf(FidLogFile,'\tIEEE80211P-TX-SCRAMBLER: (%s)\n', TYPE);
    if strcmp(DI_FNAME, '')
        data = DATA;
    else
        load(strcat(SIM_DIR, filesep, DI_FNAME), 'data'); % Load input data
    end
    
    switch TYPE
        case 'IEEE80211P_BL'
            data = ieee80211p_tx_blscrambler(IEEE80211P, FidLogFile, data);
        case 'IEEE80211P_NO_SCRAMBLING'
            data = ieee80211p_tx_blscrambler_no_scrambling(IEEE80211P, FidLogFile, data);
        otherwise
            error('Unknown MAC Frame type %s', TYPE);
    end
    
else % If not enabled
    fprintf(FidLogFile,'\IEEE80211P-TX:SCRAMBLER: DISABLED\n');
end

%------------------------------------------------------------------------------
% Output saving and formatting
%------------------------------------------------------------------------------
if ENABLED
    if strcmp(DO_FNAME, '')
        DATA = data;
        fprintf(FidLogFile,'\t\tScrambler output stored in workspace\n');
    else
        save(strcat(SIM_DIR, filesep, DO_FNAME),'data')
        fprintf(FidLogFile,'\t\tScrambler output saved in file: %s\n',DO_FNAME);
    end
end


end

