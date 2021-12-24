// ignore_for_file: prefer_const_constructors

import 'package:basic_widget/Book/book.dart';
import 'package:basic_widget/Home_Widget/book_intro.dart';
import 'package:basic_widget/Home_Widget/new_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../category.dart';

class HomeWidget extends StatelessWidget {
  
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Book> books=[];
    books.add(Book("https://res.cloudinary.com/dzsi7dmey/image/upload/v1624055714/ampdrzexlkdcpaufziig.png","Mắm ruốc xào thịt","Trương Phương","Thịt ba rọi rửa sạch với nước muối loãng rồi trụng qua nước sôi cho ra bọt bẩn, xong cắt nhỏ vừa ăn;Tỏi băm nhỏ; Sả ớt cắt khúc để vào cối xay hạt của máy sinh tố rồi xay nhỏBắc chảo có ít dầu lên bếp, dầu nóng cho tỏi-sả ớt vào xào thơm, tiếp đến để thịt vào rồi xào cho thịt săn; Sau đó để nước sôi vào xâm xấp mặt thịt cùng với mắm ruốc rồi đảo cho đều, lúc này mới nêm nếm gia vị: chỉ nêm đường & bột ngọt. Xào mắm với lửa nhỏ riu riu đến khi mắm ruốc cạn sệt lại là được (sả-ớt, tỏi chỉ xào thơm thôi không phi vàng); Thịt có màu nâu sẫm, mỡ trong suốt thấm gia vị không ngán. Mắm ruốc xào sánh dẻo, vị đậm đà vừa ăn... hương thơm nồng đặc trưng luôn"));
    books.add(Book("https://res.cloudinary.com/dzsi7dmey/image/upload/v1624201342/o6pgdq5tpcueekfsztpq.webp","Pudding Dưa Hấu","Trương Phương"," Đầu tiên mình làm lớp pudding dưa hấu mix sữa trước nha : - Ngâm 1 muỗng cf gelatine với xíu nước lọc. Để tầm 10-15' cho gelatine nở. - Mix 40ml sữa tươi với 80ml nước ép dưa hấu. Bắt bếp để nhỏ lửa. Cho gelatine vào khuấy ấm cho tan hết. Tắt bếp để nguội bớt. Cho vào 2 hủ thuỷ tinh (mỗi hủ 60ml) - Cho vào ngăn mát tủ lạnh để đông tầm 2h hoặc 3h\n🌿 Tiếp tục làm lớp pudding dưa hấu nè 🥰 - Ngâm 1 muỗng cf gelatine còn lại với xíu nước & chờ nở. - Bắt nồi nước nhỏ. Cho chén đựng gelatine vào, chưng tan gelatine. - Mix gelatine với nước ép dưa hấu còn lại. Khuấy đều - Sau đó chiết vào 2 hủ pudding lúc nãy. - Cho vào ngăn mát bảo quản tầm 2,3h pudding đông là ăn được ạ\nPudding thành phẩm mềm mịn. Thích hợp làm bữa phụ hoặc tráng miệng sau bữa chính cũng được ạ 💕"));
    books.add(Book("https://res.cloudinary.com/dzsi7dmey/image/upload/v1624262437/ytkcvycayye8s0dszpnm.webp","Thịt ba rọi kho trứng cút","Trương Phương","Trứng cút luộc chín,bóc vỏ rồi cho ra đĩa.Thịt ba rọi rửa sạch để ráo và cắt nhỏ cỡ ngón tay ướp với 2 muỗng hành tím băm nhỏ,2 muỗng nước màu,1 muỗng cà phê hạt nêm,2 muỗng cà phê nước mắm,2 muỗng cà phê đường,½ muỗng cà phê bột ngọt trộn đều để 30 phút cho thấm gia vị.\nCho chảo lên bếp cho thịt ba rọi vào kho với lửa riu riu,thêm vào 5 muỗng canh nước lọc rồi cho trứng cút vào nấu lửa riu riu cho thấm gia vị\nKhi thịt ba rọi và trứng cút đã thấm gia vị thì nêm nếm lại cho vừa ăn rồi tắt bếp.\nMúc thịt ba rọi kho trứng cút ra đĩa rồi cắt thêm ít hành lá và ngò rí vào.Rắc thêm ít tiêu cho thơm,ăn cùng cơm trắng thì quá tuyệt vời.😋"));
    books.add(Book("https://res.cloudinary.com/dzsi7dmey/image/upload/v1624244626/pmy42x1uqgbi2autjlk0.webp","Xôi mít, xôi xoài","Trương Phương","Ngâm gạo nếp từ 5-8 tiếng.Có thể ngâm từ tối hôm trc.Khi ngâm cho thêm 1 chút muối\nĐổ nước bằng 1/3 xửng hấp,bật bếp cho nước sôi.vớt gạo ra để ráo trộn thêm 1 thìa cafe muối hột để xôi đậm đà hơn.\nCho từng nắm gạo vào xửng hấp,dàn đều gạo trong xửng và chọc 4 lỗ để hơi đẩy lên giúp gạo chín đều.hấp xôi trong vòng 30 phút.15 phút đảo đều xôi 1 lần\nSốt xôi mít :\n- 100ml nươc cốt dừa + 20ml kem rich hoặc whipping cream + 20ml sữa đặc (tuỳ sở thích) + 3 múi mít bỏ hạt.Tất cả đem xay mịn rồi đổ ra bát tô.\nSốt xôi xoài giống như trên nhưng thay mít bằng xoài\nĐổ xôi ra ngoài cho nguội bớt sau đó tạo hình tuỳ thích.cho dừa khô,dừa nạo,vừng rắc lên trên cuối cùng thêm sốt và thưởng thức.\nMẹo: Bạn có thể đổ xôi ra và xôi lại thêm 1 lần nữa sẽ giúp xôi mềm hơn và để lâu cũng k bị cứng."));
    
    List categories=["Chất đạm","chất Khoáng","chất béo","chất bột đường","vitamin-chất khoáng"];
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: BookIntro(books)),
        Expanded(
          flex:1,
          child: Category(categories)),
        Expanded(
          flex:5,
          child: NewBook(books))
      ],
    );
  }
}
