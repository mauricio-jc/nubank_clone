import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _visible = true;
  bool _menuVisible = false;

  void _showValues() {
    setState(() {
      if(_visible) {
        _visible = false;
      }
      else {
        _visible = true;
      }
    });
  }

  void _showMenu() {
    setState(() {
      if(_menuVisible) {
        _menuVisible = false;
      }
      else {
        _menuVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8b05be),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: AppBar(
            backgroundColor: Color(0xFF8b05be),
            title: Text("Olá, Fulano", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
            elevation: 0,
            actions: [
              _menuVisible ?
              Row(
               children: [
                 Padding(
                   padding: EdgeInsets.only(right: 10),
                   child: GestureDetector(
                     onTap: () {
                       _showMenu();
                     },
                     child: CircleAvatar(
                       backgroundColor: Color(0xFF9719c6),
                       child: Icon(Icons.close, color: Colors.white,)
                     ),
                   ),
                 )
               ],
              )
              :
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: _showValues,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF9719c6),
                        child: _visible ? Icon(Icons.visibility_off_outlined, color: Colors.white,) : Icon(Icons.visibility_outlined, color: Colors.white,)
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 14),
                    child: GestureDetector(
                      onTap: () {
                        _showMenu();
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF9719c6),
                        child: Icon(Icons.settings_outlined, color: Colors.white,),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
      body: _menuVisible ? _menu() : _homeView()
    );
  }

  Widget _menu() {
    return ListView(
      children: [
        Center(
          child: Image.asset("images/qrcode.png", width: 100, height: 100,),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
              child: Text("Agência 0001 Conta 1283450-2", style: TextStyle(color: Colors.white))
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Center(
              child: Text("Banco 260 - Nu Pagamentos S.A.", style: TextStyle(color: Colors.white))
          ),
        ),
        _itemMenu("Minhas chaves Pix", Icon(Icons.credit_card, color: Colors.white)),
        _itemMenu("Me ajuda", Icon(Icons.help_outline, color: Colors.white)),
        _itemMenu("Perfil", Icon(Icons.person_outline, color: Colors.white)),
        _itemMenu("Configurar conta", Icon(Icons.monetization_on_outlined, color: Colors.white)),
        _itemMenu("Configurar cartão", Icon(Icons.credit_card, color: Colors.white)),
        _itemMenu("Criar conta PJ", Icon(Icons.store_mall_directory_outlined, color: Colors.white)),
        _itemMenu("Participe da nossa promo", Icon(Icons.star_border, color: Colors.white)),
        _itemMenu("Configurar notificações", Icon(Icons.email_outlined, color: Colors.white)),
        _itemMenu("Configurações do app", Icon(Icons.phone_android, color: Colors.white)),

        Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: OutlineButton(
            onPressed: () {},
            child: Text("Sair do App".toUpperCase(), style: TextStyle(color: Colors.white)),
            borderSide: BorderSide(color: Colors.white),
            padding: EdgeInsets.only(top: 15, bottom: 15),
          ),
        )
      ],
    );
  }

  Widget _homeView() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 15),
                            child: Text("MeuNu2020", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Color(0xFF9719c6)),),
                          ),
                          Text("Nossa retrospectiva chegou para mostrar que juntos, porém separados, nos redescobrimos em 2020.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),),
                          SizedBox(height: 15),
                          OutlineButton(
                            onPressed: () {},
                            child: Text("Ver minha retro".toUpperCase(), style: TextStyle(color: Color(0xFF9719c6)),),
                            borderSide: BorderSide(color: Color(0xFF9719c6))
                          )
                        ],
                      ),
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.credit_card),
                            title: Text("Cartão de Crédito", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),),
                            contentPadding: EdgeInsets.all(0),
                          ),
                          _visible ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Fatura atual", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),),
                              SizedBox(height: 10,),
                              Text("R\$ 156,20", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF01bdc5)),),
                              Row(
                                children: [
                                  Text("Limite disponível ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),),
                                  Text("R\$ 2.643,80", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.green),),
                                ],
                              )
                            ],
                          ) : _noVisibleValues()
                        ],
                      ),
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.monetization_on_outlined),
                            title: Text("Conta", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey),),
                            contentPadding: EdgeInsets.all(0),
                          ),
                          _visible ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Saldo disponível", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),),
                              SizedBox(height: 10,),
                              Text("R\$ 7.595,15", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            ],
                          ) : _noVisibleValues()
                        ],
                      ),
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Color(0xFFe6a4ff),
                              child: Icon(Icons.card_giftcard, color: Color(0xFF9719c6),),
                            ),
                            title: Text("Rewards", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Color(0xFF9719c6)),),
                            contentPadding: EdgeInsets.all(0),
                          ),
                          SizedBox(height: 15),
                          Text("Apague compras com pontos que nunca expiram.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),),
                          SizedBox(height: 15),
                          OutlineButton(
                            onPressed: () {},
                            child: Text("Conhecer".toUpperCase(), style: TextStyle(color: Color(0xFF9719c6)),),
                            borderSide: BorderSide(color: Color(0xFF9719c6))
                          )
                        ],
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 120,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _ItemMenuBottom(Icon(Icons.payments_outlined, color: Colors.white), "Pagar", 15, 5),
                  _ItemMenuBottom(Icon(Icons.person_add_alt, color: Colors.white), "Indicar amigos", 0, 5),
                  _ItemMenuBottom(Icon(Icons.monetization_on, color: Colors.white), "Transferir", 0, 5),
                  _ItemMenuBottom(Icon(Icons.monetization_on, color: Colors.white), "Depositar", 0, 5),
                  _ItemMenuBottom(Icon(Icons.monetization_on, color: Colors.white), "Empréstimos", 0, 5),
                  _ItemMenuBottom(Icon(Icons.credit_card, color: Colors.white), "Cartão Virtual", 0, 5),
                  _ItemMenuBottom(Icon(Icons.phone_android, color: Colors.white), "Recarga de celular", 0, 5),
                  _ItemMenuBottom(Icon(Icons.bar_chart, color: Colors.white), "Ajustar limite", 0, 5),
                  _ItemMenuBottom(Icon(Icons.enhanced_encryption, color: Colors.white), "Bloquear cartão", 0, 5),
                  _ItemMenuBottom(Icon(Icons.monetization_on, color: Colors.white), "Cobrar", 0, 5),
                  _ItemMenuBottom(Icon(Icons.monetization_on, color: Colors.white), "Doação", 0, 5),
                  _ItemMenuBottom(Icon(Icons.help_outline, color: Colors.white), "Me ajuda", 0, 15)
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  Widget _noVisibleValues() {
    return Container(
      color: Colors.grey[200],
      height: 65,
    );
  }

  Widget _ItemMenuBottom(Icon icon, String title, double left, double right) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, 10, right, 10),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              icon,
              Text(title, style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white24
        ),
      ),
    );
  }

  Widget _itemMenu(String title, Icon icon) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        child: ListTile(
          leading: icon,
          title: Text(title, style: TextStyle(color: Colors.white)),
          trailing: Icon(Icons.chevron_right, color: Colors.white),
          onTap: () {},
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white,
            ),
          )
        ),
      ),
    );
  }
}
