clc;
clear all;
close all;

dataword = [1 0 1 0 0 0 1];
divisor = [1 0 0 1];

k = length(divisor);

dataword1 = [dataword zeros(1,k-1)];  

p = length(dataword1);
r = 0;
tmp = dataword1(1:k);

for i = 1:(p - k + 1)
    if tmp(1) == 1
        xored = bitxor(tmp,divisor);
    else
        xored = bitxor(tmp,zeros(1,k));
    end

    tmp3 = xored(2:end);

    r = k + i;
    if r <= p
        tmp = [tmp3 dataword1(r)];
    end
end

crc = tmp3;
codeword = [dataword crc];
tmp = codeword(1:k);

for i = 1:(p - k + 1)
    if tmp(1) == 1
        xored = bitxor(tmp,divisor);
    else
        xored = bitxor(tmp,zeros(1, k));
    end

    tmp3 = xored(2:end);

    r = k + i;
    if p >=r
        tmp = [tmp3 codeword(r)];
    end
end

syndrome = tmp3;
