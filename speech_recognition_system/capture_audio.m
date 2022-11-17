
function new_file_name = capture_audio(file_name,new_file_name)

[x,fs]=audioread(file_name);
x = double(x);
x = x / max(abs(x));
FrameLen = 240;
FrameInc = 80;

amp1 = 10;
amp2 = 2;       % minimum energy
zcr2 = 5;       %minimum zero-crossing rate
maxsilence = 8;
minlen  = 15;

status  = 0;     
count   = 0;     
silence = 0;     
tmp1  = enframe(x(1:end-1), FrameLen, FrameInc);
tmp2  = enframe(x(2:end)  , FrameLen, FrameInc);
signs = (tmp1.*tmp2)<0;
diffs = (tmp1 -tmp2)>0.02;
zcr   = sum(signs.*diffs, 2);

%calcutate energy
amp = sum(abs(enframe(x, FrameLen, FrameInc)), 2);

%adjust minimum energy
amp1 = min(amp1, max(amp)/4);
amp2 = min(amp2, max(amp)/8);

%start end-point detection
x1 = 0;
for n=1:length(zcr) %length（zcr）得到的是整个信号的帧数
  switch status
      case {0,1}                   % 0=silence, 1=might begin
        if amp(n) > amp1          % be sure to enter the speech segment
             x1 = max(n-count-1,1);
             status  = 2;
            silence = 0;
             count   = count + 1;
        elseif amp(n) > amp2 | ... % might in the speech, but not sure
            zcr(n) > zcr2
            status = 1;
            count  = count + 1;
        else                       % silence
            status  = 0;
            count   = 0;
        end
      case 2,                       % 2=speech
        if amp(n) > amp2 | ...     % keep speech
            zcr(n) > zcr2
            count = count + 1;
        else                       % coming to end
            silence = silence+1;
            if silence < maxsilence % not over yet
                count  = count + 1;
            elseif count < minlen   % too short, noise
                status  = 0;
                silence = 0;
                count   = 0;
            else                    %end of the audio
                status  = 3;
            end
        end
    case 3,
        break;
    end
end
count = count-silence/2;
x2 = x1 + count -1;
y=x(x1*FrameInc:x2*FrameInc);

%draw a figure
%subplot(211)   
%plot(x)
%axis([1 length(x) -1 1])   
%ylabel('Speech');
%line([x1*FrameInc x1*FrameInc], [-1 1], 'Color', 'red');
%line([x2*FrameInc x2*FrameInc], [-1 1], 'Color', 'red');
%subplot(212)
%plot(y)
%axis([1 length(y) -1 1])
%ylabel('clipped speech')    

audiowrite(new_file_name,y,fs);     %save the new audio

end
