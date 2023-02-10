# Assets Variation - Flutter App

Coffe Images app was made in Flutter and it has two buttons: One that gets a random coffe image from the followig API: https://coffee.alexflipnote.dev and another another to save it to the photo gallery, and also an empty square that displays the image once it is loaded from the network. When the "Load image" button is pressed, a loading widget is shown on the empty square while it waits for the API response (if it is positive, the image is displayed on it). The first time the "Save to gallery" button is pressed, it asks for permission to access the mobile's gallery. If the "Save to gallery" button is pressed and no image was loaded yet or if there was an error on the API conenction, a Snackback shows an error message informing it. The Bloc Pattern was used to handle business logic (with a test class added for it and for the widgets).

# Main Screen:

<img width="440" alt="image" src="https://user-images.githubusercontent.com/69281497/218193137-847a876e-e30f-4a20-a3e3-e75056ea455b.png">

# Loading:

<img width="403" alt="image" src="https://user-images.githubusercontent.com/69281497/218193253-000fbf77-308c-4a45-98a1-9a2643d9d81c.png">

# Photo Displayed scenario:

<img width="438" alt="image" src="https://user-images.githubusercontent.com/69281497/218193290-1ef2d502-d93e-4b7b-8fe7-5fabf0ef36de.png">

# Permission denied scenario:

<img width="447" alt="image" src="https://user-images.githubusercontent.com/69281497/218193802-1c3559eb-585d-4877-a989-a5ffa52697af.png">

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

