import 'package:flutter/material.dart';
import 'package:omni_chat_telas/components/MyAppBarCustom.dart';
import 'package:omni_chat_telas/components/nomes_botoes_textos.dart';

class RamalScren extends StatefulWidget {
  static const String id = 'ramal_screen';

  @override
  _RamalScrenState createState() => _RamalScrenState();
}

double larguraTelaGlobal;
double alturaTelaGlobal;

class _RamalScrenState extends State<RamalScren> with TickerProviderStateMixin {
  TabController _tabController;

  int _onOffAtender = -1;
  int _onOffLigar = -1;
  int _onOffDTMF = -1;
  int _onOffCam = -1;
  int _onOffEspera = -1;
  int _onOffMute = -1;
  int _onOffConsultar = -1;
  int _onOffTransferir = -1;
  int _onOffCancelar = -1;
  int _onOffConf = -1;
  int _onOffDesRegistrar = -1;
  int _onOffPausa = -1;
  int _onOffLogin = -1;

  Widget _buildButton(String name, int estado) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              estado = estado * (-1);
              switch (name) {
                case NomesETextos.ramal_botao_atender:
                  return _onOffAtender = estado;
                case NomesETextos.ramal_botao_ligar:
                  return _onOffLigar = estado;
                case NomesETextos.ramal_botao_Dtmf:
                  return _onOffDTMF = estado;
                case NomesETextos.ramal_botao_cam:
                  return _onOffCam = estado;
                case NomesETextos.ramal_botao_espera:
                  return _onOffEspera = estado;
                case NomesETextos.ramal_botao_mute:
                  return _onOffMute = estado;
                case NomesETextos.ramal_botao_consultar:
                  return _onOffConsultar = estado;
                case NomesETextos.ramal_botao_transferir:
                  return _onOffTransferir = estado;
                case NomesETextos.ramal_botao_cancelar:
                  return _onOffCancelar = estado;
                case NomesETextos.ramal_botao_conf:
                  return _onOffConf = estado;
                case NomesETextos.ramal_botao_desregistrar:
                  name = "REGISTRAR";
                  return _onOffDesRegistrar = estado;
                case NomesETextos.ramal_botao_login:
                  return _onOffLogin = estado;
                case NomesETextos.ramal_botao_pausa:
                  return _onOffPausa = estado;
              }
            });
          },
          child: Text(name),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(Size(10, 30)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color(estado == -1 ? 0xFF9e9e9e : 0xFFffa726)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(
                          color:
                              Color(estado == -1 ? 0xFF9e9e9e : 0xFFffa726))))),
        ),
      ),
    );
  }

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
    double proporcaoAlturaAppBar = MyAppBarCuston("list").proporcaoAltura;
    double proporcaoAlturaBody = 1.00 - proporcaoAlturaAppBar;
    larguraTelaGlobal = larguraTela;
    alturaTelaGlobal = alturaTela;

    double proporcaoComponenteFundo = 0.93;
    double distanciaToolBar = alturaTela*0.05;

    double alturaFundo =
        alturaTela * proporcaoAlturaBody * proporcaoComponenteFundo;
    double alturaComponetBaixo = alturaTela * proporcaoAlturaBody * (1-proporcaoComponenteFundo);

    return Scaffold(
      appBar: MyAppBarCuston("chat"),
      body: SingleChildScrollView(
        child: Container(
          height: alturaTela * proporcaoAlturaBody,
          width: larguraTela,
          color: Colors.grey,
          child: Column(
            children: [

              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      child: Container(
                        height: alturaFundo,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 29, left: 20),
                              child: Row(children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Fila",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            color: Colors.grey[300],
                                            width: 180,
                                            height: 36,
                                            child: TextField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  hintText: "Nome na Fila"),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            color: Colors.grey[300],
                                            width: 180,
                                            height: 36,
                                            child: TextField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  hintText: "Nome do Agente"),
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, left: 3, top: 8),
                                  child: Container(
                                    height: 35,
                                    child: Row(
                                      children: [
                                        _buildButton("ATENDER", _onOffAtender),
                                        _buildButton("LIGAR", _onOffLigar),
                                        _buildButton("DTMF", _onOffDTMF),
                                        _buildButton("CAM", _onOffCam)
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 8),
                                  child: Container(
                                    height: 35,
                                    child: Row(
                                      children: [
                                        _buildButton("ESPERA", _onOffEspera),
                                        _buildButton("MUTE", _onOffMute),
                                        _buildButton(
                                            "CONSULTAR", _onOffConsultar)
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 8),
                                  child: Container(
                                    height: 35,
                                    child: Row(
                                      children: [
                                        _buildButton(
                                            "TRANSFERIR", _onOffTransferir),
                                        _buildButton(
                                            "CANCELAR", _onOffCancelar),
                                        _buildButton("CONF", _onOffConf)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 45,
                                          color: Colors.grey,
                                          child: TabBar(
                                              unselectedLabelColor:
                                                  Colors.white,
                                              controller: _tabController,
                                              indicator: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20)),
                                                  color: Colors.orange),
                                              labelColor: Colors.white,
                                              tabs: [
                                                Tab(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("HOME"),
                                                  ),
                                                ),
                                                Tab(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("HISTÓRICO"),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            height: 171,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 3)),
                                            child: TabBarView(
                                                controller: _tabController,
                                                children: [
                                                  Text("Home"),
                                                  Text("Histórico")
                                                ])),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                            Row(
                              children: [
                                _buildButton(
                                    "DESREGISTRAR", _onOffDesRegistrar),
                                _buildButton("LOGIN", _onOffLogin),
                                _buildButton("PAUSA", _onOffPausa),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          child: Container(
                            height: 60,
                            color: Colors.blueGrey,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 6, left: 16),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Container(
                                          color: Colors.green,
                                          height: 35,
                                          width: 35,
                                        ),
                                      ),
                                      Text(
                                        "Ramal: 000",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        "0000",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "00:00:00",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.blue[200],
                height: alturaComponetBaixo,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.group_add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      width: 50,
                    )),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 30,
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
