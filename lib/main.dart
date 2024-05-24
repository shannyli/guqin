import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuqinString {
  const GuqinString({required this.number});

  final String number;
}

typedef CartChangedCallback = Function(GuqinString product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ObjectKey(product));

  final GuqinString product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart //
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) {
      return const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.normal,
      );
    }

    return const TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onCartChanged(product, inCart);
        },

        child: Text(
          product.number,
          textAlign: TextAlign.center,
          style: TextStyle(backgroundColor: Colors.blue),
        ),
      );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, super.key});

  final List<GuqinString> products;

  // The framework calls createState the first time
  // a widget appears at a given location in the tree.
  // If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses
  // the State object instead of creating a new State object.

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <GuqinString>{};

  void _handleCartChanged(GuqinString product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need
      // to change _shoppingCart inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SvgPicture.asset(
            'assets/images/espresso.svg',
            semanticsLabel: 'SVG Logo',
          ),
          title: const Text('Guqin App'),
        ),
        body: Column(
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.products.map((product) {
                    return ShoppingListItem(
                      product: product,
                      inCart: _shoppingCart.contains(product),
                      onCartChanged: _handleCartChanged,
                    );
                  }).toList(),
        ),


          ],
        ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      products: [
        GuqinString(number: '1'),
        GuqinString(number: '2'),
        GuqinString(number: '3'),
        GuqinString(number: '4'),
        GuqinString(number: '5'),
        GuqinString(number: '6'),
        GuqinString(number: '7'),
      ],
    ),
  ));
}
