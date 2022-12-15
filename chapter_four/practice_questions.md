# Practice Questions

1. *What are nodes and edges?*

In a tree data structure, *nodes* are like *leaves* while *edges* are like *branches*. The idea is that nodes are *pieces of data* whereas edges are like *relationships* between those pieces of data.

2. *What are root and leaf nodes?*

The root node is (counterintuitively) the *topmost* node in the tree. More precisely, it is the node that *has no parents*; the root node is *not a child* of any other node. Importantly, in the sorts of tree structures discussed in this chapter, a tree can only have *exactly one* root node.

Leaf nodes are (again, counterintuitively), the *bottommost* nodes in the tree. More precisely, leaf nodes *have no children*; a leaf node is a child of another node but has no children of its own. Trees can have many leaves.

3. *What are the three tree traversal orders?*

First, there is the *postorder* traversal order. In this traversal order, one accesses all the *children* of a given node before examining the *data* of these nodes. For example, given a tree with root node A, nodes B and C that are both children of A, and node D that is a child of C, a preorder traversal would move down from A to its children B and C, and then down to D (the child of C) *before* reporting the data at each node. The 'post' therefore refers to *when the data is accessed*, namely, *after the children*.

Second, there is the *preorder* traversal order, which is basically just the opposite of the postorder traversal order. Thus, with a preorder traversal, one accesses the *data* at each node *before* traversing down to all the children. With our example tree above, we would access the data at the root A *before* moving to its children B and C, and then likewise for their data before digging down to the leaf node D. The 'pre' therefore refers to *when the data is accessed*, namely, *before the children*.

Finally, there is the *inorder* traversal order. This works only with *binary* trees, that is, trees, that have two children for each node. With inorder traversal, one first moves down to the child node on the *left* before moving to the child node on the *right*.

4. *What does 'DAG' stand for?*

'DAG' stands for *directed acyclic graph*.

5. *What is a cycle, and do DAGs have cycles?*

Cycles are loops from a child node back to one of its ancestor nodes. For example, with the toy tree described above, a *cycle* would be a case where a child node (e.g., D) had one of its ancestor nodes (e.g., A, through its parent C) as one of its own children.

DAGs do not have cycles: the word 'acyclic' is in their name. They therefore prohibit nodes from having any of their ancestors as children.

6. *What is a binary tree?*

A binary tree is a specific kind of tree data structure in which each node has at most *two* children.

7. *What are the child nodes in a binary tree called?*

The left child and the right child.

8. *If a parent node has an edge to a child node, and the child node has an edge back to the parent node, is this graph considered a DAG?*

No. Such a graph is *cyclic*, not *acyclic*. Therefore, it is not a DAG.

(NB: I am only about 95% certain about this. I find Sweigart's presentation of *directionality* and *cyclicality* somewhat unclear. On page 74, he distinguishes between a graph being *directed* and a graph being *acyclic*: a graph is *directed* when its edges go in one direction (from parent to child), whereas a graph is *acyclic* just in case nodes do not have their own ancestors as children. What is unclear to me is whether a graph might be *undirected* - that is, "bidirectional" - while remaining acyclic. Can edges *not point in a single direction* while ancestors continue to be prohibited from being children of their own descendants? When Sweigarts talks about "having an edge back", is he referring to directionality or cyclicality? This remains unclear to me.)

9. *What is backtracking in a tree traversal algorithm?*

Backtracking in a tree traversal algorithm is moving *up* the tree *from the leaves to their parents*, ultimately culminating back at the root. Backtracking occurs when one has traversed all the way down the descendants of the root node until one has reached a leaf node (i.e., a node without any children). At this point, we have hit the base case and we *return* instead of calling the recursive function.

10. *For the following tree traversal problems, you can use the Python/JavaScript code in "A Tree Data Structure in Python and JavaScript" in Chapter 4 for your tree and the multiline MAZE string from the mazeSolver.py and mazeSolver.html programs for the maze data.*

*Answer the three questions about recursive solutions for each of the recursive algorithms presented in this chapter. Then re-create the recursive algorithms from this chapter without looking at the original code.*

I am not going to do this for the maze, at least right now (12/15/22). It's not really necessary for what I'm trying to learn. But the preorder, postorder, and inorder tree traversals are very important, so I will use those.

EDIT TO ADD: I did not manage to do these from memory. I knew what each algorithm needed to do *in outline*, but needed to refer back to the chapter to get each one to work precisely as intended. It seems to me that this is acceptable, however, since the goal here is *understanding* rather than *memorization*. I also did have to modify the inorder traversal algorithm to get it to work, so I feel confident that my understanding of how to traverse trees of the sort outlined in this chapter has improved. I do still need to think more about trees *in general* and their relationship to *graphs*. For this, I'll need to re-read Thomas Cormen.

### Preorder Tree Traversal ###

*What is the base case?*

The base case for any tree traversal algorithm is a *leaf* node, that is, any node that does not have children of its own.

*What argument is passed to the recursive function call?*

If the node we are currently considering is *not* a leaf node, then we move to the recursive case. Here we call the tree traversal algorithm on *each of the children of the current node*. For example, if we are examining node A, and node A has two children - nodes B and C - then we will call our tree traversal algorithm on both B and C in the recursive case. We will likewise call the algorithm on any of the children of B and C, until we hit our base case.

*How does this argument become closer to the base case?*
By moving from a node to its children in the recursive case, we keep moving until we hit a leaf node (i.e., a node with no children of its own). We get closer to this simply by moving "down" the tree from parent to child.

Here is the preorder traversal algorithm:

```ruby
def preorder_traversal(node)
  puts node[:data]

  if node['children'].count > 0
    node['children'].each do |child|
      preorder_traversal(child)
    end
  end

  return
end
```

### Postorder Tree Traversal ###

*What is the base case?*

As with preorder tree traversals, the base case is when we reach a leaf node.

*What argument is passed to the recursive function call?*

Again as with preorder tree traversals, the argument passed to the recursive function call is simple: for whatever node we are considering, we pass each of its children in as an argument to the recursive function call.

*How does this argument become closer to the base case?*

Again, by moving from a node to its children in the recursive case, we keep moving until we hit a leaf node (i.e., a node with no children of its own). We get closer to this simply by moving "down" the tree from parent to child.

Here is the postorder traversal algorithm:

```ruby
def postorder_traversal(node)
  node['children'].each do |child|
    postorder_traversal(child)
  end
  puts node[:data]
end
```

### Inorder Tree Traversal ###

The answers to our three questions are the same as with preorder and postorder. The only difference here is that we focus on going to the "left" before going to the "right".

Here's the algorithm:

```ruby
def inorder_traversal(node)
  if node['children'].empty?
    puts node[:data]
  end
  if node['children'].count >= 1
    inorder_traversal(node['children'][0])
    puts node[:data]
  end
  if node['children'].count >= 2
    inorder_traversal(node['children'][1])
  end
  return
end
```