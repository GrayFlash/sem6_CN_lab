clc;
clear all;
close all;
 
msg = 'GrayStack';
key = 6;
 
t = double(msg);
encrypted = t + key;
encrypted = char(encrypted);
 
fprintf('\nMessage:  ')
fprintf(msg)
 
fprintf('\ndata transmitted:  ')
fprintf(encrypted)
 
received_data = double(encrypted);
decrypted = received_data - key;
decrypted = char(decrypted);
 
fprintf('\ndecrypted data:  ')
fprintf(decrypted)
fprintf('\n')
