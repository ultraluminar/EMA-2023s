import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_manager/l10n/l10n.dart';
import 'package:fridge_manager/pages/edit_product/edit_product.dart';
import 'package:products_api/products_api.dart';
import 'package:products_repository/products_repository.dart';

class EditProductPage extends StatelessWidget {
  const EditProductPage({super.key});

  static Route<void> route({Product? initialProduct}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => EditProductBloc(
          productsRepository: context.read<ProductsRepository>(),
          initialProduct: initialProduct,
        ),
        child: const EditProductPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProductBloc, EditProductState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == EditProductStatus.success,
      listener: (context, state) => Navigator.of(context).pop(),
      child: const EditProductView(),
    );
  }
}

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((EditProductBloc bloc) => bloc.state.status);
    final isNewProduct = context.select(
      (EditProductBloc bloc) => bloc.state.isNewProduct,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isNewProduct
              ? S.of(context).editProductAddAppBarTitle
              : S.of(context).editProductEditAppBarTitle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: S.of(context).editProductSaveButtonTooltip,
        onPressed: status.isLoadingOrSuccess
            ? null
            : () => context
                .read<EditProductBloc>()
                .add(const EditProductSubmitted()),
        child: status.isLoadingOrSuccess
            ? const CircularProgressIndicator()
            : const Icon(Icons.check_rounded),
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _NameField(),
                // _ExpirationDateField(),
                // _StorageDateField(),
                // _OwnerField(),
                // _KategoryField(),
              ],
            )),
      ),
    );
  }
}

// TODO: Implement some sort of validation for fields so necessary fields are filled out
class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditProductBloc>().state;
    final hintText = state.initialProduct?.name ?? '';

    return TextField(
      key: const Key('editProductForm_nameInput_textField'),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabled: !state.status.isLoadingOrSuccess,
        labelText: "Test", //S.of(context).editProductFormNameFieldLabel,
        hintText: hintText,
      ),
      maxLength: 50,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
      ],
      onChanged: (name) =>
          context.read<EditProductBloc>().add(EditProductNameChanged(name)),
    );
  }
}

// class _ExpirationDateField extends StatelessWidget {
//   const _ExpirationDateField();

//   @override
//   Widget build(BuildContext context) {
//     final state = context.watch<EditProductBloc>().state;
    
//     return TextFormField(
//       key: const Key('editProductForm_expirationDateInput_textField'),
//       initialValue: state.expiresAt.toString(),
//       decoration: InputDecoration(
//         enabled: !state.status.isLoadingOrSuccess,
//         labelText: "Test", //S.of(context).editProductFormExpirationDateFieldLabel,
//       ),
//       onChanged: (expiresAt) => context
//           .read<EditProductBloc>()
//           .add(EditProductExpirationDateChanged(expiresAt)),
//     );
