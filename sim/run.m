function [  ] = run( Test_Id, Work_Dir_Id, Log_Output, varargin )
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
    case 0,
        error('Test_Id not defined')
    case 1,
        Work_Dir_Id = 'tmp';
        Log_Output = 'stdout'; % Standard output
    case 2,
        Log_Output = 'stdout'; % Standard output
    otherwise,
end

%------------------------------------------------------------------------------
% Path configuration for utl functions
%------------------------------------------------------------------------------
sim_path = pwd;
addpath(strcat(sim_path,'/utl'));

%------------------------------------------------------------------------------
% Name of test directory
%------------------------------------------------------------------------------
test_path = strcat('test_',Test_Id);

% Check if test directory exist
if (~exist(test_path,'dir'))
    error(strcat('Test:',Test_Id,' does not exist'));
end

%------------------------------------------------------------------------------
% Check directory structure and creation of required folder
%------------------------------------------------------------------------------
work_path = check_dir(test_path, Work_Dir_Id);

%------------------------------------------------------------------------------
% Open log and report files
%------------------------------------------------------------------------------
switch Log_Output
    case 'stdout'
        fid_log = 1;
        fid_rep = 1;
    case 'file'
        fid_log = fopen(strcat(test_path,filesep,'result',filesep,'logs',filesep,'simlog.txt'),'w');
        fid_rep = fopen(strcat(test_path,filesep,'result',filesep,'reports',filesep,'report_', ...
    datestr(now, 'yymmdd'), '_', datestr(now, 'HHMM'),'.txt'),'w'); % datestr separated due to Matlab R2008a bug
    case 'afile'
        fid_log = fopen(strcat(test_path,filesep,'result',filesep,'logs',filesep,'simlog.txt'),'a');
        fid_rep = fopen(strcat(test_path,filesep,'result',filesep,'reports',filesep,'report_', ...
    datestr(now, 'yymmdd'), '_', datestr(now, 'HHMM'),'.txt'),'a'); % datestr separated due to Matlab R2008a bug
end


%------------------------------------------------------------------------------
% Test name
%------------------------------------------------------------------------------
fprintf(fid_log,strcat('<Running Test:\t',Test_Id,'>\n'));

%------------------------------------------------------------------------------
% Date
%------------------------------------------------------------------------------
sdate = datestr(now); %date();
fprintf(fid_log,strcat('<Test Date:\t',sdate,'>\n'));

%------------------------------------------------------------------------------
% Path configuration
%------------------------------------------------------------------------------
fprintf(1,'Adding path\n');
add_path(test_path,fid_log);
fprintf(1,'Added path\n'); 

%------------------------------------------------------------------------------
% Execution time measure initialization
%------------------------------------------------------------------------------
init_timecalc(fid_log);

%------------------------------------------------------------------------------
% Test Selection
%------------------------------------------------------------------------------
runTest = strcat('test_',Test_Id);
feval(runTest, test_path, work_path, fid_log, fid_rep, varargin);

disp('Hold');
end

