import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../../provider/theme_provider.dart';
import '../../../universal_widgets/custom_icon_btn.dart';

class ProductHeader extends StatelessWidget {
  final int pId;
  final String imgUrl;

  const ProductHeader({super.key, required this.imgUrl, required this.pId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final theme =
    Provider.of<ThemeProvider>(navigatorKey.currentContext!, listen: false);

    return Stack(
      children: [
        Container(
          height: size.height / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 4),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Hero(
              tag: pId,
              child: Image.network(imgUrl),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 20,
          child: CustomIconBtn(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
