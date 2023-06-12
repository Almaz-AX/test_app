import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/ui/const/asset_images.dart';
import 'package:test_app/ui/widgets/components/user_photo.dart';
import 'package:test_app/ui/widgets/main_screen/category_screen/dish_screen_dialog/dish_screen_dialog_model.dart';
import 'category_screen_model.dart';
import 'dish_screen_dialog/dish_screen_dialog.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => CategoryScreenModel(),
      child: const CategoryScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    final model = context.watch<CategoryScreenModel>();
    final tags = model.tags;
    final tagsWidget = <Widget>[];

    for (String tag in tags) {
      final widget = Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 35,
        child: Tab(
          child: Text(tag),
        ),
      );
      tagsWidget.add(widget);
    }

    return DefaultTabController(
      initialIndex: 0,
      length: tags.length,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.chevron_left)),
            title: Center(
              child: Text(title),
            ),
            actions: const [UserPhoto()],
            bottom: TabBar(
              onTap: (value) {
                model.changeShowDishList(value);
              },
              padding: const EdgeInsets.symmetric(horizontal: 16),
              indicator: const BoxDecoration(
                color: Color(0xFF3364E0),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              tabs: tagsWidget,
            ),
          ),
          body: const _DishesWidget()),
    );
  }
}

class _DishesWidget extends StatelessWidget {
  const _DishesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dishes = context.watch<CategoryScreenModel>().showDishList;
    return Center(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 116,
              mainAxisExtent: 154,
              mainAxisSpacing: 3,
              crossAxisSpacing: 20),
          itemCount: dishes.length,
          itemBuilder: (context, index) {
            ImageProvider imageProvider = const AssetImage(AssetImages.dish);
            if (dishes[index].imageUrl != null) {
              imageProvider = NetworkImage(dishes[index].imageUrl!);
            }
            return Stack(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Image(
                  image: imageProvider,
                  fit: BoxFit.scaleDown,
                  height: 114,
                ),
                Text(
                  dishes[index].name,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ]),
              InkWell(onTap: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context,) =>
                      ChangeNotifierProvider(
                        create: (_) => DishScreenDialogModel(dish:dishes[index]),
                        child: const DetailDish(),
                      ),
                    );
              })
            ]);
          }),
    );
  }
}

class _TagsWidget extends StatelessWidget {
  const _TagsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tags = context.read<CategoryScreenModel>().tags;
    final tagsWidget = <Widget>[];

    for (String tag in tags) {
      final widget = Tab(
        child: Text(tag),
      );
      tagsWidget.add(widget);
    }
    return Row(children: tagsWidget);
  }
}
