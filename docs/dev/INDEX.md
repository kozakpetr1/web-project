# Dokumentace k `index.html` – chovatelská stanice pejsků

## 1. Základní struktura HTML5

```html
<!DOCTYPE html>
<html lang="cs">
<head>
  <meta charset="UTF-8">
  <title>Chovatelská stanice pejsků</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  ...
</head>
<body> ... </body>
</html>
```

### Vysvětlení:

* `<!DOCTYPE html>`
  Deklarace typu dokumentu. Říká prohlížeči, že dokument používá HTML5.

* `<html lang="cs">`
  Kořenový element stránky.
  Atribut `lang="cs"` určuje jazyk obsahu (čeština) – důležité pro:

  * čtečky obrazovky,
  * SEO,
  * překladače.

* `<head>`
  Metainformace o dokumentu (kódování, název, viewport, připojené styly a skripty).

* `<meta charset="UTF-8">`
  Určuje kódování (UTF-8), aby se správně zobrazily háčky, čárky a další znaky.

* `<title>Chovatelská stanice pejsků</title>`
  Text v titulku záložky / okna prohlížeče, používají ho i vyhledávače.

* `<meta name="viewport" content="width=device-width, initial-scale=1">`
  Nastavení zobrazení na mobilech – stránka se škáluje podle šířky zařízení (responsivita).

---

## 2. Tailwind CSS – přidání přes CDN

```html
<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>
<script>
  tailwind.config = {
    theme: {
      extend: {
        fontFamily: {
          sans: ['system-ui', 'Segoe UI', 'sans-serif'],
        },
        colors: {
          kennel: {
            light: '#FEF3C7',
            DEFAULT: '#FBBF24',
            dark: '#B45309',
          },
        },
      },
    },
  };
</script>
```

### Vysvětlení:

* `<script src="https://cdn.tailwindcss.com"></script>`
  Načte Tailwind CSS přímo z CDN – není potřeba build nástroji (Vite, Webpack, atd.).

* `tailwind.config`
  Rozšíření výchozího Tailwind nastavení:

  * `fontFamily.sans` – výchozí bezpatkové písmo (systémové).
  * `colors.kennel` – vlastní barevná paleta:

    * `kennel-light` – světle žlutá (pozadí),
    * `kennel` – hlavní žlutá,
    * `kennel-dark` – tmavší žlutá (tlačítka, zvýraznění).

Tyto barvy pak používáš ve třídách typu `bg-kennel`, `bg-kennel-light`, `text-kennel-dark`.

---

## 3. Celkové rozvržení stránky

```html
<body class="bg-slate-50 text-slate-800 font-sans antialiased">
  <div class="min-h-screen flex flex-col">
    <!-- HLAVIČKA -->
    <header>...</header>

    <!-- OBSAH -->
    <main class="flex-1">...</main>

    <!-- PATIČKA -->
    <footer id="kontakt">...</footer>
  </div>
  ...
</body>
```

### Vysvětlení:

* `body`:

  * `bg-slate-50` – světlé šedé pozadí celé stránky.
  * `text-slate-800` – tmavší šedý text (lepší čitelnost než čistě černá).
  * `font-sans` – výchozí sans-serif písmo dle Tailwind configu.
  * `antialiased` – jemnější vykreslení textu.

* Wrapper `<div class="min-h-screen flex flex-col">`:

  * `min-h-screen` – minimální výška je celá výška okna.
  * `flex flex-col` – flexbox, sloupce: nahoře hlavička, uprostřed obsah, dole patička.
  * Díky `flex-1` na `<main>` patička zůstane „přilepená“ dole, i když je málo obsahu.

---

## 4. Hlavička (header)

```html
<header class="bg-white border-b border-slate-200 sticky top-0 z-20">
  <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
    <!-- Logo / název -->
    <div class="flex items-center gap-2">
      <div class="w-9 h-9 rounded-full bg-kennel flex items-center justify-center">
        <span class="text-xl">🐾</span>
      </div>
      <div class="leading-tight">
        <div class="text-xs uppercase tracking-wide text-slate-500">Chovatelská stanice</div>
        <div class="font-semibold text-sm sm:text-base text-slate-900">Zlatý čumáček</div>
      </div>
    </div>

    <!-- Navigace -->
    <nav class="hidden md:flex items-center gap-6 text-sm">
      <a href="#uvod" class="text-slate-700 hover:text-slate-950 transition-colors">Úvod</a>
      <a href="#o-nas" class="text-slate-700 hover:text-slate-950 transition-colors">O nás</a>
      <a href="#psi" class="text-slate-700 hover:text-slate-950 transition-colors">Naši psi</a>
      <a href="#obsah" class="text-slate-700 hover:text-slate-950 transition-colors">Obsah</a>
      <a href="#kontakt" class="text-slate-700 hover:text-slate-950 transition-colors">Kontakt</a>
    </nav>
  </div>
</header>
```

### Vysvětlení:

* `header`:

  * `bg-white` – bílá hlavička.
  * `border-b border-slate-200` – tenká spodní linka.
  * `sticky top-0 z-20` – hlavička zůstává přilepená nahoře při scrollování.

