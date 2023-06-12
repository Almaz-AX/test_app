import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/ui/widgets/main_screen/category_screen/dish_screen_dialog/dish_screen_dialog_model.dart';
import '../../../../const/asset_images.dart';

class DetailDish extends StatelessWidget {
  const DetailDish({super.key,});

  @override
  Widget build(BuildContext context) {
    final dish = context.read<DishScreenDialogModel>().dish;
    ImageProvider imageProvider = const AssetImage(AssetImages.dish);
    if (dish.imageUrl != null) {
      imageProvider = NetworkImage(dish.imageUrl!);
    }
    return AlertDialog(
      iconPadding: const EdgeInsets.all(0),
      icon: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close)),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image(
            image: imageProvider,
            height: MediaQuery.sizeOf(context).height / 4,
            fit: BoxFit.fill,
          )),
          Text(dish.name),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '${dish.price} ₽ ',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text('${dish.weight} г',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.grey)),
            ],
          ),
        ],
      ),
      content: Text(dish.description),
      actions: [
        Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<DishScreenDialogModel>().addCart();
                },
                child: const Text('Добавить в корзину')))
      ],
    );
  }
}
