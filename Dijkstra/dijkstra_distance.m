function [mindis, vis, path] = dijkstra_distance ( nv, adj_mat )
  vis(1) = 1;
  vis(2:nv) = 0;
  mindis(1:nv) = adj_mat(1,1:nv);
  path(1:nv) = 0;
  for step = 2 : nv
    [ md, mv ] = find_nearest ( nv, mindis, vis );
    vis(mv) = 1;
    mindis = update_mindis ( nv, mv, vis, adj_mat, mindis );
  end
  return
end
 
function [ d, v ] = find_nearest ( nv, mindis, vis )
  d = Inf; 
  v = -1;
  for i = 1 : nv
    if ( ( ~ vis(i) ) && mindis(i) < d )
      d = mindis(i);
      v = i;
    end
  end
  return;
end
 
function min_d = update_mindis ( nv, mv, connected, ohd, min_d )
  for i = 1 : nv
    if ( ~connected(i) )
      if ( ohd(mv,i) < Inf )
        min_d(i) = min ( min_d(i), min_d(mv) + ohd(mv,i) );
      end
    end
  end

  return;
end
