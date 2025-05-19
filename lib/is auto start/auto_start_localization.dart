import 'package:intl/intl.dart';

String getAutoStartLocalizedText(bool isEnabled) {
  String locale = Intl.getCurrentLocale();

  // Captura apenas o idioma principal (primeira parte da localidade)
  String languageCode = locale.split('_').first.toLowerCase();

  // Mapeamento de traduções
  Map<String, String> translations = {
    'en': isEnabled ? "Start with System: ON" : "Start with System: OFF",
    'pt': isEnabled
        ? "Iniciar com o Sistema: Ligado"
        : "Iniciar com o Sistema: Desligado",
    'es': isEnabled
        ? "Iniciar con el Sistema: Encendido"
        : "Iniciar con el Sistema: Apagado",
    'fr': isEnabled
        ? "Démarrer avec le Système : Activé"
        : "Démarrer avec le Système : Désactivé",
    'de': isEnabled ? "Mit System starten: Ein" : "Mit System starten: Aus",
    'it': isEnabled
        ? "Avvia con il Sistema: Attivato"
        : "Avvia con il Sistema: Disattivato",
    'ru': isEnabled
        ? "Запуск с системой: Включено"
        : "Запуск с системой: Выключено",
    'zh': isEnabled ? "随系统启动：开启" : "随系统启动：关闭",
    'ja': isEnabled ? "システムと共に起動: オン" : "システムと共に起動: オフ",
    'ko': isEnabled ? "시스템과 함께 시작: 켜짐" : "시스템과 함께 시작: 꺼짐",
    'ar': isEnabled ? "تشغيل مع النظام: تشغيل" : "تشغيل مع النظام: إيقاف",
    'hi': isEnabled ? "सिस्टम के साथ चालू: चालू" : "सिस्टम के साथ चालू: बंद",
    'nl': isEnabled ? "Start met systeem: Aan" : "Start met systeem: Uit",
    'tr': isEnabled ? "Sistemle Başla: Açık" : "Sistemle Başla: Kapalı",
    'sv': isEnabled ? "Starta med systemet: På" : "Starta med systemet: Av",
    'pl': isEnabled
        ? "Uruchom z systemem: Włączone"
        : "Uruchom z systemem: Wyłączone",
    'cs': isEnabled
        ? "Spustit se systémem: Zapnuto"
        : "Spustit se systémem: Vypnuto",
    'fi': isEnabled
        ? "Käynnistä järjestelmän kanssa: Päällä"
        : "Käynnistä järjestelmän kanssa: Pois",
    'el': isEnabled
        ? "Εκκίνηση με το Σύστημα: Ενεργό"
        : "Εκκίνηση με το Σύστημα: Ανενεργό",
    'vi': isEnabled
        ? "Khởi động cùng hệ thống: Bật"
        : "Khởi động cùng hệ thống: Tắt",
    'th': isEnabled ? "เริ่มพร้อมระบบ: เปิด" : "เริ่มพร้อมระบบ: ปิด",
    'he': isEnabled ? "הפעל עם המערכת: פועל" : "הפעל עם המערכת: כבוי",
    // Adicionados
    'ro': isEnabled
        ? "Pornește cu Sistemul: Pornit"
        : "Pornește cu Sistemul: Oprit",
    'hu': isEnabled
        ? "Indítás a rendszerrel: Bekapcsolva"
        : "Indítás a rendszerrel: Kikapcsolva",
    'uk': isEnabled
        ? "Запустити з системою: Увімкнено"
        : "Запустити з системою: Вимкнено",
    'bg': isEnabled
        ? "Стартиране със системата: Включено"
        : "Стартиране със системата: Изключено",
    'hr': isEnabled
        ? "Pokreni sa sustavom: Uključeno"
        : "Pokreni sa sustavom: Isključeno",
    'sr': isEnabled
        ? "Покрени са системом: Укључено"
        : "Покрени са системом: Искључено",
    'sk': isEnabled
        ? "Spustiť so systémom: Zapnuté"
        : "Spustiť so systémom: Vypnuté",
    'da': isEnabled ? "Start med systemet: Til" : "Start med systemet: Fra",
    'no': isEnabled ? "Start med systemet: På" : "Start med systemet: Av",
    'id':
        isEnabled ? "Mulai dengan Sistem: Hidup" : "Mulai dengan Sistem: Mati",
    'ms': isEnabled ? "Mula dengan Sistem: Hidup" : "Mula dengan Sistem: Mati",
    'fa': isEnabled ? "شروع با سیستم: روشن" : "شروع با سیستم: خاموش",
    'tl': isEnabled
        ? "Simulan kasama ang Sistema: Buksan"
        : "Simulan kasama ang Sistema: Patayin",
    'sw': isEnabled ? "Anza na Mfumo: Wazi" : "Anza na Mfumo: Zima",
    'lt': isEnabled
        ? "Pradėti su sistema: Įjungta"
        : "Pradėti su sistema: Išjungta",
    'lv': isEnabled ? "Sākt ar sistēmu: Ieslēgts" : "Sākt ar sistēmu: Izslēgts",
    'et': isEnabled
        ? "Käivita koos süsteemiga: Sees"
        : "Käivita koos süsteemiga: Väljas",
    'az': isEnabled ? "Sistemlə başla: Açıq" : "Sistemlə başla: Bağlı",
    'uz': isEnabled
        ? "Tizim bilan boshlash: Yoqilgan"
        : "Tizim bilan boshlash: O‘chirilgan",
    'kk': isEnabled ? "Жүйемен бастау: Қосулы" : "Жүйемен бастау: Өшірулі",
    'bn': isEnabled ? "সিস্টেমের সাথে শুরু: চালু" : "সিস্টেমের সাথে শুরু: বন্ধ",
  };

  // Retorna a tradução correspondente ou fallback para inglês
  return translations[languageCode] ?? translations['en']!;
}
