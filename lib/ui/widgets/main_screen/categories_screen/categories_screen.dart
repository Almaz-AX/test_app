import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/ui/widgets/components/user_photo.dart';
import 'package:test_app/ui/widgets/main_screen/categories_screen/categories_screen_model.dart';
import '../category_screen/category_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CategoriesScreenModel>().categories;

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitleMain(),
        actions: const [UserPhoto()],
      ),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              height: 148,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Stack(children: [
                  Image(
                    image: NetworkImage(
                      categories[index].imageUrl,
                    ),
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                            left: 16,
                          ),
                          child: Text(
                            categories[index].name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push<Widget>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen.create(),
                              settings: RouteSettings(
                                  arguments: categories[index].name),
                            ),
                          );
                        },
                      )),
                ]),
              ),
            );
          }),
    );
  }
}
