import 'package:flutter/material.dart';
import 'package:omni_chat_telas/components/FotoUsuario.dart';
import 'package:omni_chat_telas/components/MyAppBarCustom.dart';

import 'chat_screen.dart';

class ChatsRecebidosScreen extends StatefulWidget {
  @override
  _ChatsRecebidosScreenState createState() => _ChatsRecebidosScreenState();

  static const String id = 'chats_recebidos_screen';
}

BuildContext context_aux;

class _ChatsRecebidosScreenState extends State<ChatsRecebidosScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;
    double proporcaoAlturaAppBar = MyAppBarCuston("list",alturaTela).proporcaoAltura;
    double proporcaoAlturaBody = 1.00 - proporcaoAlturaAppBar;

    double proporcaoComponenteFundo = 0.93;

    double alturaFundo =
        alturaTela * proporcaoAlturaBody * proporcaoComponenteFundo;
    double alturaComponetBaixo =
        alturaTela * proporcaoAlturaBody * (1 - proporcaoComponenteFundo);

    context_aux = context;
    return Scaffold(
      appBar: MyAppBarCuston("listaChat",alturaTela),
      body: SingleChildScrollView(
        child: Container(
          height: alturaTela*proporcaoAlturaBody,
          width: larguraTela,
          color: Colors.greenAccent,
          child: Column(
            children: <Widget>[
              TabBar(
                  unselectedLabelColor: Colors.white,
                  controller: _tabController,
                  indicator: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20)),
                      color: Colors.white),
                  labelColor: Colors.green,
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.group_add),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Em Atendimento"),
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(Icons.people),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Internos"),
                          )
                        ],
                      ),
                    ),
                  ]),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: TabBarView(controller: _tabController, children: [
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Buscar Atendimento",
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: lista_aux.length,
                              itemBuilder: _listaChats),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Buscar Contato",
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: lista_aux.length,
                              itemBuilder: _listaChats),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
              Container(
                height: alturaComponetBaixo,
                color: Colors.blue[200],
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      width: 50,
                    )),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: IconButton(
                        icon: Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<ListTile> lista_aux = [
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text(
          "Texto checado",
          style: TextStyle(color: Colors.black),
        )
      ],
    ),
    leading: FotoUsuario(Icons.person),
    trailing: Column(
      children: [
        Text("00:00:00"),
        Icon(
          Icons.notifications,
          color: Colors.black,
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    trailing: Column(
      children: [
        Text("00:00:00"),
        Icon(
          Icons.notifications,
          color: Colors.black,
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    trailing: Column(
      children: [
        Text("00:00:00"),
        Icon(
          Icons.notifications,
          color: Colors.black,
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    trailing: Column(
      children: [
        Text("00:00:00"),
        Icon(
          Icons.notifications,
          color: Colors.black,
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    trailing: Column(
      children: [
        Text("00:00:00"),
        Icon(
          Icons.notifications,
          color: Colors.black,
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  )
];

Widget _listaChats(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black45))),
        child: lista_aux[index]),
  );
}
