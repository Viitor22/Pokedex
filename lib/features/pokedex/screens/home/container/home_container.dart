import 'package:flutter/material.dart';
import 'package:pokedex/common/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:pokedex/common/widgets/po_error.dart';
import 'package:pokedex/common/widgets/po_loading.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.repository, required this.onItemTap});
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return PoLoading();
      }

      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
        return HomePage(list: snapshot.data!, onItemTap: onItemTap,);
      }

      if (snapshot.hasError) {
        return PoError(error: (snapshot.error as Failure).message!);
      }

      return Container();
    }, 
    );
  }
}