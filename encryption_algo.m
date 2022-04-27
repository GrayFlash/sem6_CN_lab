clc;
close all;
clear all;

fileID = fopen('input.txt', 'r');
A = fscanf(fileID, '%s');
salt = mod(uint32(A(1)), 10);
fprintf('original: %s\n',A);
encrypted = A(1);
for j = 2: length(A)
    c = char(A(j) + salt);
    encrypted = [encrypted c];
end

fprintf('encrypted: %s\n',encrypted);

decrypted = char(encrypted(1));
for j = 2: length(encrypted)
    c = char(encrypted(j) - salt);
    decrypted = [decrypted c];
end

fprintf('decrypted: %s\n',decrypted);

