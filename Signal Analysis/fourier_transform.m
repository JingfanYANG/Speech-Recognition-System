

function fr_seg = fourier_transform(file_name)

%file_name=('/Users/crystal/Documents/MATLAB/assignment1/inference/S1A.wav');
[Y,FS]=audioread(file_name);
[s,e] = get_seg(file_name);

%the number of sample = frequency * time
N=0.02*FS;      %number of time samples
seg=Y(s:e-1);     %the seg1
%clear Y;

for m=0:(N/2)       % m is from m=0 to m=N/2 as defined in wiki
    real_tmp=0;     %initialize the real energy
    imag_tmp=0;     % imaginary energy
    m;

    %s(k)*(cos(theta)+jsin(theta))
    for k=0:N-1
        theta=2*pi*k*(m)/N;
        
        cos_basis(k+1)=cos(theta);      %cos_basis(k) starts from k=1 not k=0
        cos_part(k+1)=seg(k+1)*cos_basis(k+1);        % so as other arrays
        
        sin_basis(k+1)=sin(theta);
        sin_part(k+1)=seg(k+1)*sin_basis(k+1);
        
        real_tmp=real_tmp+cos_part(k+1); 
        imag_tmp=imag_tmp+sin_part(k+1); 
    end
    fr_seg(m+1)=abs(sqrt(real_tmp^2+imag_tmp^2));       %calculate the energy
end

clf

size(fr_seg)
plot([0:(FS/2)/(N/2):FS/2],fr_seg);     %each m unit is Fs/N Hz, from 0 to fs/2 Hz.

text2=sprintf('In Hz, fs=%d',FS);
xlabel('frequency');
ylabel('energy');

end
    