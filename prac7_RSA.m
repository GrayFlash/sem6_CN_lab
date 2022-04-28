clc;
clear all;
close all;
 
% RSA Algorithm
p = 3;
q = 7;
 
n = p*q;
phi = (p-1)*(q-1);
 
k = 2;
e = 2;
while e < phi
   if gcd(e, phi) == 1 && mod(k*phi + 1, e) == 0
       break;
   end
   
   e = e + 1;
end
 
d = (1 + (k*phi))/e;
% d = 1;
while mod(e*d, phi) ~= 1
    d = d+1;
end
 
fprintf('\ne: %d, d: %d, n: %d, phi: %d\n', e, d, n, phi)
 
% msg = 'N';
% data = double(msg);
data = 12;
len = length(data);
encrypted_data = zeros(1, len);
decrypted_data = zeros(1, len);
 
i = 1;
while i <= len
    encrypted_data(i) = mod(data(i)^e, n);
%     disp(encrypted_data(i)^d)
    decrypted_data(i) = mod(encrypted_data(i)^d, n);
    i = i + 1;
end
 
disp('Message')
disp(data)
 
disp('Encrypted message')
disp(encrypted_data)
 
disp('Decrypted message')
disp(decrypted_data)
