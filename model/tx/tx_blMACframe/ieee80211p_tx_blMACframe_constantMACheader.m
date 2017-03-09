function [ DataOut ] = ieee80211p_tx_blMACframe_constantMACheader( IEEE80211P, FidLogFile, DataIn )
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
    error('ieee80211p_tx_blMACframe_constantMACheader SYNTAX');
end

%------------------------------------------------------------------------------
% Parameters Definition
%------------------------------------------------------------------------------
header.Frame_Control = IEEE80211P.TX.MACFRAME.FRAME_CONTROL; % Get the frame control field in MAC header
header.Duration = IEEE80211P.TX.MACFRAME.DURATION; % Get the duration field of the MAC Header
header.Destination_Address = IEEE80211P.TX.MACFRAME.DST_ADDR; % Get RA of the MAC Header
header.Source_Address = IEEE80211P.TX.MACFRAME.SRC_ADDR; % Get TA of the MAC Header
header.BSSID = IEEE80211P.TX.MACFRAME.BSS_ADDR; % Get BSSID
header.Sequence_Control = [0 0]; % Keeping the Sequence Control Value constant to create a constant MAC header, Each value represents a byte
header.size = IEEE80211P.TX.MACFRAME.HEADER_SIZE;
FCS = [0 0 0 0]; % Keeping the Frame Check Sequence value constant to create a constant MAC header, Each value represents a byte

%------------------------------------------------------------------------------
% Parameters from the DATAGEN block to split data into frames
%------------------------------------------------------------------------------
NUM_FRAMES = IEEE80211P.TX.DATAGEN.NUM_FRAMES; %Number of frames generated
FRAME_SIZE = IEEE80211P.TX.DATAGEN.FRAME_SIZE; %Number of bytes per frame

%------------------------------------------------------------------------------
% Adding the MAC Header to the Data
%------------------------------------------------------------------------------
%Create a colum vector containing the MAC Header
MAC_header = transpose([header.Frame_Control header.Duration header.Destination_Address header.Source_Address header.BSSID header.Sequence_Control]);

% Create a matrix having data in each column
Input_Data_Frames = reshape(DataIn, FRAME_SIZE, NUM_FRAMES); %Each column is a frame

% Add the MAC Header
Data_with_MAC_Header = [repmat(MAC_header, 1, NUM_FRAMES); Input_Data_Frames];

% Add the FCS at the end
MAC_Frames = [Data_with_MAC_Header; repmat(transpose(FCS), 1, NUM_FRAMES)];

%Reshape the frames to a stream
MAC_Frames_Stream = reshape( MAC_Frames, 1, (size(MAC_Frames,1)*size(MAC_Frames,2)) );

fprintf(FidLogFile,'\t\t%d is the total MAC Stream Size\n', length(MAC_Frames_Stream));

DataOut = MAC_Frames_Stream;

end

