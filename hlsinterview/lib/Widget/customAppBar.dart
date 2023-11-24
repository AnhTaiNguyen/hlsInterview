import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    Key? key,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage('assets/logo.png')),
            IconButton(
              icon: Icon(Icons.account_box),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/Profile',
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Size get preferredSize => Size.fromHeight(50.0);
}
