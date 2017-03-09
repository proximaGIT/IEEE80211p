function [ DataOut ] = ieee80211p_tx_blpadbits( IEEE80211P, FidLogFile, DataIn )
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
  case 3,
  otherwise,
    error('ieee80211p_tx_blpadbits SYNTAX');
end

%------------------------------------------------------------------------------
% Parameters Definition
%------------------------------------------------------------------------------
CONSTELLATION = IEEE80211P.CONSTELLATION;
CODE_RATE = IEEE80211P.CODE_RATE;

%------------------------------------------------------------------------------
% Parameters from the DATAGEN block to split data into frames
%------------------------------------------------------------------------------
NUM_FRAMES = IEEE80211P.TX.DATAGEN.NUM_FRAMES; %Number of frames generated

%------------------------------------------------------------------------------
% Calculate number of bits/bytes per OFDM symbol to transmitted
%------------------------------------------------------------------------------
switch CONSTELLATION
    case 'BPSK'
        switch CODE_RATE
            case '1/2'
                BITS_PER_SYMBOL = 24;
                BYTES_PER_SYMBOL = BITS_PER_SYMBOL/8;
        end
end

%------------------------------------------------------------------------------
% Insert Pad bits at the end of each frame
%------------------------------------------------------------------------------
% Convert stream to frames
Input_Frames = reshape(DataIn, size(DataIn,2)/NUM_FRAMES, NUM_FRAMES);

% Calculate the number of bytes to be added at the end
rem = mod(size(Input_Frames,1),BYTES_PER_SYMBOL);
if(rem>0)
    num_Pad_bytes = BYTES_PER_SYMBOL - rem;
else
    num_Pad_bytes = 0;
end

% Add the Pad Bits at the end of each frame
Padded_Data = [Input_Frames; repmat(zeros(num_Pad_bytes,1), 1, NUM_FRAMES)];

%Reshape the frames to a stream
Padded_Data_Stream = reshape( Padded_Data, 1, (size(Padded_Data,1)*size(Padded_Data,2)) );

fprintf(FidLogFile,'\t\t%d is the total Padded Data Stream Size\n', length(Padded_Data_Stream));

DataOut = Padded_Data_Stream;

end

