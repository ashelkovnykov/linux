# Programming Language Descriptors

## Array (a.k.a Vector)

A type of programming language which allows the program to operate on multiple input values at the same time. Unlike parallel programming, which breaks problems down into smaller pieces which can be solved individually in parallel or in sequence, array programming performs operations on vectors of data to resolve an entire set of problems at once. Array programming exploits the properties of datasets: that the individual data comprising a dataset are similar and adjacent.

## Constraint

A sub-type of declarative programming languages. The programmer defines a set of variables, a set of constraints on the valid values for those variables, a constraint-solving pattern (e.g. backtracking, constraint propogation, etc.), and a desired solution (e.g. find any solution, find all solutions, prove that no solutions exist).

### Related Descriptors

* Functional
* Logic

## Data-Driven

A type of programming language in which the input data controls the flow of the program, not the program instructions: the program instructions exist only to interpret the data and execute the commands contained therein. It's often used for state machines, where a general state transition engine is created, and can function over any generic, well-formed input data containing a set of states, transition rules, and initial state.

## Declarative

A programming language paradigm in which the programmer expresses the logic of a computation without describing the exact control flow. In other words, the programmer describes what the program must achieve, without describing how it is to be achieved. The "how" of the solution is left to the compiler for the particular language to determine. Declarative programming is generally opposed to side-effects: the manipulation of a state/resource outside of the local scope of a function/expression.

### Opposite

* Imperative

### Language Sub-types

* Constraint
* Functional
* Logic

## Dynamic

A programming language paradigm where type safety checks are performed either during runtime, or never.

### Opposite

* Static

## Esoteric

A programming language paradigm in which the programmer uses a language other than a natural language.

### Opposite

* Literate

## Event-Driven

A type of progamming language focussed on reacting to external events, such as user input, sensor output, or messages from other programs. Often implemented as an infinite main-loop which waits for an event to occur and reacts appropriately.

## Function-Level

A programming language paradigm which disallows variables and the creation of arbitrary functions. Such a language contains atoms (e.g. 0, 1, empty list, etc.) and functions (e.g. addition, multiplication, concatenation, etc.). It also contains higher-order functions for creating new functions, which are the only way to create new functions: by combining existing functions.

### Opposite

* Value-Level

## Functional

A sub-type of declarative programming languages. In a functional programming language, routines are defined as trees of expressions which return a single value, as opposed to sequences of imperative statements which modify state. All functions are deterministic, purely mathematical functions: given the same arguments, the function will always return the same result (the function contains no mutable state and cannot be affected by side-effects).

### Related Descriptors

* Constraint
* Logic

## Generic

A type of programming language which involves writing algorithms over unspecified types, which are instantiated into specific functions on a particular type based on their usage throughout the program. For example, the addition algorithm is the same for both signed and unsigned integers, it's only the type which differs.

## Imperative

A programming language paradigm which formulates programs as sequences of explicit commands which modify the state of the program's variables. The programmer describes how the program must operate. The "what" that the program achieves is a natural consequence of how it operates. The vast majority of hardware is setup to execute imperative machine code statements, so in one sense imperative languages are the "natural" standard.

### Opposite

* Declarative

### Language Sub-types

* Procedural
* Object-Oriented

## Literate

A programming language paradigm where the programmer describes the task the program is to perform in a combination of natural language and snippets of macro/source code.

### Opposite

* Esoteric

## Logic

A sub-type of declarative programming languages based on formal logic. The program is written as a set of logical sentences which express either facts or rules about the domain. The program then uses deductive (forward) logic to identify all the conclusions from the provided statements. Alternatively, it can answer questions about whether a particular clause is true, false, or undetermined.

### Related Descriptors

* Constraint
* Functional

## Metaprogramming

A type of programming language which allows the program to treat other programs as its own data. This allows the program to clone, modify, and delete source code, meaning that the program can modify the behaviours of other programs or itself.

### Related Descriptors

* Reflective

## Object-Oriented

A sub-type of procedural programming languages where the data structures and procedures are grouped into "objects". Objects are a mental abstraction for the programmer to conceptualize how different parts of the code should interact with each other. Objects can only interact with their own data structures and procedures, as well as any data structures and/or procedures which other objects choose to expose. These access rules are enforced by the compiler through a system of permission levels and namespaces.

## Procedural

A sub-type of imperative programming languages where the code is organized into groups of imperative statements called "procedures" (or "routines", or "functions"). Each procedure is self-contained, meaning that its code can be executed by another procedure. Once the procedure has completed, it will return to the instruction address from which it was called, having modified the program state. A procedure may call other procedures from within in. The unique idea of procedural programming languages is that the procedures can be called multiple times and from many locations.

### Language Sub-types

* Object-Oriented

## Reflective

A sub-type of metaprogramming languages, in which the language can be its own metaprogramming language.

## Static

A programming language paradigm where type safety checks are performed during compile time, so that the language can ensure type safety at runtime.

### Opposite

* Dynamic

## Structured

A programming language paradigm where strict rules exist governing the flow of a program through machine instructions. The programmer must control the flow using the existing flow-control tools: selection (ex. 'if' statements), repetition (ex. 'for' loops), and subroutines.

### Opposite

* Unstructured

## Unstructured

A programming language paradigm where there are no hard rules about how the program must move between machine instructions. The programmer is free to write a program in which the code may jump arbitrarily to any machine instruction.

### Opposite

* Structured

## Value-Level

A programming language paradigm where the program creates, combines, and modifies values until the desired final value is reached. The language has a focus on maintaining multiple variables at any given time and creating arbitrary functions for modifying those values.

### Opposite

* Function-Level

