import 'package:flutter/material.dart';

class TipsTiles extends StatelessWidget {
  const TipsTiles({
    Key? key,
    required this.title,
    required this.page,
  }) : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        mouseCursor: MouseCursor.defer,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: ListTile(
          tileColor: const Color.fromARGB(240, 4, 18, 23),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          leading: Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 236, 232, 232),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
