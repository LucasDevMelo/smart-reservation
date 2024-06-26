import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Configurações",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 30),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 30,
              backgroundImage: AssetImage("images/doctor1.jpg"),
            ),
            title: Text(
              "Usuário",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            subtitle: Text("Perfil"),
          ),
          Divider(height: 50),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.person,
                color: Colors.black,
                size: 35,
              ),
            ),
            title: Text(
              "Perfil",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          SizedBox(height: 20),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
                size: 35,
              ),
            ),
            title: Text(
              "Sobre nós",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          Divider(height: 40),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.redAccent,
                size: 35,
              ),
            ),
            title: Text(
              "Sair",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
