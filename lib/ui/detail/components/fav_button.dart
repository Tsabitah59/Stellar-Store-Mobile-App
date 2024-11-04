import 'package:flutter/material.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key});

  @override
  State<FavButton> createState() => _FavButtonState();
}

var _isSelectedFav = true;

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSelectedFav = !_isSelectedFav;
        });
      },
      icon: _isSelectedFav ? const Icon(Icons.favorite_border_outlined) : const Icon(Icons.favorite),
    );
  }
}