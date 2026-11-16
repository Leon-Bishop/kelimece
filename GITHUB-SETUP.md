# GitHub kurulumu / GitHub setup

Bu dizin, **Kelimece** için GitHub'a yüklemeye hazırdır.

1. https://github.com/new adresinde `kelimece` adlı bir **public** depo oluşturun (GitHub Pages'i ücretsiz kullanmak için); README veya .gitignore oluşturma seçeneklerini işaretlemeyin.
2. GitHub'da yeni depoya gidip **uploading an existing file** bağlantısına tıklayın (ya da **Add file > Upload files**).
3. Buradaki tüm dosyaları yükleyin ve **Commit changes**'e tıklayın. `.nojekyll` gibi gizli dosyaları Finder'da görmek için Command+Shift+Period tuşlayın.
4. **Settings > Pages > Build and deployment > Deploy from a branch > main > /(root) > Save**.
5. Birkaç dakika sonra `https://USERNAME.github.io/kelimece/` adresini ziyaret edin.

**Not:** Gece yarısı İstanbul saati ile günlük kelime değişir. `words.js` içinde yayın sonrası kelime listesini değiştirirseniz geçmiş/günlük sıralama değişebilir.

---

1. Create a public repository at https://github.com/new named `kelimece`. Leave "Add a README" and "Add .gitignore" unchecked.
2. Upload every file from this folder into the repository root and commit.
3. Go to **Settings > Pages**, set **Deploy from a branch**, `main`, `/(root)`, then save.
4. Once published, visit `https://USERNAME.github.io/kelimece/`.