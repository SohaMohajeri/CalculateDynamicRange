function [DR] = CalculateDynamicRange(sequence_name, R, C)

fp = fopen(sequence_name, 'r');
if fp == -1
    error(['Sequence ' sequence_name ' does not exist']);
end
byte4frame = 2*R*C*1.5; %(for 4:2:0)
byte4chroma = 2*R*C*0.5; %(for 4:2:0) 

%   Compute the number of video frames
fseek(fp, 0, 'eof');
F = ftell(fp)/(byte4frame);
fseek(fp, 0, 'bof');

%   Output vectors declaration
DR_array = zeros(F, 1);

fprintf('Starting Calculation for %s video sequence\n',sequence_name)
fprintf('Frame to be processed %d\n', F)
indicator = floor(F/10);

%   DR processing loop
for f = 1:F%F
    if rem(f-1, indicator) == 0
        fprintf('.');
    end
    % Read current frame
    Y = fread(fp, [C R], 'uint16');
    
    % Skip chroma components
    fseek(fp, byte4chroma, 'cof');
	
	% Sort
	numelY=numel(Y);
	tempY =reshape(Y, [numelY, 1]);
	tempY=sort(tempY);

	% Exclude 1% of pixels
	Th1=numelY/100; %% 1% of pixels
	Th2=numelY-Th1;
	tempY=tempY(Th1:Th2);

	% Calculate characteristics
	Lmin = tempY(1);
	Lmax = tempY(end);
	DR_array(f) = log2(Lmax/Lmin);
end
DR = max(DR_array);
fname = sprintf('%s.mat', sequence_name);
save(fname);

fclose(fp);
fprintf('\n');