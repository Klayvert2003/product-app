import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:from_zero_to_hero/features/products/presentation/providers/product_provider.dart';
import 'package:from_zero_to_hero/features/products/presentation/widgets/product_card.dart';

class ProductBycategoryConsumer extends ConsumerWidget {
  const ProductBycategoryConsumer(this.category, {super.key});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productByCategoryProvider(category));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products By Category'),
      ),
      body: products.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final produdct = data[index];
                return ProductCard(product: produdct);
              },
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
