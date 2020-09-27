#!/usr/bin/perl
#A basic breadth first traversal of a graph
#done in perl for fun :)
#(c) 2020 Max Goren
$found = 0;

sub breadth_first_search {
  $start = $_[0];                  #get starting node
  print "\nBreadth First Search\n";
  print "--------------------\n";
  unshift(@queue, $start);	  #place starting node in queue
  push(@seen, $start);		  #mark starting node as visited
  print "Starting from: $start\n";
  while ($#queue >= 0)           #while the queue is not empty
  {
     $curr = pop @queue;         #take first node in queue
     foreach $key (keys %graph)  #search the perl hash
     {				 #to find the cooresponding key to current node
       if ($key eq $curr)        #when found
       {
          $verts = $graph{$key};     #get adjacency list for current
          foreach $node (@{$verts})  #for every node adjacent to current
          {
            look_for($node);	    #check if node has been visited yet
            if ($found == 0)        #if not
            {
               print "visiting: " . $node . "\n"; #visit node
               unshift(@queue, $node);            #add node to queue
               push(@seen, $node);		  #mark node as seen
            }
            $found = 0;                          #reset found flag for next node
          }
          break;				#dont need to examine rest of hash keys for this node.
       }
     }
  }
}

sub look_for {
  $memb = $_[0];			#check "seen" list for node
  for ($i = 0; $i <= $#seen; $i++)
  {
    if ($seen[$i] eq $memb)
    {
      $found = 1;			#if we've already visited this node, say so.
    }
  }
}
1;
