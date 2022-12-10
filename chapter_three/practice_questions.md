# Practice Questions

1. *What is the head of an array or string?*

The head of an array or string is the first element or character (respectively) of that array or string. For example, in the array `[1,2,3]`, the head is `1`. Likewise, in the string `'hello'`, the head is `'h'`.

2. *What is the tail of an array or string?*

The tail of an array or string is the *remainder* of elements or characters in that array or string after removing the head. To use the above examples again, the tail of our array is `[2,3]`, while the tail of our string is `'ello'`. Notice in the case of the array that the head and the tail are different *data types*: the head is an *integer* while the tail is itself an *array* (specifically, a *subarray* of the original).

3. *What are the three questions this chapter presents for each recursive algorithm?*

We should ask these three questions for each recursive algorithm we encounter:

- What is the *base case*?
- What is the *recursive case*?
- How does the recursive case *approach* the base case?

Answering these is required for writing any recursive algorithm.

4. *What is the leap of faith in recursion?*

The leap of faith is (apparently) a technique used to get around the mental block a programmer might experience when attempting to write a recursive function. Taking the leap of faith requires understanding what your recursive function's cases and return values are, so that you can write the recursive case of your function assured that it will approach the base case and deliver a result.

(NB: This part of the chapter felt superfluous and unclear. The answer above is basically just cribbed from page 50. I don't think this is essential at all. This isn't Kierkegaard.)

5. *What do you need to understand about the recursive function you are writing before you can take a leap of faith?*

Apparently you need to understand its inputs and return values.

(NB: Again, this "leap of faith" stuff is deeply unhelpful.)

6. *How does a linear data structure as an array or string resemble a tree-like structure?*

One can think of an array as akin to a tree with only a *single branch* at each node. Think of a tree as starting from its *trunk*. At a certain height, it might split into several *branches*. This point of departure is a *node*. Each branch might have its own node or nodes at which it splits into *smaller branches*. An array or a string can be visualized as a tree where each node only splits off into *one direction*. If you draw a line from the trunk to the first node, and then follow just one branch until you hit its own first node, and then follow just one branch from that node, until you reach the end of the tree, this would represent a linear data structure like an array or string. This is why recursion works on arrays and strings so well: recursion is useful for handling tree-like structures, and arrays and strings are essentially simplified tree structures. What makes recursion *unnecessary* in many cases, however, is that arrays and strings, unlike other kinds of tree structures, *do not involve backtracking*.

7. *Does the recursive sum() function involve any backtracking over the data it works on?*

No. It takes each element of the array in succession as its *head* and the remainder of the array as its *tail*. With each recursive call, we have a new head and tail until we ultimately hit the base case, but we never *go back* or *return* to earlier heads or tails. Therefore, there is no backtracking.

8. *In the flood fill program, try changing the `im` variable's strings to create a C shape that is not fully enclosed. What happens when you attempt to flood-fill the image from the middle of the C?*

Pass.

9. *Answer the three questions about recursive solutions for each of the recursive algorithms presented in this chapter:*

*What is the base case?*
*What argument is passed to the recursive function call?*
*How does this argument become closer to the base case?*

*Then re-create the recursive algorithms from this chapter without looking at the original code.*

The three recursive algorithms presented in this chapter are: calculating the sum of elements in an array, reversing a string, and detecting palindromes. I shall consider each successively.

*** Summing the Elements in an Array ***

Here is a quick recursive function for summing the elements of an array:

```ruby
def sum_elements(array)
  return 0 if array.empty?

  head = array.first
  tail = array[1..-1]
  return head + sum_elements(tail)
end
```

The base case is when the array is *empty*. In that case, the sum is obviously 0.
In the recursive case, we pass in the *tail* of the array. This is the subarray that includes every element *except the first*, which is known as the *head* of the array.
The recursive case approaches the base case because every time it calls the function on the tail of the original array, the tail has one fewer element in it. If we pass in an original array of `[1,2,3]`, for example, on the first recursive call, the head is `1` and the tail is `[2,3]`. So then we call the original function on the tail, meaning that on the *next* recursive call, the head is now `2`, and the tail is `[3]`. We call the original function again, hitting the recursive call one more time. The head is now `3` and the tail is `[]`. This hits the base case, and we calculate the sum.

*** Reversing a String ***

Here is a quick recursive function for reversing a string:

```ruby
def reverse_a_string(str)
  return str if str == '' or str.length == 1

  first_char = str[0]
  return reverse_a_string(str[1..-1]) + first_char
end
```

The base case is when the string is empty or has a single character. An empty string or a single character string (i.e., `"e"`) is its own reverse, so we can simply return that.
To reverse a string, we know we want to take the first character of that string and put it at the very end of the string. For a string with only two characters, like `"hi"`, this is easy: simply move `"h"` behind `"i"` to get `"ih"`. But for longer strings, it will not be sufficient. Consider `"cat"`. If all we do is move the `"c"` to the end of the string, we'll get `"atc"`. But the reverse of `"cat"` is `"tac"`. So what we need to do is move the first character of the string to the end of the string, *and then reverse the remaining characters of the string*. This is what we therefore pass into our recursive function call: the *tail* of the string.
The function approaches the base case in the same way that it does with summing the elements of an array: each time the recursive function is called, the *tail* of the string has one fewer character in it.


*** Finding a Palindrome ***

Here is a quick recursive function for determining whether a string is a palindrome. Please note that this function only works if all spaces are removed (in the case that the string is a *phrase* rather than a *word*):

```ruby
def is_a_palindrome?(str)
  return true if str == '' or str.length == 1

  first_char = str[0]
  last_char = str[-1]
  middle = str[1..-2]

  return first_char == last_char && is_a_palindrome?(middle)
end
```

The base case is the same as reversing a string: an empty string or a string with a single character is trivially a palindrome.
The recursive case passes in what is known as the *middle* of the string: every character *except the first and last*. The reason is simple: every palindrome must obviously be such that its first and last characters are the same. So we first check those. If they are the same, then we simply remove each from the total string and check whether *that substring* is a palindrome.
This approaches the base case because we continually pass in smaller substrings to our recursive function until we end up with either an empty string or a string of a single character.