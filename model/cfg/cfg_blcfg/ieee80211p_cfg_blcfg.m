function [ IEEE80211P ] = ieee80211p_cfg_blcfg( IEEE80211P, Test_Path )
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
IEEE80211P.STRICT = 1;       % Strict IEEE80211P syntax checking enabled - Not Implemented Yet

IEEE80211P.SNR = 30; %To be decided to retain
IEEE80211P.IFFT_FACTOR = ((1/52^.5) * 64); %To be decided to retain
IEEE80211P.SNR_FACTOR = (10^(IEEE80211P.SNR/10.0))^.5; %To be decided to retain

IEEE80211P.NO_OF_SYMBOLS = 15; %symbol
IEEE80211P.VALID_SYMBOLS = 14; %To be decided to retain
IEEE80211P.VALID_NO_SUBCARRIERS = 48; %To be decided to retain

IEEE80211P.SIM_NUMBER_OF_PACKETS = 1; %To be decided to retain
IEEE80211P.PACKET_LENGTH = 64*16; %To be decided to retain

IEEE80211P.STREAM_PAD = 10000; %To be decided to retain

IEEE80211P.SNR_RANGE= 30; %To be decided to retain

IEEE80211P.FLAG_RUN_OLD_METRIC = 1; %To be decided to retain

IEEE80211P.SIM.SIMDIR   =   Test_Path; % Saving directory
IEEE80211P.SIM.VERSION  =   '2012'; %Just A version number, if changed in future

%------------------------------------------------------------------------------
% Overall parameters
%------------------------------------------------------------------------------
IEEE80211P.GI_FRACTION  =   0.25; %25% guard interval



%------------------------------------------------------------------------------
% Transmitter parameters
%------------------------------------------------------------------------------
% Enables
IEEE80211P.TX.ENABLE         = 1; % TX enable

% Block type
IEEE80211P.TX.TYPE         = 'IEEE80211P_BL';   % Transmiter type

end

