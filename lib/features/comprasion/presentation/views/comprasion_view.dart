import 'package:ekhtarly_app/constants.dart';
import 'package:ekhtarly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComprasionView extends StatelessWidget {
  const ComprasionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Comparison',
          style: Styles.textStyle20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(children: [
          ComprasionBox(),
          SizedBox(
            width: 20,
          ),
          ComprasionBox()
        ]),
      ),
    );
  }
}

class ComprasionBox extends StatelessWidget {
  const ComprasionBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: kThridColor, borderRadius: BorderRadius.circular(8)),
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Icon(FontAwesomeIcons.question),
            ),
            Spacer(
              flex: 3,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add'),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kButtonColor),
                  foregroundColor: MaterialStatePropertyAll(Colors.white)),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
