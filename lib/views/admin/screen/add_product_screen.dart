import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:e_shoppie/core/colors.dart';
import 'package:e_shoppie/core/sizedboxes.dart';
import 'package:e_shoppie/providers/admin/admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_textfeild.dart';
import '../../../common/loader.dart';
import '../../../core/global_variables.dart';

class AddProductScreen extends StatelessWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: GlobalVariables.appBarColor,
          title: const Text(
            'Add Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<AdminProvider>(
          builder: (context, value, child) => Form(
            key: value.addProductFormKey,
            child: value.isLoading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 300,
                      ),
                      Loader(),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        value.images.isNotEmpty
                            ? CarouselSlider(
                                items: value.images.map(
                                  (i) {
                                    return Builder(
                                      builder: (BuildContext context) =>
                                          Image.file(
                                        i,
                                        fit: BoxFit.cover,
                                        height: 200,
                                      ),
                                    );
                                  },
                                ).toList(),
                                options: CarouselOptions(
                                  viewportFraction: 1,
                                  height: 200,
                                ),
                              )
                            : GestureDetector(
                                onTap: value.selectImages,
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(10),
                                  dashPattern: const [10, 4],
                                  strokeCap: StrokeCap.round,
                                  child: Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.folder_open,
                                          size: 40,
                                        ),
                                        const SizedBox(height: 15),
                                        Text(
                                          'Select Product Images',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        CustomTextField(
                          controller: value.productNameController,
                          hinTtext: 'Product Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: value.descriptionController,
                          hinTtext: 'Description',
                          maxlines: 7,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: value.priceController,
                          hinTtext: 'Price',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: value.quantityController,
                          hinTtext: 'Quantity',
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButton(
                            value: value.category,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: value.productCategories.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newVal) {
                              value.categoryDropdown(newVal);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          color: GlobalVariables.primaryColor,
                          text: 'ADD PRODUCT',
                          onTap: () {
                            value.sellProduct(context);
                          },
                        ),
                        kHeight10
                      ],
                    )),
          ),
        ),
      ),
    );
  }
}
