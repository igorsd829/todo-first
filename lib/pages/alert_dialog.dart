import 'package:alex/pages/button2.dart';
import 'package:alex/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  VoidCallback save;
  VoidCallback cancel;

  final controller;
  final controller2;
  DialogBox(
      {super.key,
      required this.controller2,
      required this.controller,
      required this.save,
      required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Container(
        height: 250,
        width: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0))),
                    hintText: 'Título'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller2,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0))),
                    hintText: 'Subtítulo'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  text: 'Salvar',
                  onPressed: save,
                ),
                MyButton2(
                  text: 'Cancelar',
                  onPressed: cancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
