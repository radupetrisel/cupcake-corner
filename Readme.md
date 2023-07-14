# Cupcake Corner

This is project 10 of 100 Days of SwiftUI by Paul Hudson (link [here](https://www.hackingwithswift.com/books/ios-swiftui/cupcake-corner-introduction)). This project is multi-screen app for ordering cupcakes.

As usual, at the end of the tutorial there will be three challenges, which I will implement in separate commits each.

## Challenges

**Challenge #1**: Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.

**Challenge #2**: If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, try commenting out the request.httpMethod = "POST" line in your code, which should force the request to fail.

**Challenge #3**: For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.
