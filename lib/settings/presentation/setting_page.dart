import 'package:flutter/material.dart';
import 'package:gooddhan/core/shared/widgets/custom_value_tile.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "User setting",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30),
          const CustomValueTile(
            color: Colors.white,
            title: "Monthy Income",
            value: "Rs 50000",
          ),
          const SizedBox(height: 20),
          const CustomValueTile(
            color: Colors.white,
            title: "Currency",
            value: "NRS",
          ),
          const SizedBox(height: 20),
          const CustomValueTile(
            color: Colors.white,
            title: "Display Name",
            value: "sameer pokharel",
          ),
          const SizedBox(height: 30),
          const Text(
            "General setting",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 40),
          CustomValueTile(
            onTap: () {},
            color: Colors.white,
            title: "Language",
            value: "english",
          ),
          const SizedBox(height: 20),
          CustomValueTile(
            onTap: () {},
            color: Colors.white,
            title: "Date",
            value: "english",
          ),
          const SizedBox(height: 20),
          CustomValueTile(
            color: Colors.white,
            title: "Dark Mode",
            trailing: Switch(
              value: false,
              onChanged: (val) {},
            ),
          ),
        ],
      ),
    );
  }
}
