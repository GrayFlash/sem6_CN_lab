clc;
clear all;
close all;

data = [1 0 1 1 0 0 1];

m = length(data);
i = 1;
while 1
    if 2^i >= m+i+1
        break
    end
    i = i + 1;
end
r = i;
data_rev = fliplr(data);

transmitted_rev = zeros(1, m + r);

k = 0;
p = 1;
for j = 1:m + r
    if j == 2.^k
        transmitted_rev(j) = 0;
        k = k + 1; 
    else
        transmitted_rev(j) = data_rev(p);
        p = p+1;
    end
end

r1 = transmitted_rev(1:2:11);
r2 = [transmitted_rev(2:3) transmitted_rev(6:7) transmitted_rev(10:11)];
r3 = transmitted_rev(4:7);
r4 = transmitted_rev(8:11);

r1 = ~rem(length(find(r1 == 1)), 2) == 0;
r2 = ~rem(length(find(r2 == 1)), 2) == 0;
r3 = ~rem(length(find(r3 == 1)), 2) == 0;
r4 = ~rem(length(find(r4 == 1)), 2) == 0;

r = [r1 r2 r3 r4];

for i = 1:length(r)
    transmitted_rev(2.^(i-1)) = r(i);
end

transmitted = fliplr(transmitted_rev)

% if no error in message
received_message = [1 0 1 0 1 0 0 1 1 1 0];

arr_rev = fliplr(received_message);

m1 = arr_rev(1:2:11);
m2 = [arr_rev(2:3) arr_rev(6:7) arr_rev(10:11)];
m3 = arr_rev(4:7);
m4 = arr_rev(8:11);

m1 = ~rem(length(find(m1 == 1)), 2) == 0;
m2 = ~rem(length(find(m2 == 1)), 2) == 0;
m3 = ~rem(length(find(m3 == 1)), 2) == 0;
m4 = ~rem(length(find(m4 == 1)), 2) == 0;

m = [m1 m2 m3 m4];

disp('message recevied without error')
disp(m)

% error in 6th bit

received_message_with_error = [1 0 1 0 1 1 0 1 1 1 0];

arr_rev = fliplr(received_message_with_error);

m1 = arr_rev(1:2:11);
m2 = [arr_rev(2:3) arr_rev(6:7) arr_rev(10:11)];
m3 = arr_rev(4:7);
m4 = arr_rev(8:11);

m1 = ~rem(length(find(m1 == 1)), 2) == 0;
m2 = ~rem(length(find(m2 == 1)), 2) == 0;
m3 = ~rem(length(find(m3 == 1)), 2) == 0;
m4 = ~rem(length(find(m4 == 1)), 2) == 0;

m = [m1 m2 m3 m4];

disp('message recevied with error and its position')
disp(m)

p = bi2de(m);

if p ~= 0
    received_message_with_error(p) = double(~received_message_with_error(p));
end

disp('corrected message')
disp(received_message_with_error)