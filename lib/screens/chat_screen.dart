

import 'package:flutter/material.dart';
import 'package:omni_chat_telas/components/FotoUsuario.dart';
import 'package:omni_chat_telas/components/MyAppBarCustom.dart';
import 'package:omni_chat_telas/components/balaozinhos.dart';
import 'package:omni_chat_telas/components/conversasChat.dart';
import 'package:omni_chat_telas/screens/ramal_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();

  static const String id = 'chat_screen';
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarCuston("chat"),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 130,
          color: Color(0xFFbdbdbd),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _caixaUsuario(),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/bg_chat.png'),
                              fit: BoxFit.cover)),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: mensagens.length,
                        itemBuilder: _chatPersonalisado),
                  ],
                ),
              ),
              Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(children: <Widget>[
                    Expanded(
                        child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Escreva uma mensagem",
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: IconButton(
                        icon: Icon(Icons.tag_faces, color: Colors.orange, size: 30),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: IconButton(
                        icon: Icon(Icons.attach_file, color: Colors.orange, size: 30),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: IconButton(
                        icon: Icon(Icons.subdirectory_arrow_left_rounded, color: Colors.orange, size: 30),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: IconButton(
                        icon: Icon(Icons.mic, color: Colors.orange, size: 30),
                        onPressed: () {},
                      ),
                    ),
                  ])),
              Container(
                color: Colors.blue[200],
                height: 40,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: IconButton(
                        icon: Icon(
                          Icons.group_add,
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
                          Icons.people,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
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

  List<Chatmessage> mensagens = [
    Chatmessage("Ola como esta", "enviado"),
    Chatmessage("Ola como esta", "recebido"),
    Chatmessage("Ola como esta", "enviado"),
    Chatmessage("Ola como esta", "recebido"),
  ];

  Widget _chatPersonalisado(BuildContext context, int index) {
    final double r = 3.5;
    if (mensagens[index].messageType == "enviado") {
      return ListTile(
        title: ClipPath(
          clipper: ClipRThread(r),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(r)),
            child: Container(
              //constraints: BoxConstraints.loose(MediaQuery.of(context).size * 0.8),
              padding: EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
              color: Colors.white,
              //padding: EdgeInsets.all(10),
              child: Text(
                mensagens[index].messageContent,
                softWrap: true,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      );
    } else {
      return ListTile(
        title: ClipPath(
          clipper: ClipRThread(r),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(r)),
            child: Container(
              //constraints: BoxConstraints.loose(MediaQuery.of(context).size * 0.8),
              padding: EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
              color: Colors.greenAccent,
              //padding: EdgeInsets.all(10),
              child: Text(
                mensagens[index].messageContent,
                softWrap: true,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _caixaUsuario() {
    return ClipRRect(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius:
                BorderRadius.only(topRight: const Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              FotoUsuario(Icons.person),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Atendimento na Fila: nome da Fila"),
                    Text(
                      "Nome do Contato está digitando...",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text('Ticket: #09080787')
                  ],
                ),
              ),
              PopupMenuButton(
                  onSelected: (int item) {
                    Navigator.pushNamed(context, RamalScren.id);
                  },
                  color: Colors.white,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.update,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Atualizar",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.history,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Histórico Cliente",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 3,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Transferir Atendimento",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 4,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.flag,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Lembrete de Retorno",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 5,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.assistant_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Classificar Atendimento",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 6,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Fechar Conversa",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        )
                      ])
            ],
          ),
        ),
      ),
    );
  }
}
