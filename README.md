# ADV-basics II - Fundamentals Deep Dive

# Using "if" Statements In Lists

The if statement is a crucial feature of the Dart language - actually, it's a core feature of pretty much all programming languages.

In addition to what you learned in the previous lecture, in Dart, you may also use if inside of lists to conditionally add items to lists:

    final myList = [
      1,
      2,
      if (condition)
        3
    ];

In this example, the number 3 will only be added to myList if condition was met (condition can be true or false or a check that yields true or false - e.g., day == 'Sunday').

Please note that there are NO curly braces around the if statement body. The if statement body also only comprises the next line of code (i.e., you can't have multiple lines of code inside the if statement).

You can also specify an else case - an alternative value that may be inserted into the list if condition is not met:

```dart
    final myList = [
      1,
      2,
      if (condition)
        3
      else
        4
    ];
```

Using this feature is optional. Alternatively, you could, for example, also work with a ternary expression:

```dart
 final myList = [
      1,
      2,
      condition ? 3 : 4
    ];
```    

Especially when inserting more complex values (e.g., a widget with multiple parameters being set) into a more complex list (e.g., a list of widgets passed to a Column() or Row()), this feature can lead to more readable code.

You will also see it being used later in the course. It will be explained again then.

You can also learn more about this feature here: <https://github.com/dart-lang/language/blob/master/accepted/2.3/control-flow-collections/feature-specification.md>

---

# if Statements & Comparison Operators

When using if statements - no matter if inside or outside of functions - as well as when using ternary expressions, you ultimately must provide a boolean value (true / false):

```dart
 if (true) {
      // do something ...
    }
    // or
    true ? 'this' : 'that'
```

Of course, hardcoding true or false into the code makes no sense though - you wouldn't need an if statement or ternary expression if a value would always be true or always be false.

Instead, true or false is typically derived by comparing values - e.g, comparing a number to an expected value:

```dart
 if (randomNumber == 5) {
      // do something
    }
```

The == operator checks for value equality (i.e., the values on the left and right side of the operator must be equal). It must not be mistaken with the assignment operator (which uses a single equal sign: =).

The assignment operator is used to assign values to variables:

```dart
    var userName = 'Max'; // assignment operator used
    if (userName == 'Max') { ... } // comparison operator used
```

Besides the equality operator (==) Dart also supports many other key comparison operators:

    != to check for inequality (randomNumber != 5 expects randomNumber to NOT be 5, i.e., to be any other value)

    > to check for the value on the left to be greater than the value on the right (randomNumber > 5 yields true if randomNumber is greater than 5)

    >= to check for the value on the left to be greater than or equal to the value on the right (randomNumber >= 5 yields true if randomNumber is greater than 5 or equals 5)

    < to check for the value on the left to be smaller than the value on the right (randomNumber < 5 yields true if randomNumber is smaller than 5)

    <= to check for the value on the left to be smaller than or equal to the value on the right (randomNumber <= 5 yields true if randomNumber is smaller than 5 or equals 5)
---

# Using "for" Loops In Lists

Just as you can also use the if keyword inside of lists (to add elements conditionally), you can also use the for keyword to add multiple items into a list:

    final numbers = [5, 6];
    final myList = [
      1,
      2,
      for (final num in numbers)
        num
    ];

In this example, the numbers 5 and 6 will be added to myList (hence myList thereafter is [1, 2, 5, 6]).

This for ... in syntax is a special variation of the for loop that loops through multiple items in a list. You will see it again later in the course - both outside and inside of a list. It will also be explained again later.

The idea behind this loop is to simplify the process of performing some operation on all items in a list.

When used in a list, it's essentially an alternative to the spread operator (...):

```dart
 final numbers = [5, 6];
    final myList = [
      1,
      2,
      ...numbers
    ];
```
   

It can be useful in scenarios where values must be transformed before being added to a list - the for ... in loop can then be used instead of map() + spread operator:

```dart
      final numbers = [5, 6];
    final myList = [
      1,
      2,
      ...numbers.map((n) {
        return n * 2; 
      }) // adds 10 and 12
    ];
```

can be replaced with:

```dart
     final numbers = [5, 6];
    final myList = [
      1,
      2,
      for (final num in numbers)
        num * 2 // adds 10 and 12
    ];
```


As mentioned, you will learn more about for later in the course.

You can also learn more about for ... in inside of lists here: https://github.com/dart-lang/language/blob/master/accepted/2.3/control-flow-collections/feature-specification.md#repetition


## Note: A Typo In The Next Lecture

Just a quick note: In the next lecture, in the questions_summary.dart file, there will be a typo.

Instead of writing

    Text(((data['question'] as int) + 1).toString()),

write

    Text(((data['question_index'] as int) + 1).toString()),

