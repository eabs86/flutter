import '../model/card_detail.dart';

class CardDetailRepositoy{

  Future<CardDetail> get() async{
    await Future.delayed(const Duration(seconds:1));
    return CardDetail(
       1,
      "Meu Card",
      "https://cdn-icons-png.flaticon.com/512/4792/4792944.png",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"
      );
  }
}