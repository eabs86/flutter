import 'package:flutter/material.dart';
import 'package:tela_login/shared/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return  Column( //muito cuidado ao utilizar columns, pois pode acabar estourando a tela
      children: [
        Image.asset(AppImages.user1,
        height: 50,),
        Image.asset(AppImages.user2,
        height: 50,),
        Image.asset(AppImages.user3,
        height: 50,),
        Image.asset(AppImages.map1,
        height: 100,),
        Image.asset(AppImages.map2,
        width: double.infinity,),
        Image.asset(AppImages.map3,
        height: 100,),
      
    ]);
  }
}