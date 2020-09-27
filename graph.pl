#!/usr/bin/perl
#perl script to build adjacency list representation of a graph
#once the edges of the graph have been added, we can perform
#a breadth first search of the graph
#(c) 2020 Max Goren, for the love of perl (and sillyness)
require './traversal.pl';
%graph;
$start_node = $ARGV[0]; #perl graph.pl g     will start bfs from 'g' node.

#build the graph
addEdge("a", "d");
addEdge("b", "a");
addEdge("c", "b");
addEdge("c", "d");
addEdge("d", "e");
addEdge("e", "f");
addEdge("e", "g");
&showGraph;
#walk the graph.
breadth_first_search($start_node);


#add u<-->v edges to undirected graph
sub addEdge {
  $v = $_[0];
  $e = $_[1];
  push(@{$graph{$v}}, $e);
  push(@{$graph{$e}}, $v);
}

#display adjacency list of graph
sub showGraph {
  print "\nGraph Adjacency List:\n";
  print "---------------------\n";
  foreach $key (sort {$graph{$a} <=> $graph{$b}} keys %graph) {
    print "Vertex: $key: ";
    foreach $v (@{$graph{$key}}) {
       print "$v ";
    }
    print "\n";
  }
}
