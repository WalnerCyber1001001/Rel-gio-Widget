import 'package:intl/intl.dart';

String getIsOverlayLocalization(bool isEnabled) {
  String locale = Intl.getCurrentLocale();

  // Captura apenas o idioma principal (primeira parte da localidade)
  String languageCode = locale.split('_').first.toLowerCase();

  // Mapeamento de traduções
  Map<String, String> translations = {
    'en': isEnabled
        ? "Overlay Other Programs: ON"
        : "Overlay Other Programs: OFF",
    'pt': isEnabled
        ? "Sobrepor Outros Programas: Ligado"
        : "Sobrepor Outros Programas: Desligado",
    'es': isEnabled
        ? "Superponer Otros Programas: Encendido"
        : "Superponer Otros Programas: Apagado",
    'fr': isEnabled
        ? "Superposer à d'autres Programmes : Activé"
        : "Superposer à d'autres Programmes : Désactivé",
    'de': isEnabled
        ? "Andere Programme Überlagern: Ein"
        : "Andere Programme Überlagern: Aus",
    'it': isEnabled
        ? "Sovrapponi altri Programmi: Attivato"
        : "Sovrapponi altri Programmi: Disattivato",
    'ru': isEnabled
        ? "Наложение на другие программы: Включено"
        : "Наложение на другие программы: Выключено",
    'zh': isEnabled ? "覆盖其他程序：开启" : "覆盖其他程序：关闭",
    'ja': isEnabled ? "他のプログラムをオーバーレイ: オン" : "他のプログラムをオーバーレイ: オフ",
    'ko': isEnabled ? "다른 프로그램 위에 표시: 켜짐" : "다른 프로그램 위에 표시: 꺼짐",
    'ar': isEnabled
        ? "التراكب فوق البرامج الأخرى: تشغيل"
        : "التراكب فوق البرامج الأخرى: إيقاف",
    'hi': isEnabled
        ? "अन्य प्रोग्राम पर ओवरले: चालू"
        : "अन्य प्रोग्राम पर ओवरले: बंद",
    'nl': isEnabled
        ? "Andere Programma's Overlappen: Aan"
        : "Andere Programma's Overlappen: Uit",
    'tr': isEnabled
        ? "Diğer Programların Üzerine Çık: Açık"
        : "Diğer Programların Üzerine Çık: Kapalı",
    'sv':
        isEnabled ? "Överlägg Andra Program: På" : "Överlägg Andra Program: Av",
    'pl': isEnabled
        ? "Nakładaj na inne Programy: Włączone"
        : "Nakładaj na inne Programy: Wyłączone",
    'cs': isEnabled
        ? "Překrýt ostatní Programy: Zapnuto"
        : "Překrýt ostatní Programy: Vypnuto",
    'fi': isEnabled
        ? "Päälle muiden ohjelmien: Päällä"
        : "Päälle muiden ohjelmien: Pois",
    'el': isEnabled
        ? "Επικάλυψη άλλων Προγραμμάτων: Ενεργό"
        : "Επικάλυψη άλλων Προγραμμάτων: Ανενεργό",
    'vi': isEnabled
        ? "Phủ Lên Chương Trình Khác: Bật"
        : "Phủ Lên Chương Trình Khác: Tắt",
    'th': isEnabled ? "ซ้อนโปรแกรมอื่น: เปิด" : "ซ้อนโปรแกรมอื่น: ปิด",
    'he': isEnabled
        ? "הַכבָּלָה על תוכניות אחרות: פעיל"
        : "הַכבָּלָה על תוכניות אחרות: כבוי",
    'ro': isEnabled
        ? "Suprapune Alte Programe: Pornit"
        : "Suprapune Alte Programe: Oprit",
    'hu': isEnabled
        ? "Más Programok Lefedése: Bekapcsolva"
        : "Más Programok Lefedése: Kikapcsolva",
    'uk': isEnabled
        ? "Накладення на інші Програми: Увімкнено"
        : "Накладення на інші Програми: Вимкнено",
    'bg': isEnabled
        ? "Наслагване върху други програми: Включено"
        : "Наслагване върху други програми: Изключено",
    'hr': isEnabled
        ? "Preklapanje drugih Programa: Uključeno"
        : "Preklapanje drugih Programa: Isključeno",
    'sr': isEnabled
        ? "Преклапање других Програма: Укључено"
        : "Преклапање других Програма: Искључено",
    'sk': isEnabled
        ? "Prekrytie ostatných Programov: Zapnuté"
        : "Prekrytie ostatných Programov: Vypnuté",
    'da': isEnabled
        ? "Overlej Andre Programmer: Til"
        : "Overlej Andre Programmer: Fra",
    'no': isEnabled
        ? "Overlegg Andre Programmer: På"
        : "Overlegg Andre Programmer: Av",
    'id': isEnabled
        ? "Tampilkan di Atas Program Lain: Hidup"
        : "Tampilkan di Atas Program Lain: Mati",
    'ms': isEnabled
        ? "Tunjuk di Atas Program Lain: Hidup"
        : "Tunjuk di Atas Program Lain: Mati",
    'fa': isEnabled ? "روی دیگر برنامه‌ها: روشن" : "روی دیگر برنامه‌ها: خاموش",
    'tl': isEnabled
        ? "Patungan ang Iba pang Programa: Buksan"
        : "Patungan ang Iba pang Programa: Patayin",
    'sw': isEnabled
        ? "Funika Programu Zingine: Wazi"
        : "Funika Programu Zingine: Zima",
    'lt': isEnabled
        ? "Persidengti Kitomis Programomis: Įjungta"
        : "Persidengti Kitomis Programomis: Išjungta",
    'lv': isEnabled
        ? "Pārklāt Citus Programmas: Ieslēgts"
        : "Pārklāt Citus Programmas: Izslēgts",
    'et': isEnabled
        ? "Kattub teiste Programmidega: Sees"
        : "Kattub teiste Programmidega: Väljas",
    'az': isEnabled
        ? "Digər Proqramların Üzərinə: Açıq"
        : "Digər Proqramların Üzərinə: Bağlı",
    'uz': isEnabled
        ? "Boshqa Dasturlarni Qo'shish: Yoqilgan"
        : "Boshqa Dasturlarni Qo'shish: O'chirilgan",
    'kk': isEnabled
        ? "Басқа Бағдарламаларды Жабу: Қосулы"
        : "Басқа Бағдарламаларды Жабу: Өшірулі",
    'bn': isEnabled
        ? "অন্যান্য প্রোগ্রামের উপরে রাখুন: চালু"
        : "অন্যান্য প্রোগ্রামের উপরে রাখুন: বন্ধ",
  };

  // Retorna a tradução correspondente ou fallback para inglês
  return translations[languageCode] ?? translations['en']!;
}
