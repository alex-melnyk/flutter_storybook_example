import 'package:flutter/material.dart';
import 'package:storybook_example/widgets/option_card.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Storybook(
      children: [
        Story(
          name: 'Option Card',
          builder: (context, kb) {
            return OptionCard(
              checked: kb.boolean(
                label: 'Checked',
                initial: false,
              ),
              color: kb.options(label: 'Color', initial: null, options: [
                Option('Based on theme', null),
                Option('Deep Orange', Colors.deepOrange),
                Option('Deep Purple', Colors.deepPurple),
              ]),
              onChecked: kb.boolean(
                label: 'Enabled',
                initial: true,
              )
                  ? () {}
                  : null,
              child: kb.options(
                label: 'Child',
                initial: const Icon(
                  Icons.map,
                  size: 64,
                ),
                options: [
                  Option(
                    'Icon',
                    Icon(
                      Icons.map,
                      size: 64,
                    ),
                  ),
                  Option(
                    'Widget',
                    Container(
                      width: 64,
                      height: 64,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Option(
                    'Text',
                    Text('Hello World!'),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
