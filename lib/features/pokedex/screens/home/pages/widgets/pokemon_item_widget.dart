import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({super.key, required this.pokemon, required this.onTap, required this.index});
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap('/details', DetailArguments(pokemon: pokemon, index: index)),
      child: Stack(
        children: [
          Container(
          decoration: BoxDecoration(
            color: pokemon.baseColor!.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        pokemon.name,
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )
                      ),
                    ),
                    Text(
                      '#${pokemon.num}',
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.4), 
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pokemon.type
                        .map((e) => TypeWidget(
                          name: e,
                        ))
                      .toList(),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
                ),
        Positioned(
          bottom: 12,
          right: 2,
          child: Image.network(
            pokemon.image,
            height: 120,
          )
        )
        ]
      ),
    );
  }
}