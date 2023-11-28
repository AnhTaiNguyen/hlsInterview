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
      title: SizedBox(
        height: preferredSize.height,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Image(image: AssetImage('assets/logo.png')),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Handcrafted by',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.black54, fontSize: 12.0),
                  ),
                  Text(
                    'Jim HLS',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black, fontSize: 16.0),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/profile.png',
                ),
              ),
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
