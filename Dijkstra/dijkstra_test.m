function dijkstra_test ( )
  addpath ( '../dijkstra' );
  nv = 8;
  adj_mat = init ( );
  
  [mindis, vis, path] = dijkstra_distance ( nv, adj_mat );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Node known Cost\n');
  fprintf ( 1, '\n' );
  for i = 1 : nv
    fprintf ( 1, '  %2d    %2d   %2d  \n', i, vis(i), mindis(i) );
  end

  rmpath ( '../dijkstra' );

  return
end


function adj_mat = init ( )

  nv = 8;

  adj_mat(1:nv,1:nv) = Inf;
  for i = 1 : nv
    adj_mat(i,i) = 0;
  end

  adj_mat(1,2) = 1;
  adj_mat(1,3) = 4;
  adj_mat(1,4) = 5;
  adj_mat(2,3) = 8;
  adj_mat(2,4) = 9;
  adj_mat(2,6) = 1;
  adj_mat(2,7) = 9;
  adj_mat(3,5) = 1;
  adj_mat(3,6) = 9;
  adj_mat(4,6) = 2;
  adj_mat(5,8) = 5;
  adj_mat = [
    [Inf 1 4 5 Inf Inf Inf Inf];
    [1 Inf 8 9 Inf 1 9 Inf];
    [4 8 Inf Inf 1 9 Inf Inf];
    [5 9 Inf Inf Inf 2 Inf Inf];
    [Inf Inf 1 Inf Inf Inf Inf 5];
    [Inf 1 9 2 Inf Inf Inf Inf];
    [Inf 9  Inf Inf Inf Inf Inf Inf];
];
  return;
end
