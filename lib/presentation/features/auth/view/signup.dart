import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realmetatest/presentation/features/auth/view/signin.dart';
import 'package:realmetatest/presentation/features/product_list/view/listofproducts.dart';
import 'package:realmetatest/utils/context_extension.dart';
import 'package:realmetatest/utils/spacers.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/services/local_db/local_db.dart';
import '../../../../utils/assets.dart';
import '../viewmodel/auth_vm.dart';

class MetaUserSignUp extends ConsumerStatefulWidget {
  const MetaUserSignUp({super.key});

  @override
  ConsumerState createState() => _MetaUserSignUpState();
}

class _MetaUserSignUpState extends ConsumerState<MetaUserSignUp> {



  @override
  Widget build(BuildContext context) {
    final baseAuthStateNotifier = ref.watch(baseFeedsState.notifier);
    return  Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell( onTap: () { context.pop(); },
                        child: const Icon(Icons.arrow_back)),
                  ),
                ),
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
              ],
            ),
            AppSpacer.H4,


            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Create Account", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold

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
    const Icon(Icons.account_circle_outlined),

    AppSpacer.W2,
    SizedBox(
    width: 70.w,
              child:
              TextField(
                controller: baseAuthStateNotifier.fullname,
                decoration: InputDecoration(
                  labelText: 'FullName',
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
    const Icon(Icons.mail),

    AppSpacer.W2,
    SizedBox(
    width: 70.w,
              child:
              TextField(
                controller: baseAuthStateNotifier.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp,),
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
                controller: baseAuthStateNotifier.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp,),
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
                controller: baseAuthStateNotifier.confirmPass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp,),
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
                onTap: () => baseAuthStateNotifier.handleSignup(
                    baseAuthStateNotifier.fullname.text,
                    baseAuthStateNotifier.emailController.text,
                    baseAuthStateNotifier.passwordController.text,
                    baseAuthStateNotifier.confirmPass.text, context ),
                child: Container(
                    height: 5.5.h,
                    padding: EdgeInsets.symmetric( vertical: 1.h, horizontal: 3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.orange, Colors.amberAccent],
                      ),
                      // color: Colors.amberAccent
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                        ),
                        AppSpacer.W3,
                        Icon(Icons.arrow_forward, color: Colors.white,)
                      ],
                    )),
              ),
            ),
            SizedBox(height: 16.0),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h,),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    context.push(MetaUserSignIn());
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
                        Text(" SignIn", style: TextStyle(
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
    );
  }

}
