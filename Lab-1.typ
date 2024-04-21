#import "Class.typ": *
#show: ieee.with(
  title: [Report Lab],
  /*
  abstract: [
    #lorem(10).
  ],
  */
  authors:
  (
    (
      name: "khalil hannechi ",
      department: [Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "khalilhannechi",
    ),
   
    (
      name: "Aziz chaieb",
      department: [Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
    ),
  )

  // index-terms: (""),
  // bibliography-file: "Biblio.bib",
)

= Exercises
The following exercises will help you practice various aspects of Julia, such as functions, loops, conditionals, arrays, and file processing. Remember to break down the exercises into smaller steps and test your code along the way. You are required to carry out this lab using either of:

#figure(
    stack(
        dir: ltr,       // left-to-right
        spacing: 1cm,   // space between contents
        image("Images/Jupyter.png", width: 10%, fit: "contain"),
        image("Images/Pluto.svg", width: 50%, fit: "contain"),
    ),
)

#exo[Fibonacci Sequence][Write a function that generates the Fibonacci sequence#footnote[The Fibonacci sequence starts with $0$ and $1$, and each subsequent number is the sum of the two preceding numbers.] up to a given number $n$.]

// The function should return an array of the Fibonacci sequence. For example, if $n = 10$, the function should return $[0, 1, 1, 2, 3, 5, 8, 13, 21, 34]$.


$F_(0) = 0 \ F_(1) = 1 \  F_(n) = F_(n-1)+F_(n-2) quad forall n >= 2$

```julia
Fibonacci Sequence (n::Int)
  if n <= 1
    return n
  if n>=2
    return Fibonacci Sequence(n-1) + Fibonacci Sequence(n-2)
  end
end
```

#test[Display the Fibonacci sequence if $n=16$.]

#exo[Prime Number][Write a function that determines if a given number $n$ is prime#footnote[A prime number is a number greater than $1$ that has no positive divisors other than $1$ and itself.]. The function should return true if the number is prime and false otherwise.]

```julia
function is_prime(n)
    if n <= 1  # Numbers less than or equal to 1 are not prime
        return false
    end
    if n <= 3  # 2 and 3 are prime
        return true
    end

    if n % 2 == 0 || n % 3 == 0  # Any number divisible by 2 or 3 (besides 2 and 3) is not prime
        return false
    end

    i = 5
    while i * i <= n  # Check divisibility up to the square root of n
        if n % i == 0 || n % (i + 2) == 0
            return false
        end
        i += 6  # Optimization: Only check numbers of the form 6k ± 1
    end
    return true
end

# Test the function
println(is_prime(5))  # Output: true
println(is_prime(8))  # Output: false


```

#test[Give the list of prime numbers less than $100$.]

#exo[Palindrome][Write a function that checks if a given string is a palindrome#footnote[A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward.]. The function should return true if the string is a palindrome and false otherwise.]

```julia
function fibonacci(n::Int)
  if n <= 1
    return n
  end

  a, b = 0, 1  # Initialize first two Fibonacci numbers
  for _ in 2:n
    c = a + b
    a, b = b, c  # Update the previous two numbers
  end
  return c
end

# Display Fibonacci sequence for n = 16
n = 16
for i in 1:n
  println(fibonacci(i-1))  # Print each Fibonacci number (0-based indexing)
end
```

#test[Check the sentence "Was it a car or a cat I saw?". Disregard spaces and punctuation marks.] 

#exo[Matrix Operation][Implement functions to perform basic matrix operations such as matrix addition, matrix multiplication, and determinant calculation.]

```julia
# Function for matrix addition (assuming matrices have the same dimensions)
function matrix_add(A::Matrix, B::Matrix)
  if size(A) != size(B)
    error("Matrices must have the same dimensions for addition")
  end

  rows, cols = size(A)
  C = zeros(rows, cols)
  for i in 1:rows
    for j in 1:cols
      C[i, j] = A[i, j] + B[i, j]
    end
  end
  return C
end
```
#test[Test your functions with the following matrices
```julia
A = [1 2; 3 4]
B = [5 6; 7 8]
```
]

#exo[File Processing][Write a program that reads a text file and counts the occurrences of each word. Display the word count for each unique word in the file.]

```julia
function count_words(text::String)
  # Open the text file for reading
  file = open(teaxt.txt)

  # Initialize an empty dictionary to store word counts
  word_counts = Dict{String, Int}()

    # Split the line into word 
    words = split(lowercase(replace(line, r"^\W+", "")), r"\W+").filter(x -> x != "")

    # Add word counts to the dictionary
    for word in words
      word_counts[word] = get(word_counts, word, 0) + 1
    end
  end

  # Display word counts
  println("Word Counts:")
  for (word, count) in word_counts
    println("$word: $count")
  end
end

# Example usage: Replace "your_file.txt" with the actual file path
count_words("your_file.txt")

```

#test[Redirect the output of 'man ls' command to a dummy file and display the word count for 'ls'
```bash
man ls > dummy
```
]

