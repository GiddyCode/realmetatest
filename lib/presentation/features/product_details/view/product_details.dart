import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realmetatest/core/models/product_details_response.dart';
import 'package:realmetatest/utils/utils.dart';

import '../../../../core/models/product_response.dart';
import '../../../../core/services/auth_services.dart';
import '../viewmodels/product_details_vm.dart';

class ProductDetails extends ConsumerStatefulWidget {
  final int productIndex;
  const ProductDetails({super.key, required this.productIndex});

  @override
  ConsumerState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    final ProductDetailsVM = ref.watch(ProductDetailsVMState.notifier);
    return Scaffold(
      body: FutureBuilder<ProductDetailsResponse>(
        future: ProductDetailsVM.fetchData(widget.productIndex.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // else if (snapshot.hasError) {
          //   return Center(child: Text('Error: ${snapshot.error}'));
          // }
          else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            return Column(
              children: [
                AppSpacer.H7,
                Container(
                  height: 5.h,
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell( onTap: () { context.pop(); },
                    child: Icon(Icons.arrow_back)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(snapshot.data?.category ?? ""),
                          SizedBox(
                              width: 60.w,
                            child: Text(snapshot.data?.title ?? "", overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      const Icon(Icons.shop),
                    ],
                  ),

                ),
                SizedBox(
                  height: 35.h,
                  child: Stack(
                    children: [
                      Container(
                        height: 35.h,
                        width: 100.w,
                        child: Image.network(snapshot.data?.image ?? ""),
                      ),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(padding: EdgeInsets.all(8)
                        ,
                        child: Icon(Icons.heart_broken,)),
                      )
                    ],
                  ),
                ),
                AppSpacer.H5,
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(snapshot.data?.description ?? "", maxLines: 7,),
                ),
                AppSpacer.H5,
                Container(
                  height: 20.h,
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Text("Colour", style: TextStyle(fontWeight: FontWeight.bold)),
                        AppSpacer.H1,
                        Row(children: [
                          Container(
                            height: 2.h,
                            width: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue
                            ),

                          ),
                          AppSpacer.W2,Container(
                            height: 2.h,
                            width: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green
                            ),
                          ),AppSpacer.W2, Container(
                            height: 2.h,
                            width: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.yellow
                            ),
                          ), AppSpacer.W2, Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 2.h,
                                width: 2.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.pink
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Icon(Icons.check, color: Colors.white,),
                                ),
                              )
                            ],
                          ),
                        ],)
                      ],),
                      Column(children: [
                        Text("Size", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(snapshot.data?.rating?.count.toString() ?? "" , style: TextStyle(fontWeight: FontWeight.bold)),
                      ],)
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: 10.h,
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Add to Bag"),
                          Icon(Icons.add),
                        ],
                      ),
                      Text("CAD ${snapshot.data?.rating?.count?.toString()}"),
                    ],
                  ),
                )
              ],
            );
          }
        },
      )
    );
  }

}
