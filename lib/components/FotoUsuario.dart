import 'package:flutter/material.dart';

class FotoUsuario extends StatelessWidget {

  IconData icone;

  FotoUsuario(this.icone);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
          color: Colors.white,
          child: Icon(
            icone,
            size: 50,
            color: Colors.grey,
          )),
    );
  }
}
