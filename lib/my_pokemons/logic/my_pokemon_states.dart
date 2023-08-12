abstract class MyPokemonState {
  const MyPokemonState();
}

class MyPokemonInitialState extends MyPokemonState {
  const MyPokemonInitialState();
}

class MyPokemonLoadingState extends MyPokemonState {
  const MyPokemonLoadingState();
}

class MyPokemonSuccessState extends MyPokemonState {
  const MyPokemonSuccessState();
}

class MyPokemonErrorState extends MyPokemonState {
  final String error;
  const MyPokemonErrorState(this.error);
}
