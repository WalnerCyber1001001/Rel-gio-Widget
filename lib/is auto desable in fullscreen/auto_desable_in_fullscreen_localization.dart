import 'package:intl/intl.dart';

String getAutoDesableInFullscreenLocalizationText(bool isEnabled) {
  String locale = Intl.getCurrentLocale();

  // Captura apenas o idioma principal (primeira parte da localidade)
  String languageCode = locale.split('_').first.toLowerCase();

  // Mapeamento de traduções
  Map<String, String> translations = {
    'en': isEnabled
        ? "Disable in Fullscreen Apps: ON"
        : "Disable in Fullscreen Apps: OFF",
    'pt': isEnabled
        ? "Desativar em Apps Fullscreen: Ligado"
        : "Desativar em Apps Fullscreen: Desligado",
    'es': isEnabled
        ? "Desactivar en Apps de Pantalla Completa: Activado"
        : "Desactivar en Apps de Pantalla Completa: Desactivado",
    'fr': isEnabled
        ? "Désactiver dans les Applications Plein Écran : Activé"
        : "Désactiver dans les Applications Plein Écran : Désactivé",
    'de': isEnabled
        ? "In Vollbild-Apps deaktivieren: Ein"
        : "In Vollbild-Apps deaktivieren: Aus",
    'it': isEnabled
        ? "Disabilita nelle App a Schermo Intero: Attivato"
        : "Disabilita nelle App a Schermo Intero: Disattivato",
    'ru': isEnabled
        ? "Отключить в полноэкранных приложениях: Включено"
        : "Отключить в полноэкранных приложениях: Выключено",
    'zh': isEnabled ? "禁用全屏应用程序：开启" : "禁用全屏应用程序：关闭",
    'ja': isEnabled ? "フルスクリーンアプリで無効化: オン" : "フルスクリーンアプリで無効化: オフ",
    'ko': isEnabled ? "전체 화면 앱에서 비활성화: 켜짐" : "전체 화면 앱에서 비활성화: 꺼짐",
    'ar': isEnabled
        ? "تعطيل في تطبيقات ملء الشاشة: تشغيل"
        : "تعطيل في تطبيقات ملء الشاشة: إيقاف",
    'hi': isEnabled
        ? "फुलस्क्रीन ऐप्स में अक्षम करें: चालू"
        : "फुलस्क्रीन ऐप्स में अक्षम करें: बंद",
    'nl': isEnabled
        ? "Uitschakelen in Fullscreen-apps: Aan"
        : "Uitschakelen in Fullscreen-apps: Uit",
    'tr': isEnabled
        ? "Tam Ekran Uygulamalarda Devre Dışı Bırak: Açık"
        : "Tam Ekran Uygulamalarda Devre Dışı Bırak: Kapalı",
    'sv': isEnabled
        ? "Inaktivera i Fullskärmsappar: På"
        : "Inaktivera i Fullskärmsappar: Av",
    'pl': isEnabled
        ? "Wyłącz w aplikacjach pełnoekranowych: Włączone"
        : "Wyłącz w aplikacjach pełnoekranowych: Wyłączone",
    'cs': isEnabled
        ? "Zakázat v aplikacích na celou obrazovku: Zapnuto"
        : "Zakázat v aplikacích na celou obrazovku: Vypnuto",
    'fi': isEnabled
        ? "Poista käytöstä kokoruudun sovelluksissa: Päällä"
        : "Poista käytöstä kokoruudun sovelluksissa: Pois",
    'el': isEnabled
        ? "Απενεργοποίηση σε εφαρμογές πλήρους οθόνης: Ενεργό"
        : "Απενεργοποίηση σε εφαρμογές πλήρους οθόνης: Ανενεργό",
    'vi': isEnabled
        ? "Tắt trong Ứng dụng Toàn màn hình: Bật"
        : "Tắt trong Ứng dụng Toàn màn hình: Tắt",
    'th': isEnabled
        ? "ปิดใช้งานในแอปเต็มหน้าจอ: เปิด"
        : "ปิดใช้งานในแอปเต็มหน้าจอ: ปิด",
    'he': isEnabled
        ? "השבת באפליקציות מסך מלא: פועל"
        : "השבת באפליקציות מסך מלא: כבוי",
    'ro': isEnabled
        ? "Dezactivează în Aplicațiile Fullscreen: Activat"
        : "Dezactivează în Aplicațiile Fullscreen: Dezactivat",
    'hu': isEnabled
        ? "Letiltás teljes képernyős alkalmazásokban: Bekapcsolva"
        : "Letiltás teljes képernyős alkalmazásokban: Kikapcsolva",
    'uk': isEnabled
        ? "Вимкнути у повноекранних додатках: Увімкнено"
        : "Вимкнути у повноекранних додатках: Вимкнено",
    'bg': isEnabled
        ? "Деактивиране в приложения на цял екран: Включено"
        : "Деактивиране в приложения на цял екран: Изключено",
    'hr': isEnabled
        ? "Onemogući u Aplikacijama Punog Zaslona: Uključeno"
        : "Onemogući u Aplikacijama Punog Zaslona: Isključeno",
    'sr': isEnabled
        ? "Онемогући у апликацијама преко целог екрана: Укључено"
        : "Онемогући у апликацијама преко целог екрана: Искључено",
    'sk': isEnabled
        ? "Zakázať v aplikáciách na celú obrazovku: Zapnuté"
        : "Zakázať v aplikáciách na celú obrazovku: Vypnuté",
    'da': isEnabled
        ? "Deaktiver i fuldskærmsapps: Til"
        : "Deaktiver i fuldskærmsapps: Fra",
    'no': isEnabled
        ? "Deaktiver i fullskjermsapper: På"
        : "Deaktiver i fullskjermsapper: Av",
    'id': isEnabled
        ? "Nonaktifkan di Aplikasi Layar Penuh: Hidup"
        : "Nonaktifkan di Aplikasi Layar Penuh: Mati",
    'ms': isEnabled
        ? "Nyahaktifkan dalam Aplikasi Skrin Penuh: Hidup"
        : "Nyahaktifkan dalam Aplikasi Skrin Penuh: Mati",
    'fa': isEnabled
        ? "غیرفعال کردن در برنامه‌های تمام‌صفحه: روشن"
        : "غیرفعال کردن در برنامه‌های تمام‌صفحه: خاموش",
    'tl': isEnabled
        ? "Huwag paganahin sa Fullscreen Apps: Bukas"
        : "Huwag paganahin sa Fullscreen Apps: Sarado",
    'sw': isEnabled
        ? "Zima katika Programu za Skrini Nzima: Wazi"
        : "Zima katika Programu za Skrini Nzima: Zima",
    'lt': isEnabled
        ? "Išjungti viso ekrano programose: Įjungta"
        : "Išjungti viso ekrano programose: Išjungta",
    'lv': isEnabled
        ? "Atspējot pilnekrāna lietotnēs: Ieslēgts"
        : "Atspējot pilnekrāna lietotnēs: Izslēgts",
    'et': isEnabled
        ? "Keela täisekraani rakendustes: Sees"
        : "Keela täisekraani rakendustes: Väljas",
    'az': isEnabled
        ? "Tam ekran proqramlarda söndür: Açıq"
        : "Tam ekran proqramlarda söndür: Bağlı",
    'uz': isEnabled
        ? "To‘liq ekran ilovalarda o‘chirilsin: Yoqilgan"
        : "To‘liq ekran ilovalarda o‘chirilsin: O‘chirilgan",
    'kk': isEnabled
        ? "Толық экранды қолданбаларда өшіру: Қосулы"
        : "Толық экранды қолданбаларда өшіру: Өшірулі",
    'bn': isEnabled
        ? "ফুলস্ক্রীন অ্যাপে নিষ্ক্রিয় করুন: চালু"
        : "ফুলস্ক্রীন অ্যাপে নিষ্ক্রিয় করুন: বন্ধ",
  };

  // Retorna a tradução correspondente ou fallback para inglês
  return translations[languageCode] ?? translations['en']!;
}
