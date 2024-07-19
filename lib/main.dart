//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const GuqinTunerApp());
}

class GuqinTunerApp extends StatelessWidget {
  const GuqinTunerApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Flexible(
                flex: 10,
                child: Center(
                  child: Text("note"),
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                    children: [GuqinStringSelector(),],
                  ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class GuqinStringSelector extends StatefulWidget {
  const GuqinStringSelector({super.key});

  @override
  State<GuqinStringSelector> createState() => _GuqinStringSelectorState();
}

enum GuqinString { C2, D2, F2, G2, A2, C3, D3 }

class _GuqinStringSelectorState extends State<GuqinStringSelector> {
  GuqinString calendarView = GuqinString.C2;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<GuqinString>(
      style: SegmentedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.red,
        selectedForegroundColor: Colors.white,
        selectedBackgroundColor: Colors.green,
      ),
      showSelectedIcon: false,
      segments: const <ButtonSegment<GuqinString>>[
        ButtonSegment<GuqinString>(
            value: GuqinString.C2,
            label: Text("1"),
            ),
        ButtonSegment<GuqinString>(
            value: GuqinString.D2,
            label: Text('2')),
        ButtonSegment<GuqinString>(
            value: GuqinString.F2,
            label: Text('3')),
        ButtonSegment<GuqinString>(
            value: GuqinString.G2,
            label: Text('4')),
        ButtonSegment<GuqinString>(
            value: GuqinString.A2,
            label: Text('5')),
        ButtonSegment<GuqinString>(
            value: GuqinString.C3,
            label: Text('6')),
        ButtonSegment<GuqinString>(
            value: GuqinString.D3,
            label: Text('7')),
      ],
      selected: <GuqinString>{calendarView},
      onSelectionChanged: (Set<GuqinString> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}

/**
 * class ShoppingListItem extends StatelessWidget {
    ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
    }) : super(key: ObjectKey(product));
 */

/**
 * appBar: AppBar(
    leading: SvgPicture.asset(
    'assets/images/espresso.svg',
    semanticsLabel: 'SVG Logo',
    ),
    title: const Text('Guqin App'),
    ),
 */
