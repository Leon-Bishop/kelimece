# Kelimece değişiklikleri

- **Yeni görünüm:** Sıcak kâğıt tonları, turkuaz/mercan vurguları, özgün çiçek amblemi, yuvarlatılmış karo ve klavye tuşları, sade editoryal başlık.
- **Ses İzi:** İsteyen oyuncu günde bir kez gizli kelimedeki sesli harf sayısını öğrenebilir. Bu, tahmin hakkını tüketmez; ipucu kullanımı günün paylaşımında belirtilir.
- **İz Şeridi:** Altı denemenin ilerlemesini küçük mühürlerle gösteren gösterge.
- **Günün Mührü:** Bulma hızına göre Türkçe sonuç unvanı; paylaşım metnine eklenir.
- **Son 7 Günün İzi:** İstatistikler ekranında son yedi günün küçük takvimi.
- **Mac testi:** Başlatıcı artık sabit `http://127.0.0.1:8765/` adresini kullanır; Safari aynı adreste kaldığı için günlük ilerleme kapatıp açınca korunur.

**Değişmeyen kurallar:** Her gün İstanbul saatiyle 00.00'da **tek** yeni 5 harfli Türkçe kelime; günde 6 tahmin, doğru/yakın/yok renkleri, zor mod, karanlık tema, yerel istatistikler ve paylaşım. Kelime listeleri ile günlük kelime seçme algoritması değiştirilmedi.
## 2026-11-16 — Expanded guess dictionary

- Imported eligible five-letter entries from the user-provided `words(1).js` for attempts only.
- Accepted guesses increased from 968 to **5,421** (4,453 additions); Istanbul daily answer sequence stays at **764** and is unchanged.
- Normalize with NFC and Turkish locale uppercase; accept only the specified 29 Turkish letters.
- Some circumflex spellings in the supplied file are not accepted under the existing alphabet rule. Dictionary is not yet 50,000 words.