* Logo + název:

  * ikona tlapky v barevném kolečku (`bg-kennel`),
  * text rozdělený na menší nadpis („Chovatelská stanice“) a větší název („Zlatý čumáček“).

* Navigace:

  * `<nav>` obsahuje odkazy na jednotlivé sekce (one-page).
  * `hidden md:flex` – navigace se zobrazí až od velikosti `md` (na mobilu by se dala později nahradit hamburger menu).
  * Odkazy používají id sekcí: `#uvod`, `#o-nas`, `#psi`, `#obsah`, `#kontakt`.

---

## 5. Úvodní sekce (hero) – `#uvod`

```html
<section id="uvod" class="relative overflow-hidden">
  <div class="absolute inset-0 bg-gradient-to-br from-kennel-light via-white to-slate-100"></div>
  <div class="absolute -right-32 -bottom-40 w-80 h-80 rounded-full bg-kennel/20 blur-3xl"></div>

  <div class="relative max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-10 sm:py-14 md:py-16">
    <div class="grid md:grid-cols-2 gap-10 items-center">
      <!-- Textový blok -->
      ...
      <!-- Vizuál -->
      ...
    </div>
  </div>
</section>
```

### Pozadí:

* `bg-gradient-to-br from-kennel-light via-white to-slate-100`
  Jemný barevný přechod (pastelová žlutá → bílá → světle šedá).

* Druhý `<div>` s `rounded-full bg-kennel/20 blur-3xl`
  Barevné „rozmazané kolečko“ pro decentní vizuální efekt.

### Textový blok:

```html
<div class="space-y-5">
  <span class="inline-flex items-center gap-2 rounded-full bg-white/80 px-3 py-1 text-xs font-semibold border border-yellow-100">
    <span class="text-kennel-dark uppercase tracking-wide">Rodinný chov</span>
    <span class="text-slate-600 normal-case">Štěňata z lásky, ne z továrny</span>
  </span>

  <h1 class="text-3xl sm:text-4xl md:text-5xl font-extrabold text-slate-900 leading-tight">
    Chovatelská stanice pejsků
    <span class="block text-kennel-dark">Zlatý čumáček</span>
  </h1>

  <p class="text-sm sm:text-base text-slate-700 max-w-xl">
    Malá rodinná chovatelská stanice...
  </p>

  <div class="flex flex-wrap gap-3">
    <a href="#psi" class="...">Naši psi</a>
    <a href="#kontakt" class="...">Kontaktujte nás</a>
  </div>
</div>
```

* Malý štítek („Rodinný chov“) – stručný claim.
* `h1` – hlavní nadpis stránky (důležitý pro SEO i pro strukturu).
* Popis chovu.
* Tlačítka:

  * primární: „Naši psi“ (`bg-kennel-dark`),
  * sekundární: „Kontaktujte nás“ (border, bílý podklad).

### Vizuál (pravá část):

```html
<div class="relative">
  <div class="aspect-[4/3] rounded-3xl overflow-hidden shadow-lg border border-slate-200 bg-white flex items-center justify-center">
    <span class="text-6xl">🐕</span>
  </div>
</div>
```

* Zástupný obrázek (ikona psa) – reálně sem přijde fotka nebo obrázek:

  * `aspect-[4/3]` – poměr stran 4:3,
  * `rounded-3xl`, `shadow-lg` – zaoblené rohy, stín,
  * `overflow-hidden` – obrázek nepřetéká z kontejneru.

---

## 6. Sekce „O nás“ – `#o-nas`

```html
<section id="o-nas" class="py-10 sm:py-14 md:py-16">
  <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 space-y-4">
    <h2 class="text-2xl sm:text-3xl font-bold text-slate-900">O nás</h2>
    <p class="text-sm sm:text-base text-slate-700">...</p>
    <p class="text-sm sm:text-base text-slate-700">...</p>
  </div>
</section>
```

### Vysvětlení:

* Samostatná sekce pro text o chovatelské stanici.
* `h2` – nadpis druhé úrovně (pod `h1`), dodržuje hierarchii titulků.
* Dva odstavce popisující:

  * kdo jsme,
  * jak chováme,
  * jak funguje socializace.

---

## 7. Sekce „Naši psi“ – `#psi`

```html
<section id="psi" class="py-10 sm:py-14 md:py-16 bg-slate-100">
  <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="mb-6">
      <h2 class="text-2xl sm:text-3xl font-bold text-slate-900">Naši psi</h2>
      <p class="text-sm sm:text-base text-slate-700">
        Zde můžete představit chovné psy a feny...
      </p>
    </div>

    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
      <!-- Karty psů -->
      <article class="...">...</article>
      <article class="...">...</article>
      <article class="...">...</article>
    </div>
  </div>
</section>
```

### Karta jednoho psa:

