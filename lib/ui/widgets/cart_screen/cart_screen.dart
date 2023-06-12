// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'package:test_app/domain/entity/cart_items.dart';
import 'package:test_app/ui/widgets/cart_screen/cart_screen_model.dart';

import '../components/user_photo.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppBarTitleMain(),
          actions: const [UserPhoto()],
        ),
        body: const CartBody());
  }
}

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final box = context.watch<CartScreenModel>().box;
    if (box == null) {
      return Center(
        child: Text(
          'Пусто',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }
    return ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, box, widget) {
          final items = box.values.toList();
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      return ListTile(
                        leading: items[index].item.imageUrl != null
                            ? Image(
                                image:
                                    NetworkImage(items[index].item.imageUrl!),
                                width: 50,
                                fit: BoxFit.fitWidth)
                            : null,
                        title: Text(items[index].item.name),
                        subtitle: Row(
                          children: [
                            Text(
                              '${items[index].item.price} ₽',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(' ${items[index].item.weight} г')
                          ],
                        ),
                        trailing: AddDeleteButton(item: items[index]),
                      );
                    }),
              ),
              BuyButton(
                box: box,
              )
            ],
          );
        });
  }
}

class BuyButton extends StatelessWidget {
  final Box<CartItems> box;
  const BuyButton({
    Key? key,
    required this.box,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalAmount = context.read<CartScreenModel>().getTotalAmount(box);
    
    
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
            child: Container(
          width: double.infinity,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3364E0)),
              onPressed: totalAmount == 0? null: (){},
              child: Text('Оплатить $totalAmount')),
        )),
      ],
    );
  }
}

class AddDeleteButton extends StatelessWidget {
  const AddDeleteButton({
    super.key,
    required this.item,
  });

  final CartItems item;

  @override
  Widget build(BuildContext context) {
    final model = context.read<CartScreenModel>();
    return Container(
      width: 110,
      height: 32,
      decoration: const BoxDecoration(
          color: Color(0xFFEFEEEC),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: InkWell(
              onTap: () => model.removeDish(item.item),
              child: const Icon(Icons.remove)),
        ),
        Expanded(
            child: Center(
                child: Text(
          item.count.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: InkWell(
              onTap: () => model.addDish(item.item),
              child: const Icon(Icons.add)),
        ),
      ]),
    );
  }
}
