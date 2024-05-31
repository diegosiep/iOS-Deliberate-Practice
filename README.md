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

In swift, the term "object" is used to refer to instances of classes or structs. Simply put, objects, the fundamental building blocks of object-oriented programming, represent a specific instance of a class or a value type. Swift uses this term less frequently, because it emphasizes the difference between classes and value types like structs and enums.

For example, an instance of a given class (Person), would be considered an object; i.e. let person1 = Person(name: Alice, age,: 30).

The term instance and object are used interchangeably, so you can say that person1 is an instance of the Person class but it is also an object.

Remember, while in Swift the term instance and object are used interchangeably, the term "object" is more frequently used for reference types, such as Classes, in Swift. Instances are more frequently used for structs and enums, instead of "objects", which is more reserved for instances of a Class.

# Object-Oriented Programming

Object-Oriented Programming (OOP), is a programming paradigm based on the concept of "objects". Objects are instances of classes or data structures, that encapsulate data and methods. OOP in Swift involves the following key concepts:

1. Classes and Objects --> Classes define blueprint for objects. Objects are an instance of a class.
2. Encapsulation --> Bundling of data and methods inside of a single unit (a class). 
3. Inheritance --> Creation of new classes based on existing ones, inheriting its properties and methods. 
4. Polymorphism --> Treatment of classes as instances of a common superclass. Facilitates the use of generic code.
5. Abstraction --> Allows to focus on what an object does rather than how it does it. Swift's protocols enable abstraction. Abstracting involves simplifying complex reality by modeling classes based on their essential properties and behaviors; protocols allow for such purpose. 


# Functional programming

Functional programming implements the use of functions to achieve a certain process. Swift is a programming language that centres around functional programming. 
The use of '.map' and '.reduce' functions/methods are a good example of functional programming. Instead of implementing a for-loop for iterating and executing certain processes on an array, we can use the '.map' function, implemented by Swift. 
These functions/methods are natively implemented in the Swift programming language to manipulate and execute powerful processes. At the end of the day, it is all about saving time and making the code shorter and more readable with functions.


# Swift inheritance

Traditional inheritance includes the use of classes, superclasses and subclasses to make code more reusable. By defining a class, and its methods, you can also define a subclass that behaves like a subclass or 'child' class and automatically inherits all of the superclass' methods.
Swift inheritance can also make code more reusable by using protocols. Traditionally, when you define a function in a protocol, it must not contain a func body, however, by using an extension for the protocol at issue, we can define a func with a body and later on, conform a certain class to the protocol and exert the same default capabilities defined in the protocol's function contained and defined in an extension.

# Dependency injection

Dependency injection is a software design pattern in which *you* give a certain object its instance variables. In other words, you assign the dependencies of an object in different contexts.

First and foremost, let's keep this in mind:

*James Shore. "Dependency Injection" is a 25-dollar term for a 5-cent concept... Dependency injection means giving an object its instance variables."*

Let's say we have a UIViewController subclass: 

//

import UIKit

class ViewController: UIViewController {

    var requestManager: RequestManager?

}  

//

Its 'requestManager' property value can be set in two ways:

*Without dependency injection*

//

import UIKit

class ViewController: UIViewController {

    lazy var requestManager: RequestManager? = RequestManager()

}

//

Here, we are pretty much tasking the instantiation of the requestManager property to the ViewController class. So yeah, the 'ViewController' class is in charge and knows about the instantiation of its requestManager property.


*With dependency injection* 

// 

let viewController = ViewController()

viewController.requestManager = RequestManager()

//

Instead of initializing the 'requestManager' property automatically when we create an instance of the 'ViewController' class (a.k.a. tasking the 'ViewController' class with instantiating the 'requestManager'), we 'inject' or 'instantiate' the variable into the 'viewController' instance.
In this manner, the view controller doesn't know how to instantiate the 'requestManager' variable.

Its main benefits are associated with code testability and reusability of code.

If we define a certain protocol, define certain classes that conform to that protocol, and define a further class that declares a certain variable of that protocol's type, we can use dependency injection to assign this property's value with an instance of any of the classes that conform to the protocol we created at the beginning.

For example:

*Without dependency injection* 

///

protocol Serializer {

    func serialize(data: AnyObject) -> NSData?

}

class RequestSerializer: Serializer {

    func serialize(data: AnyObject) -> NSData? {
        ...
    }

}

class DataManager {

    var serializer: Serializer? = RequestSerializer()

}

///

*The serializer property's initialisation, is handled by the DataManager class, when we create an instance)*

*With dependency injection*

///

let dataManager = DataManager()


dataManager.serializer = RequestSerializer()

///

*The serializer property's type can be assigned to any class conforming to the 'Serializer' protocol AND its instantiation process is NOT handled by the DataManager class. This simply tells us that the DataManager class DEPENDS on external initialisation of its 'serializer' property*

