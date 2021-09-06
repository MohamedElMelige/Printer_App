import 'package:chatit/ReusableCard/CatagoryCard.dart';
import 'package:chatit/User/file.dart';
import 'package:chatit/User/t_shirt.dart';
import 'package:chatit/auth/ReuseableAppBar.dart';
import 'package:flutter/material.dart';
class userHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('First Page'),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                catagoryCard(
                  icon: Icons.file_copy,
                  onPresseed: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => File(),
                      ));},
                  text: 'Files',
                ),
                catagoryCard(
                  icon: Icons.card_giftcard,
                  onPresseed: () {},
                  text: 'Gifts',
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                catagoryCard(
                  icon: Icons.watch,
                  onPresseed: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                      ));},
                  text: 'Clothes',
                ),
                catagoryCard(
                  icon: Icons.security,
                  onPresseed: () {},
                  text: 'Security',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
