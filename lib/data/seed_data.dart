import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> seedTutorials() async {
  final firestore = FirebaseFirestore.instance;

  // ✅ เช็คก่อนว่ามีข้อมูลไหม
  final snapshot = await firestore.collection('tutorials').get();

  if (snapshot.docs.isNotEmpty) {
    print("⚠️ Data already exists → skip");
    return;
  }

  final tutorials = {
    "tutorial_1": {
      "title": "Badminton Serve",
      "category": "Basic",
      "image": "https://images.unsplash.com/photo-1599058917765-a780eda07a3e",
      "description": "การเสิร์ฟเป็นจุดเริ่มต้นของการเล่นแบดมินตัน การเสิร์ฟที่ดีช่วยให้ได้เปรียบตั้งแต่ต้นเกม",
      "steps": [
        "ยืนให้เท้าหน้าอยู่ด้านหน้าเล็กน้อย",
        "จับไม้ด้วยมือข้างถนัดอย่างมั่นคง",
        "ถือ shuttle ด้วยนิ้วให้ควบคุมได้ง่าย",
        "ปล่อยลูกลงด้านหน้า",
        "ตีลูกให้ข้ามตาข่ายไปยังฝั่งตรงข้าม"
      ]
    },

    "tutorial_2": {
      "title": "Badminton Grip",
      "category": "Basic",
      "image": "https://images.unsplash.com/photo-1626224583764-f87db24ac4ea",
      "description": "การจับไม้ที่ถูกต้องช่วยให้ควบคุมทิศทางและแรงตีได้ดีขึ้น",
      "steps": [
        "จับไม้เหมือนจับมือกับคนอื่น",
        "วางนิ้วหัวแม่มือด้านข้างของด้าม",
        "ไม่กำแน่นจนเกินไป",
        "ปรับ grip ตามประเภทการตี",
        "ฝึกจับให้คุ้นเคยก่อนลงสนาม"
      ]
    },

    "tutorial_3": {
      "title": "Footwork",
      "category": "Movement",
      "image": "https://images.unsplash.com/photo-1584467735871-8293e7dc8d2c",
      "description": "การเคลื่อนที่ที่ดีช่วยให้เข้าถึงลูกได้เร็วและตีได้มีประสิทธิภาพ",
      "steps": [
        "ยืนในท่าพร้อมเสมอ",
        "เคลื่อนที่ด้วยก้าวสั้นและเร็ว",
        "ใช้เท้าหลังดันตัวไปข้างหน้า",
        "รักษาสมดุลของร่างกาย",
        "กลับตำแหน่งกลางสนามหลังตี"
      ]
    },

    "tutorial_4": {
      "title": "Warm Up",
      "category": "Health",
      "image": "https://images.unsplash.com/photo-1594737625785-a6cbdabd333c",
      "description": "การวอร์มอัพช่วยลดความเสี่ยงของการบาดเจ็บ",
      "steps": [
        "หมุนข้อมือและข้อเท้า",
        "ยืดแขนและหัวไหล่",
        "ยืดกล้ามเนื้อขา",
        "วิ่งเบา ๆ",
        "เตรียมร่างกายก่อนเล่น"
      ]
    },

    "tutorial_5": {
      "title": "Cool Down",
      "category": "Health",
      "image": "https://images.unsplash.com/photo-1599050751795-6cdaafbc2319",
      "description": "ช่วยให้กล้ามเนื้อฟื้นตัวเร็ว",
      "steps": [
        "ยืดแขน",
        "ยืดขา",
        "หายใจลึก",
        "ผ่อนคลาย",
        "พักผ่อน"
      ]
    },

    "tutorial_6": {
      "title": "Badminton Rules",
      "category": "Rules",
      "image": "https://images.unsplash.com/photo-1615412704911-55d589229864",
      "description": "กฎพื้นฐานของแบดมินตัน",
      "steps": [
        "เสิร์ฟทแยง",
        "ลูกห้ามออก",
        "ห้ามตีสองครั้ง",
        "ห้ามโดนตาข่าย",
        "นับคะแนนเมื่อผิดกติกา"
      ]
    }
  };

  for (var entry in tutorials.entries) {
    await firestore
        .collection('tutorials')
        .doc(entry.key)
        .set(entry.value);
  }

  print("✅ Seed success (run only once)");
}