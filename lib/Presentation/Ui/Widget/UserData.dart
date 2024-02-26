import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sbsr_grad/Core/Theme/Theme.dart';
import 'package:sbsr_grad/Domain/Models/MyUser.dart';

class UserData extends StatelessWidget {
  User user;
  UserData({required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
          color: MyTheme.lightPurple,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(0)
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // user image
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(80),
                      bottomLeft:Radius.circular(80),
                      topLeft: Radius.circular(15) ,
                      topRight:Radius.circular(80)
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0,4),
                          blurRadius: 10
                      )
                    ]
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(80),
                    bottomLeft:Radius.circular(80),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(80)
                  ),
                  child: CachedNetworkImage(
                    imageUrl: user.photoURL ?? "",
                    imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      width: 125,
                      height: 125,
                    ),
                    errorWidget: (context, url, error) => Lottie.asset(
                      "assets/json/UserNotFound.json",
                      fit: BoxFit.cover,
                      width: 125,
                      height: 125,
                    ),
                    placeholder: (context, url) => Container(
                      width: 125,
                      height: 125,
                      decoration: BoxDecoration(
                          color: MyTheme.lightPurple,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: MyTheme.offWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20,),
          // user name , email and edit profile button
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Text(
                    user.displayName??"No Name",
                    style: const TextStyle(
                      color: MyTheme.offWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 20,),
                  FittedBox(child: Text(user.email??"No Email", style: Theme.of(context).textTheme.displayMedium!.copyWith(color: MyTheme.offWhite),)),
                  const Spacer(),
                ],
              )
          )
        ],
      ),
    );
  }
}
