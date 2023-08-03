# iOS-Deliberate-Practice

A place to understand iOS development topics, a place to practice.

# Combine


# Model-View-ViewModel

Model-View-ViewModel (MVVM), is a design pattern utilised in iOS app development that separates components into three pieces that are connected: 

1. Model --> represents data, logic of the application. Ex. strcutures, enums, and the properties inside of those data types, etc.
2. View --> user interface components that user interacts with. Displays data to user and captures user input as well. The View in this arquitecture is only responsible for displaying data and sending user interactions to the ViewModel.
3. ViewModel --> provides formatted data to the view to display; intermediary between Model and View; also handles user interactions; may implement methods inside of its declaration.

The main difference betweeen MVVM and MVC, is that MVVM works with the ViewModel to update the user interface but the view is only in charge of displaying what the ViewModel holds as data; in MVC the controller or the user interactions with the interface, modifies directly an instance of the Model; MVVM works with the ViewModel to make decisions on what the View should display. Also, in MVVM, an instance of the ViewModel is created, rather than a direct instance of the model, as it happens in MVC.

An example of these two patterns can be found here.

# Objects

In swift, the term "object" is used to refer instances of classes or structs. Simply put, objects, the fundamental building blocks of object-oriented programming, represent a specific instance of a class or a value type. Swift uses this term less frequently, because it emphasizes the difference between classes and value types like structs and enums.

For example, an instance of a given class (Person), would be considered an object; i.e. let person1 = Person(name: Alice, age,: 30).

The term instance and object are used interchangeably, so you can say that person1 is an instance of the Person class but it is also an object.

Remember, while in Swift the term instance and object are used interchangeably, the term "object" is more frequently used for reference types, such as Classes, in Swift. Instances are more frequently used for structs and enums, instead of "objects", which are more reserved for instances of a Class.

# Object-Oriented Programming

Object-Oriented Programming (OOP), is a programming paradigm based on the concept of "objects". Objects are instances of classes or data structures, that encapsulate data and methods. OOP in Swift involves the following key concepts:

1. Classes and Objects --> Classes define blueprint for objects. Objects are an instance of a class.
2. Encapsulation --> Bundling of data and methods inside of a single unit (a class). 
3. Inheritance --> Creation of new classes based on existing ones, inheriting its properties and methods. 
4. Polymorphism --> Treatment of classes as instances of a common superclass. Facilitates the use of generic code.
5. Abstraction --> Allows to focus on what an object does rather than how it does it. Swift's protocols enable abstraction. Abstracting involves simplifying complex reality by modeling classes based on their essential properties and behaviors; protocols allow for such purpose. 