*Now, let's talk about the different flavours of initialisation*

*Initialiser-based*

Initializer-based injection is the most common type of dependy injection. this simply means giving the dependencies an object needs when being initialised. The main advantage of this approach is that our object will have all they need to work when they're initialised.

/// 

class FileLoader {
    private let fileManager: FileManager
    private let cache: Cache

    init(fileManager: FileManager = .default,
         cache: Cache = .init()) {
        self.fileManager = fileManager
        self.cache = cache
    }
}

///

The *most* important thing to note here, is that we're using *default arguments* for its two dependencies (fileManager, cache), whenever a new instance or a singleton should be created/used. This will enable us to create a File Loader instance, simply by using the FileLoader() initialiser while still allowing us to inject mocks (enable testing), or assign explicit instances in our testing code.  

*Property-based*

Initialiser-based dependency injection can be convenient for certain cases but it can be troublesome for creating classes that inherit from system classes (e.g. ViewControllers, especially when using XIBs and Storyboards).

Property-based dependency injection comes in handy in those cases, where instead of assigning values to the object's dependencies in its initialiser, they're assigned afterwards.

///

class PhotoEditorViewController: UIViewController {
    var library: PhotoLibrary = PHPhotoLibrary.shared()
    var engine = PhotoEditorEngine()
}

///

As you can see, we're assigning default values to the mutable properties in the class above. We're using dependency injection to provide default values *without* a custom initialiser.

Mocks can still be injected whenever we're testing our code. We just need to modify the properties of the class.

///

class PhotoEditorViewControllerTests: XCTestCase {
    func testApplyingBlackAndWhiteFilter() {
        let viewController = PhotoEditorViewController()

        // Assign a mock photo library to gain complete control over
        // what photos are stored in it
        let library = PhotoLibraryMock()
        library.photos = [TestPhotoFactory.photoWithColor(.red)]
        viewController.library = library

        // Run our testing commands
        viewController.selectPhoto(atIndex: 0)
        viewController.apply(filter: .blackAndWhite)
        viewController.savePhoto()

        // Assert that the outcome is correct
        XCTAssertTrue(photoIsBlackAndWhite(library.photos[0]))
    }
}

///

As you can see, instead of using the shared singleton for editing photos of the users' own photo library, we're asigning a mock photo library to have more controll over the photos that are stored in it. 

*Parameter-based*

This type of dependency injection is particularly useful when trying to make legacy code (code without automated unit tests), more testable without having to change too much of its existing structure. Many times we only need a specifying dependency once or mock it under certain conditions.  

 /// 
 
 class NoteManager {
    func loadNotes(matching query: String,
                   completionHandler: @escaping ([Note]) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let database = self.loadDatabase()
            let notes = database.filter { note in
                return note.matches(query: query)
            }

            completionHandler(notes)
        }
    }
}

///

In the above code we need to avoid asynchronous code and parallelism (performing multiple tasks simultaneously to leverage (use something for maximum advantage), multi-core processors and improve performance often using GCD, OperationQueue, Swift Concurrency), as much as possible. We need to specify a queue that NoteManager should *always* use. Paremeter-based dependency injection is more useful in this case where it saves us time and effort from refactoring our entire class and simply inject the queue where loadNotes should run on:

///

class NoteManager {
    func loadNotes(matching query: String,
                   on queue: DispatchQueue = .global(qos: .userInitiated),
                   completionHandler: @escaping ([Note]) -> Void) {
        queue.async {
            let database = self.loadDatabase()
            let notes = database.filter { note in
                return note.matches(query: query)
            }

            completionHandler(notes)
        }
    }
}

///

This will enable us to use a custom queue in our testing code which we can wait on, and (almost) turn the above API, synchronous. 


Another case where paremeter-based dependency injection comes handy, is when we need to test static APIs. Static APIs don't have an initialiser.

The following class relies on on singletons for its dependencies:
 
///

class MessageSender {
    static func send(_ message: Message, to user: User) throws {
        Database.shared.insert(message)

        let data: Data = try wrap(message)
        let endpoint = Endpoint.sendMessage(to: user)
        NetworkManager.shared.post(data, to: endpoint.url)
    }
}
 
///

Instead of relying on singletons, we can use parameter-based dependency injection to easily be able to test it:

///

class MessageSender {
    static func send(_ message: Message,
                     to user: User,
                     database: Database = .shared,
                     networkManager: NetworkManager = .shared) throws {
        database.insert(message)

        let data: Data = try wrap(message)
        let endpoint = Endpoint.sendMessage(to: user)
        networkManager.post(data, to: endpoint.url)
    }
}

///

Default argumetns are used for convenience but also (and more importantly), to make code more testable.

What flavour of dependency injection is the best one? *IT DEPENDS* :/

