function [ DataOut ] = ieee80211p_tx_bldatagen( IEEE80211P, FidLogFile )
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
        error('ieee80211p_tx_bldatagen SYNTAX');
end

%------------------------------------------------------------------------------
% Parameters Definition
%------------------------------------------------------------------------------
SEED       = IEEE80211P.TX.DATAGEN.SEED;     % Random seed

%------------------------------------------------------------------------------
% Procedure
%------------------------------------------------------------------------------
NUM_FRAMES = IEEE80211P.TX.DATAGEN.NUM_FRAMES; %Number of frames to be generated
FRAME_SIZE = IEEE80211P.TX.DATAGEN.FRAME_SIZE; %Number of bytes per frame

numBytes = FRAME_SIZE*NUM_FRAMES;

rng_settings = rng(SEED); %The Random number generator initialized with the seed

%Generate the Random Data
data = (randi(256, numBytes, 1) - 1); %-1 is to shift the range from [1-256] to [0-255]

fprintf(FidLogFile,'\t\t%d Bytes generated\n', numBytes);

DataOut = data;
end

