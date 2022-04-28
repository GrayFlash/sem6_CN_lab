clc;
clear all;
close all;

% msg = randi([0,1],1,100);
msg = [0 1 1 1 1 1 1 0 0 1 1 1 1 1];
l = length(msg);
stuffcount = 0;
count = 0;

% stuffing
m = msg;
for i = 1:l
    if msg(i) == 1
        count = count + 1;
        if count == 5
            m = [m(1:i+stuffcount) 0 m(i+stuffcount+1:end)];
            count = 0; 
            stuffcount=stuffcount+1;
        end
    else 
        count = 0;
    end
    
end

p = l + stuffcount;

disp('stuffed bits')
disp(m)

idx = zeros(1,stuffcount);
% unstuffing
i = 0;
j = 1;
count = 0;
for i = 1:p
    if m(i) == 1
        count = count + 1;
        if count == 5      
            idx(j) = i+1;
            count = 0; 
            j = j+1;
        end
    else 
        count = 0;
    end
    
end

m(idx) = [];

disp('unstuffed bits')
disp(m)
