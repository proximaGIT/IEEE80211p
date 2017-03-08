function [ ] = test_IEEE80211p_HelloWorld( Test_Path, Work_Path, Fid_Log, Fid_Rep, Commandline_Params )
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
% Default Configuration
%------------------------------------------------------------------------------
IEEE80211P.CFG_TYPE = 'IEEE80211P_HW';       % IEEE 802.11p Model - HelloWorld Messages
IEEE80211P = ieee80211p_cfg_wr(IEEE80211P, Work_Path, Fid_Log); % Default configuration

%Print CSP version
fprintf(Fid_Log, 'Version: %s\n', IEEE80211P.SIM.VERSION);

%------------------------------------------------------------------------------
% Get the standard parameters
%------------------------------------------------------------------------------
IEEE80211P.STD_TYPE='IEEE80211P_BL';

% STD configuration
IEEE80211P.STANDARD = ieee80211p_std_config_wr(IEEE80211P);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------------------------------------------------------------------------
% Run IEEE 802.11p Tx-Rx
%------------------------------------------------------------------------------
result = ieee80211p_sys(IEEE80211P,Fid_Log);

%------------------------------------------------------------------------------
% Parse Result
%------------------------------------------------------------------------------
% parse_result(IEEE80211P,result,Fid_Rep)


end

