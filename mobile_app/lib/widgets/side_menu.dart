import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          _DrawerHeader(),

          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mi cuenta'),
            onTap: (){
              Navigator.pushNamed(context, 'user');
            },
          ),

          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Configuraciones'),
            onTap: (){
              Navigator.pushNamed(context, 'configuration');
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar sesión'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'login');
            },
          )

        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/OIP.jpg'),
          fit: BoxFit.cover
        )
      ),
    );
  }
}