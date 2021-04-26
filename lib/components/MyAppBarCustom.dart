import 'package:flutter/material.dart';

import 'FotoUsuario.dart';

class MyAppBarCuston extends StatelessWidget implements PreferredSizeWidget {
  String tipo;

  MyAppBarCuston(
    this.tipo, {
    Key key,
  }) : super(key: key);

  double proporcaoAltura = 0.16;

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;

    if (tipo == "listaChat") {
      return Container(
        height: alturaTela * proporcaoAltura,
        width: larguraTela,
        color: Color(0xFFbdbdbd),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Image.asset('images/logo-lhtec.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 5),
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
        height: alturaTela * proporcaoAltura,
        width: larguraTela,
        color: Color(0xFFbdbdbd),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Image.asset('images/logo-lhtec.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 5),
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
