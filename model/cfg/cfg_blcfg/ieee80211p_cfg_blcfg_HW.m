function [ IEEE80211P ] = ieee80211p_cfg_blcfg_HW( IEEE80211P, Test_Path )
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
   error('Test path is required.');
  case 2,
  otherwise,
    error('ieee80211p_cfg_blcfg SYNTAX');
end

%------------------------------------------------------------------------------
% IEEE80211P configuration
%------------------------------------------------------------------------------
IEEE80211P.STRICT                       =   1;       % Strict IEEE80211P syntax checking enabled - Not Implemented Yet

IEEE80211P.SNR                          =   30; %To be decided to retain
IEEE80211P.IFFT_FACTOR                  =   ((1/52^.5) * 64); %To be decided to retain
IEEE80211P.SNR_FACTOR                   =   (10^(IEEE80211P.SNR/10.0))^.5; %To be decided to retain

IEEE80211P.NO_OF_SYMBOLS                =   15; %symbol
IEEE80211P.VALID_SYMBOLS                =   14; %To be decided to retain
IEEE80211P.VALID_NO_SUBCARRIERS         =   48; %To be decided to retain

IEEE80211P.STREAM_PAD                   =   10000; %To be decided to retain

IEEE80211P.SNR_RANGE                    =   30; %To be decided to retain

IEEE80211P.FLAG_RUN_OLD_METRIC          =   1; %To be decided to retain

%------------------------------------------------------------------------------
% I/O Configuration
%------------------------------------------------------------------------------
IEEE80211P.SIM.SIMDIR                   =   Test_Path; % Saving directory
IEEE80211P.SIM.VERSION                  =   '2012'; %Just A version number, if changed in future

%------------------------------------------------------------------------------
% Overall parameters
%------------------------------------------------------------------------------
IEEE80211P.GI_FRACTION                  =   0.25; %25% guard interval
IEEE80211P.CONSTELLATION                =   'BPSK'; % Set the Constellation used in the System
IEEE80211P.CODE_RATE                    =   '1/2'; % Set the Code rate

%------------------------------------------------------------------------------
% Transmitter parameters
%------------------------------------------------------------------------------
% Enables
IEEE80211P.TX.ENABLE                    =   1; % TX enable
IEEE80211P.TX.DATAGEN.ENABLE            =   1; % Enable/Disable data generation
IEEE80211P.TX.MACFRAME.ENABLE           =   1; % Enable/Disable MAC Header generation
IEEE80211P.TX.SIGNALFIELD.ENABLE        =   1; % Enable/Disable Signal Field Addition
IEEE80211P.TX.PADBITS.ENABLE            =   1; % Enable/Dsiable Addition of Pad Bits

% Block type
IEEE80211P.TX.TYPE                      =   'IEEE80211P_BL';   % Transmiter type
IEEE80211P.TX.DATAGEN.TYPE              =   'IEEE80211P_HW';   % HelloWorld Message generator
IEEE80211P.TX.MACFRAME.TYPE             =   'IEEE80211P_CONSTANT_MAC_HEADER';   % MAC Layer Header Type 
IEEE80211P.TX.SIGNALFIELD.TYPE          =   'IEEE80211P_NULL_SIGNAL_FIELD'; % Signal field Type
IEEE80211P.TX.PADBITS.TYPE              =   'IEEE80211P_BL'; % Pad-Bits Type

% I/O Filenames
IEEE80211P.TX.DATAGEN_FDO               =   'datagen_tx_do';    % Filename for generated data
IEEE80211P.TX.MACFRAME_FDI              =   'datagen_tx_do';    % Input Filename for the MAC Header generator
IEEE80211P.TX.MACFRAME_FDO              =   'macframe_tx_do';   % Output Filename for the MAC Header generator
IEEE80211P.TX.SIGNALFIELD_FDI           =   'macframe_tx_do';   % Input Filename for Signal Field Generator
IEEE80211P.TX.SIGNALFIELD_FDO           =   'signalfield_tx_do'; % Output Filename for Signal Field Generator
IEEE80211P.TX.PADBITS_FDI               =   'signalfield_tx_do'; % Input Filename for Pad-Bits
IEEE80211P.TX.PADBITS_FDO               =   'padbits_tx_do';    % Output Filename for Pad-Bits

% Datagen Additional Parameters
IEEE80211P.TX.DATAGEN.SEED              =   0; % Random number generator seed
IEEE80211P.TX.DATAGEN.NUM_FRAMES        =   100; %Number of Frames To be generated
IEEE80211P.TX.DATAGEN.MESSAGE           =   'HelloWorld';
IEEE80211P.TX.DATAGEN.FRAME_SIZE        =   length(IEEE80211P.TX.DATAGEN.MESSAGE); %Length of each frame in bytes

% MAC Frame Additional Parameters
IEEE80211P.TX.MACFRAME.SRC_ADDR         =   [35 35 35 35 35 35];    % Source MAC Address, Each value represent a byte
IEEE80211P.TX.MACFRAME.DST_ADDR         =   [66 66 66 66 66 66];    % Destination MAC Address, Each value represents a byte
IEEE80211P.TX.MACFRAME.BSS_ADDR         =   [255 255 255 255 255 255]; % Basic Service Set ID, Each value respresents a byte
IEEE80211P.TX.MACFRAME.FRAME_CONTROL    =   [0 8]; %Frame Control Value for the MAC Header, Hard Coded to data frames, Each value represents a byte
IEEE80211P.TX.MACFRAME.DURATION         =   [0 0]; %Duration/ID value in MAC Header, Hard Coded to 0 for now, each value represents a byte
IEEE80211P.TX.MACFRAME.HEADER_SIZE      =   28; %Total Number of bytes in the Header of the MAC Frame

end

