import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<String> title;
  final bool isBack;
  final String? imageUrl;
  final String? linkUrl;

  const MyAppBar({
    Key? key,
    required this.title,
    this.isBack = false,
    this.imageUrl,
    this.linkUrl,
  }) : super(key: key);

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ValueListenableBuilder<String>(
        valueListenable: title,
        builder: (context, value, _) => Text(value),
      ),
      leading: isBack
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        },
      )
          : null,
      actions: [
        if (imageUrl != null && linkUrl != null)
          IconButton(
            icon: SizedBox(
              height: 36, // height of the logo
              child: Image.asset(imageUrl!),
            ),
            onPressed: () => _launchURL(linkUrl!),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
