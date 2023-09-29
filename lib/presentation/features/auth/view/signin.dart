import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realmetatest/core/services/local_db/local_db.dart';
import 'package:realmetatest/presentation/features/product_list/view/listofproducts.dart';
import 'package:realmetatest/presentation/features/auth/view/signup.dart';
import 'package:realmetatest/utils/utils.dart';

import '../../../../utils/validator_service.dart';
import '../viewmodel/auth_vm.dart';

class MetaUserSignIn extends ConsumerStatefulWidget {
  const MetaUserSignIn({super.key});

  @override
  ConsumerState createState() => _MetaUserSignInState();
}

class _MetaUserSignInState extends ConsumerState<MetaUserSignIn> {


  




  @override
  Widget build(BuildContext context) {
    final baseAuthStateNotifier = ref.watch(baseFeedsState.notifier);

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Align(
                    alignment: Alignment(2.5, 0),
                      child: Container(
                          height: 20.h,
                          child: SvgPicture.asset(SvgAssets.vector))),
                  Align(
                    alignment: Alignment(2.5, 0),
                      child: Container(
                          height: 15.h,
                          child: SvgPicture.asset(SvgAssets.vector, color: Colors.white.withOpacity(0.2),))),
                ],
              ),
              // Spacer(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Login", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold

                ),),
              ),
              AppSpacer.H1,
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Please sign in to continue", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.withOpacity(0.5)
                ),),
              ),


              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.mail),

                    AppSpacer.W2,
                    SizedBox(
                      width: 70.w,
                      child: TextField(
                        controller: baseAuthStateNotifier.LEmailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // const Icon(Icons.mail),
                    const Icon(Icons.lock),
                    AppSpacer.W2,
                    SizedBox(
                      width: 70.w,
                      child: TextField(
                        controller: baseAuthStateNotifier.LPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacer.H4,
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () => baseAuthStateNotifier.login(baseAuthStateNotifier.LEmailController.text, baseAuthStateNotifier.LPasswordController.text, context),
                  child: Container(
                      height: 5.5.h,
                      padding: EdgeInsets.symmetric( vertical: 1.h, horizontal: 3.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Colors.orange, Colors.amberAccent],
                          ),
                        // color: Colors.amberAccent
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Center(child: Text('LOGIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                          ),
                          AppSpacer.W3,
                          Icon(Icons.arrow_forward, color: Colors.white,)
                        ],
                      )),
                ),
              ),
              AppSpacer.H20,

              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h,),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: (){
                      context.push(MetaUserSignUp());
                    },
                    child: Container(
                      height: 5.h,
                      width: 100.w,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?", style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold

                          ),),
                          Text(" Sign Up", style: TextStyle(
                              fontSize: 20,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold

                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
