import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailItemList extends StatelessWidget {
  const DetailItemList({super.key, required this.diferente, required this.pokemon});
  final bool diferente;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: diferente? 0.5 : 1.0,
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          tween: Tween<double>(
            begin: diferente? 300 : 100,
            end: diferente? 100 : 300
          ),
          builder: (context, value, child){
            return Image.network(
              pokemon.image,
              width: value,
              fit: BoxFit.contain,
              color: diferente ? Colors.black.withOpacity(0.4) : null,
            );
          },
        ),
      ),
    );
  }
}