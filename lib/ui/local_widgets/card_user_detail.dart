import 'package:flutter/material.dart';
import 'package:listusers_antpack/models/user.dart';
import 'package:listusers_antpack/ui/local_widgets/info_row.dart';
import 'package:listusers_antpack/utils/utils.dart';

class CardUserDetail extends StatelessWidget {
  const CardUserDetail({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoRow(title: "Nombre: ", subTitle: user.name),
                InfoRow(title: "Email: ", subTitle: user.email),
                InfoRow(title: "Ciudad: ", subTitle: user.address.city),
                InfoRow(
                  title: "Empresa: ",
                  subTitle: Utils().stringSinSimbolos(user.company.name),
                ),
              ],
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: const Icon(Icons.message),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: const Icon(Icons.call),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
