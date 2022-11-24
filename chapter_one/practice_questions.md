# Practice Questions

1. *In general, what is a recursive thing?*

A recursive thing is a thing whose definition includes itself. For example, Sierpinski triangles are recursive things, since the definition of a Sierpinski triangle *includes* a reference to Sierpinski triangles.

2. *In programming, what is a recursive function?*

A recursive function is a function that calls itself. For example, a function to calculate the factorial of a given number might be a recursive function. In calculating the factorial of 5, it will call itself to calculate the factorial of 4, and then multiply the result of that function call by 5 to get the factorial of 5.

3. *What four features do functions have?*

Typically, a function has four features: (a) it has some code that runs when the function is called, (b) it accepts *arguments* or *parameters* when it is called, which are the *inputs* to the function, (c) it has a *return value*, which is the *output* of the function after its code runs, and (d) a function remembers (as it were) which line of code in the program it belongs to called it, and it returns to that line of code after it has finished executing.

4. *What is a stack?*

A stack is a simple data structure that stores elements in a particular order, and where elements can only be added or removed in one way. Specifically, a stack obeys *last in, first out* logic. For example, a deck of cards functions like a stack data structure. The card on top of the deck was the "last in": it was the *last card* added to the deck. But that same card is also the "first out": it is the *first card* to be removed from the deck.

5. *What are the terms for adding and removing values to and from the top of a stack?*

Adding a value to the top of a stack is called *appending* or *pushing* a value to the stack. Removing a value from the top of the stack is called *popping*.

6. *Say you push the letter J to a stack, then push the letter Q, then pop the stack, then push the letter K, then pop the stack again. What does the stack look like?*

Thinking of the stack as an array of elements, we can envision it in this way:

``` ruby
stack = []
stack.push('J')
stack.push('Q')
stack.pop
stack.push('K')
stack.pop
```

Envisioned as an array, `stack` looks like this: `stack = ["J"]`.

The key thing to keep in mind about a stack is that, like a deck of cards, you can only ever see what is on top of it. So even if our sample array had had multiple elements, we should say that what it "looks like" is whatever element is *last*. In this case, since `stack` has just one element, this is the same result. Therefore, our stack "looks like" this: `"J"`.

7. *What is pushed and popped onto the call stack?*

The elements that belong to the call stack are known as *frame objects*. A frame object is pushed onto the call stack whenever a function is called, and it is popped off the call stack whenever a function returns. The frame object stores essential data for the proper functioning of the program, including: the line of code that originally called the function, any parameters or arguments passed in to the funciton when it was called, and also local variables created during the call.

8. *What causes a stack overflow to happen?*

A stack overflow happens when too many frame objects are pushed onto the call stack, so that the memory allotted to storing the call stack is exhausted. This happens when the function (or functions) being called *do not return anything*. Since frame objects are popped off the call stack only when a function returns a value, if the functions being added to the call stack are not returning values, they will not be popped off the stack.

9. *What is a base case?*

A base case is the part of a recursive function that *stops* the recursion. It does this by returning a value and *not* calling the recursive function. For example, in a recursive function to calculate the factorial of a given number, the base case will be when the number whose factorial we are to calculate is 1. The factorial of 1 is simply 1, so the recursive function no longer needs to call itself to continue calculating. Instead, it can simply return 1.

10. *What is a recursive case?*

A recursive case is the part of a recursive function that *continues* the recursion. It does this by calling the recursive function again. For example, in a recursive funciton to calculate the factorial of a given number, the recursive case will be when the number whose factorial we are to calculate is anything *greater than* 1. So, if the number whose factorial we are to calculate is, for example, 2, the recursive case will *call the recursive function again* on the value of 2 - 1 (which will lead to the base case and the end of recursion).

11. *How many base cases and recursive cases do recursive functions have?*

A recursive function may have multiple base or recursive cases. But it must have *at least* one of each.

12. *What happens if a recursive function has zero base cases?*

If a recursive function has zero base cases, it will continually call itself without ever returning anything. This will keep pushing more frame objects onto the call stack, leading to a stack overflow.

13. *What happens if a recursive function has zero recursive cases?*

If a recursive function has zero recursive cases, it will never call itself, and so will simply return the value of the base case.