```html
<article class="bg-white rounded-2xl shadow-sm border border-slate-200 overflow-hidden">
  <div class="aspect-[4/3] bg-slate-200 flex items-center justify-center">
    <span class="text-4xl">🐶</span>
  </div>
  <div class="p-4 space-y-1 text-sm">
    <h3 class="font-semibold text-slate-900">Jméno psa</h3>
    <p class="text-xs uppercase tracking-wide text-slate-500">chovný pes</p>
    <p class="text-slate-700">
      Krátký popis povahy, zdravotní výsledky...
    </p>
  </div>
</article>
```

* `article` – vhodný semantický element pro „samostatnou jednotku obsahu“.
* Horní část: náhled obrázku (zástupce zatím emoji).
* Dolní část: jméno psa, typ (chovný pes / fena / rodinný pes), popis.

Grid se přizpůsobuje:

* 1 sloupec na mobilu,
* 2 sloupce na `sm:`,
* 3 sloupce na `lg:`.

---

## 8. Sekce „Obsah“ – místo pro AJAX – `#obsah`

```html
<section id="obsah" class="py-10 sm:py-14 md:py-16">
  <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 space-y-3">
    <h2 class="text-2xl sm:text-3xl font-bold text-slate-900">Obsah</h2>
    <p class="text-sm sm:text-base text-slate-700">
      Zde může být dynamický obsah načítaný pomocí AJAXu...
    </p>

    <div id="ajax-content" class="mt-4 rounded-2xl border border-dashed border-slate-300 bg-white/70 p-4 text-sm text-slate-600">
      <p>
        Sem můžete později pomocí JavaScriptu načítat obsah...
      </p>
    </div>
  </div>
</section>
```

### Vysvětlení:

* `#obsah` – zakotvení pro navigaci.
* `#ajax-content` – div, do kterého můžeš v budoucnu přes JS vkládat:

  * aktuality,
  * informace o vrzích,
  * fotky,
  * atd.
* `border-dashed` – pomlčkovaný rámeček, aby bylo vizuálně zřejmé, že jde o „pole pro obsah“.

---

## 9. Patička (footer) – `#kontakt`

```html
<footer id="kontakt" class="bg-slate-900 text-slate-50">
  <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">
    <div class="grid md:grid-cols-2 gap-6">
      <!-- Kontaktní údaje -->
      <div>...</div>

      <!-- Info pro zájemce o štěně -->
      <div>...</div>
    </div>

    <div class="border-t border-slate-700 pt-4 text-xs flex flex-col sm:flex-row gap-2 sm:items-center sm:justify-between text-slate-500">
      <span>© <span id="year"></span> Chovatelská stanice Zlatý čumáček.</span>
      <span>Jednoduchý one-page web v HTML5 &amp; Tailwind CSS.</span>
    </div>
  </div>
</footer>
```

### Kontakty:

```html
<h2 class="text-lg font-semibold mb-2">Kontakt</h2>
<dl class="space-y-2 text-sm">
  <div>
    <dt class="text-slate-400">Chovatelská stanice</dt>
    <dd class="font-semibold">Zlatý čumáček</dd>
  </div>
  <div>
    <dt class="text-slate-400">Telefon</dt>
    <dd class="font-semibold">+420 123 456 789</dd>
  </div>
  <div>
    <dt class="text-slate-400">E-mail</dt>
    <dd class="font-semibold">info@zlaty-cumacek.cz</dd>
  </div>
  <div>
    <dt class="text-slate-400">Lokalita</dt>
    <dd class="font-semibold">např. Střední Čechy</dd>
  </div>
</dl>
```

* Použití definic `dl / dt / dd`:

  * `dt` – název položky (Telefon),
  * `dd` – hodnota (číslo).

### Info pro zájemce:

* Vysvětluje, jak vás kontaktovat, a že lze doplnit další obsah (vrhy, rodokmeny atd.).

### Spodní pruh:

```html
<div class="border-t border-slate-700 pt-4 text-xs ...">
  <span>© <span id="year"></span> ...</span>
  <span>Jednoduchý one-page web...</span>
</div>
```

* Jednoduchá „copyright“ linie.
* `id="year"` se doplní skriptem.

---

## 10. JavaScript na konci stránky

```html
<script>
  // Aktuální rok v patičce
  document.getElementById('year').textContent = new Date().getFullYear();
</script>
```

### Vysvětlení:

* Získá element `<span id="year"></span>` a nastaví do něj aktuální rok.
* Je to drobný UX detail – nemusíš každý rok ručně měnit číslo v patičce.

---

## 11. Shrnutí a možné rozšíření

Co tenhle základní web už má:

* HTML5 strukturu (semantic: `header`, `main`, `section`, `footer`, `nav`, `article`, `dl`).
* Jednoduchý, responzivní layout přes Tailwind:

  * responsivní gridy,
  * přepínání navigace od `md`,
  * pěkný hero blok.
* Místo pro pozdější AJAX obsah (`#ajax-content`).
* Patičku s kontakty a dynamickým rokem.

Co je možné přidat:

* Skutečné fotografie místo emoji.
* Podstránky typu „Galerie“, „Vrh A/B…“ – i když zůstanete u one-page, můžeš je přidat jako další sekce.
* Jednoduché načítání JSON dat (např. seznam vrhů) do `#ajax-content`.
* Mobilní menu (hamburger) pro `<nav>`.

