# pokemon

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.



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

