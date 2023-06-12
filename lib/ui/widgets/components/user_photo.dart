import 'package:flutter/material.dart';

import '../../const/asset_icons.dart';
import '../../const/asset_images.dart';
import '../../const/constants.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          margin: const EdgeInsets.all(8),
          height: 44,
          width: 44,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(AssetImages.avatar))),
        ),
      ],
    );
  }
}

class AppBarTitleMain extends StatelessWidget {
  const AppBarTitleMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            ImageIcon(
              AssetImage(AssetIcons.location),
            ),
            SizedBox(
              width: 5,
            ),
            Text(Constants.location),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left: 30, top: 5),
            child: Text(
              Constants.data,
              style: Theme.of(context).textTheme.labelSmall,
            )),
      ],
    );
  }
}
