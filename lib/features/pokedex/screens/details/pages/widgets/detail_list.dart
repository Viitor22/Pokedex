import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_item_list.dart';

class DetailList extends StatelessWidget {
  const DetailList({super.key, required this.pokemon, required this.list, required this.controller, required this.onChangePokemon});
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
      color: pokemon.baseColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(pokemon.name, style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                ),
                Text('#${pokemon.num}', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                ],
              ),
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: PageView(
              onPageChanged: (index) => onChangePokemon(list[index]),
              controller: controller,
              children: list.map(
                (e) {
                  bool diferente = e.name != pokemon.name;
                  return DetailItemList(diferente: diferente, pokemon: e);
                } 
                ).toList(),
            ),
          ),
          ],
        ),
      ),
    );
  }
}