function out = build_hybrid(im1,n,c,low,high)
low_freq = zeros(size(im1),'uint8');
high_freq = zeros(size(im1),'uint8');
set = false;
for i= 1: n

    if(i>=low)
        if set == false
            low_freq = low_freq + imresize(c{1,low+1},size(im1));
            set = true;
        end
        low_freq = low_freq + imresize(c{2,i-1},size(im1));
         
    end
    
    if (i<=high)
        high_freq= high_freq + imresize(c{4,i},size(im1));
    end
    
end


out=low_freq+high_freq;
end
