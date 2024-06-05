import 'package:cuppertino/config/config.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    /*return const CupertinoPageScaffold(
      backgroundColor: Color.fromRGBO(150, 0, 255, 1),
      navigationBar: CupertinoNavigationBar(
        middle: Text("App"),
      ),
      child: Center(child: Text("Cuppertino")),
    );*/
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone), label: "Llamar"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2_fill), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.alarm), label: "Notificaciones"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: "Configuracion"),
        ],
      ),
      tabBuilder: (context, index) {
        bool onOff = false;
        CupertinoTabView? selected;
        switch (index) {
          case 0:
            selected = CupertinoTabView(
              builder: (context) => CupertinoPageScaffold(
                  child: Center(
                child: Text("Llamadas"),
              )),
            );
            break;
          case 1:
            selected = CupertinoTabView(
              builder: (context) => CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text("Chats owo"),
                  ),
                  child: Center(
                    child: Text("Chats"),
                  )),
            );
            break;
          case 2:
            selected = CupertinoTabView(
              builder: (context) {
                return CustomScrollView(
                  slivers: <Widget>[
                    CupertinoSliverNavigationBar(
                      largeTitle: Text("Notificaciones"),
                      middle: CupertinoActivityIndicator(
                        color: CupertinoColors.destructiveRed,
                      ),
                    ),
                  ],
                );
              },
            );
            break;
          case 3:
            selected = CupertinoTabView(builder: (context) {
              return CupertinoFormSection(
                  header: Text("Configuracion"),
                  children: [
                    CupertinoFormRow(
                        prefix: Text("Cambiar configuracion"),
                        child: CupertinoSwitch(
                          value: onOff,
                          onChanged: (bool? value){
                            setState(() {
                              onOff = value ?? false;
                            });
                          },
                        ))
                  ]);
            });
            break;
        }
        return selected!;
      },
    );
  }
}
