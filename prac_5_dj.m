clc;
clear all;
close all;
 
arr = inf*ones(8);
for i = 1:length(arr)
    arr(i, i) = 0;
end
 
%defining graph
[arr(1, 3), arr(3, 1)] = deal(5);
[arr(1, 4), arr(4, 1)] = deal(9);
[arr(1, 5), arr(5, 1)] = deal(7);
[arr(2, 3), arr(3, 2)] = deal(8);
[arr(3, 6), arr(6, 3)] = deal(9);
[arr(4, 6), arr(6, 4)] = deal(1);
[arr(5, 8), arr(8, 5)] = deal(2);
[arr(6, 7), arr(7, 6)] = deal(4);
[arr(7, 8), arr(8, 7)] = deal(8);
 
initial_node = 1;
N = length(arr);
d(1:N) = inf;
vis(1:N) = 0;
d(initial_node) = 0;
 
while sum(vis) < N
    % find unvisited nodes
    candidates(1:N) = inf;
    for i = 1:N
        if vis(i) == 0
            candidates(i) = d(i);
        end
    end
    
    [currentDistance, position] = min(candidates);
 
    for i = 1:N
        newDistance = currentDistance + arr(position, i);
        if newDistance < d(i)
            d(i) = newDistance;
        end
    end
 
    vis(position) = 1;
end
 
x = 1:8;
T = table(x', d', 'VariableNames', {'Node', 'Distance'});
disp('Minimum distance from source node to other node in network is show below:')
disp(T)

