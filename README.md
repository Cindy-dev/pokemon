# pokemon
A Pokemon app built with flutter and PokeAPI endpoint.

## Getting Started
Instructions to run:

1. This project was built with flutter, Please make sure you have that installed
2. First do `flutter pub get` and then `flutter run` to run project


Project Details:

1. The project is structured using clean architecture
2. Riverpod is used as state management
3. Local database is used to store offline data
4. Infinite scroll pagination is handled


Packages used:

- State Management - flutter_riverpod
- View Svg Images - flutter_svg
- To Compare Object - equatable
- Network Calls - dio
- To store values in local storage - isar
- To Provide local storage path - path_provider

Screen flow/Project Structure:
- A Splash Screen 
- A Login Screen that accepts specific inputs like email must contain @ and password should not be less than 3
- A Screen that displays list of pokemons with their image and name also infinite scrolling is enabled
- A Favorite screen placed in a tab to show list of favorite Pokemons
- A Pokemon detail screen that displays somme pokemon details
- A floating action button that opens a modal sheet for creating your own Pokemon
- A Button to navigate to your Pokemon screen
- A Screen that displays your Pokemon stored in a local database

DOWNLOAD APK:
<a href='https://drive.google.com/file/d/1SVOpeIxEkBoHy1SjBDJR7lNLYStss1p6/view?usp=sharing'</a>


Images:
<p align="center">
    <img src="assets\images\screenshots\login.png" width="400">
    <img src="assets\images\screenshots\pokemon_screen.png" width="400">
    <img src="assets\images\screenshots\pokemon_detail.png" width="400">
    <img src="assets\images\screenshots\favorite.png" width="400">
    <img src="assets\images\screenshots\form.png" width="400">
    <img src="assets\images\screenshots\my_pokemon.png" width="400">
   </p>

