import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/ui/menu_page.dart';
import 'package:pokeapi/ui/random_pokemon/bloc/random_pokemon_bloc.dart';
import 'package:pokeapi/ui/search_pokemon/bloc/search_pokemon_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchPokemonBloc(),
        ),
        BlocProvider(
          create: (context) => RandomPokemonBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MenuPage(),
      ),
    );
  }
}
