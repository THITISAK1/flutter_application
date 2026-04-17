import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> seedReviews() async {
  final db = FirebaseFirestore.instance;

  final snapshot = await db.collection('reviews').limit(1).get();

  // 🔥 ถ้ามีข้อมูลแล้ว ไม่ต้อง seed ซ้ำ
  if (snapshot.docs.isNotEmpty) {
    print("⚠️ Reviews already exist");
    return;
  }

  final reviews = [
  {
    "title": "YONEX VOLTRIC-ACE",
    "description": "จากที่ได้ลองเอาไปหวดมานะครับ Yonex Voltric-Ace ตัวนี้คือ 'ไม้บุกสายคุ้ม' ที่แท้จริง! จุดที่สัมผัสได้ชัดเจนเลยคือระบบ Tri-Voltage System ที่ทำให้หัวไม้มีน้ำหนักแต่ไม่ดื้อยา เวลาตบลูกรู้สึกได้เลยว่าแรงส่งมันสะใจมาก ลูกพุ่งเร็วและปักลงพื้นได้ดีกว่าไม้เริ่มต้นทั่วไปครับ แต่ที่เซอร์ไพรส์คือมันยังมีความคล่องตัวอยู่พอสมควร จังหวะรับลูกตบหรือดาดหน้าเน็ตก็ยังทำได้ไว ไม่รู้สึกว่าไม้หนักจนลากแขน ใครที่กำลังมองหาไม้แบดเริ่มต้นที่ช่วยทุ่นแรงเวลาตบ และอยากเน้นเกมบุกเป็นหลัก ผมแนะนำตัวนี้เลยครับ จบจริงในงบประหยัด!",
    "image": "https://www.supersports.co.th/cdn/shop/files/YO136SP199AHTH-0.jpg?v=1759460676",
  },
  {
    "title": "ASICS Court Control FF3",
    "description": "หลังจากใส่ลงสนามไป 2-3 แมตช์ บอกเลยว่า Court Control FF3 คือสวรรค์ของคนเล่นแบดสายเคลื่อนที่ครับ! วัสดุผ้าตาข่ายด้านบนทำออกมาได้ดีมาก ระบายอากาศเก่ง ใส่เล่นนานๆ แล้วเท้าไม่ร้อนเลย ส่วนตัวพื้น FlyteFoam คือจุดเปลี่ยนชีวิตจริงๆ ครับ จังหวะกระโดดตบแล้วลงพื้น หรือจังหวะพุ่งรับลูกที่หน้าเน็ต มันช่วยซับแรงกระแทกได้นุ่มหนึบมาก ไม่เจ็บเข่าเลย แถมการล็อคข้อเท้ายังทำออกมาได้แน่นหนา รู้สึกมั่นใจทุกครั้งที่ต้องออกตัวแรงๆ ดีไซน์ก็สวยเท่ดูพรีเมียม ใครสาย Safe เข่าและเน้นความคล่องตัว คู่นี้คือการลงทุนที่คุ้มค่ามากครับ",
    "image": "https://www.supersports.co.th/cdn/shop/files/AS206SH597EJTH-0.jpg?v=1744116500",
  },
];

  for (var item in reviews) {
    await db.collection('reviews').add({
      ...item,
      "createdAt": DateTime.now(),
    });
  }

  print("✅ Seed Reviews Done");
}