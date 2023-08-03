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
