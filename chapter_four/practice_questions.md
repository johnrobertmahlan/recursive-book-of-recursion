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