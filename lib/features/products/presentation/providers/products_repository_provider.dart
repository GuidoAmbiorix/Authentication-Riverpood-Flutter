import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';
import 'package:teslo_shop/features/products/domain/repositories/products_repository.dart';
import 'package:teslo_shop/features/products/infraestructure/infraestructure.dart';
import 'package:teslo_shop/features/products/infraestructure/repositories/products_repository_impl.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';
  final productsRepository =
      ProductsRepositoryImpl(ProductsDataSourceImpl(accessToken: accessToken));
  return productsRepository;
});
