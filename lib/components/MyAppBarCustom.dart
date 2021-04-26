

import 'package:flutter/material.dart';

import 'FotoUsuario.dart';

class MyAppBarCuston extends StatelessWidget implements PreferredSizeWidget {
  String tipo;

  MyAppBarCuston(
    this.tipo, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tipo == "listaChat") {
      return Container(
        color: Color(0xFFbdbdbd),
        child: Column(
          children: <Widget>[
            Image.asset('images/logo-lhtec.png'),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  FotoUsuario(Icons.person),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      children: [Text("Nome do Agente"), Text("00:00:00")],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 35,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        color: Color(0xFFbdbdbd),
        child: Column(
          children: <Widget>[
            Image.asset('images/logo-lhtec.png'),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  FotoUsuario(Icons.person),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      children: [Text("Nome do Agente"), Text("00:00:00")],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
