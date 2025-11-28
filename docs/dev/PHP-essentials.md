
# PHP – Úvodní tutoriál pro začátečníky

Tento dokument je určen pro začátečníky.  
Slouží jako rychlý úvod do jazyka PHP, včetně základní syntaxe a postupů pro spuštění kódu.

---

# 1. Co je PHP?

- PHP je skriptovací jazyk používaný především pro webové stránky.
- Kód se spouští na serveru.
- Výsledek je HTML, které vidí prohlížeč.
- Soubory mají příponu .php.

---

# 2. Základní zápis PHP

PHP kód musí být mezi značkami:

```php
<?php
// PHP kód

````

Příklad:

```php
<?php
echo "Ahoj světe!";

```

---

# 3. Výstup: echo a print

```php
echo "Ahoj!";
print "Taky ahoj!";
```

---

# 4. Proměnné

Proměnná začíná vždy znakem `$`.

```php
$vek = 17;
$jmeno = "Petr";
$aktivni = true;
```

---

# 5. Textové řetězce

### Spojení textů

```php
echo "Ahoj " . $jmeno;
```

### Proměnná uvnitř textu (v uvozovkách)

```php
echo "Jmenuji se $jmeno";
```

---

# 6. Podmínky

```php
$vek = 18;

if ($vek >= 18) {
    echo "Dospělý";
} elseif ($vek >= 15) {
    echo "Mladistvý";
} else {
    echo "Dítě";
}
```

---

# 7. Logické operátory

```
&&   logické A
||   logické NEBO
!    negace
```

---

# 8. Cykly

### for

```php
for ($i = 1; $i <= 5; $i++) {
    echo $i;
}
```

### while

```php
$i = 1;
while ($i <= 5) {
    echo $i;
    $i++;
}
```

### foreach (pro pole)

```php
$ovoce = ["jablko", "banán"];

foreach ($ovoce as $kousek) {
    echo $kousek;
}
```

---

# 9. Funkce

```php
function pozdrav($jmeno) {
    return "Ahoj, $jmeno!";
}

echo pozdrav("Lucie");
```

---

# 10. Pole

### Indexované pole

```php
$ovoce = ["jablko", "hruška"];
echo $ovoce[0];
```

### Asociativní pole

```php
$osoba = [
    "jmeno" => "Karel",
    "vek"   => 21
];

echo $osoba["jmeno"];
```

---

# 11. Superglobální proměnné

### GET (parametry v URL)

URL: `info.php?jmeno=Petr`

```php
$jmeno = $_GET["jmeno"];
```

### POST (formuláře)

```php
$jmeno = $_POST["jmeno"];
```

---

# 12. Kombinace HTML a PHP

```php
<?php $jmeno = "Adam"; ?>

<h1>Vítejte</h1>
<p>Přihlášený uživatel: <?php echo $jmeno; ?></p>
```

---

# 13. Souborové operace

```php
file_put_contents("soubor.txt", "nějaký text");

$text = file_get_contents("soubor.txt");
echo $text;
```

---

# 14. Mini projekt – Generátor pozdravu

Soubor `pozdrav.php`:

```php
<?php
$jmeno = $_GET["jmeno"] ?? "návštěvníku";
$cas = date("H");

if ($cas < 12) {
    $pozdrav = "Dobré ráno";
} elseif ($cas < 18) {
    $pozdrav = "Dobrý den";
} else {
    $pozdrav = "Dobrý večer";
}

echo "$pozdrav, $jmeno!";
```

Použití:

```
pozdrav.php?jmeno=Eva
```

---

# 15. Jak spustit PHP lokálně

Pro žáky je dostupných několik možností:

* instalace PHP (samostatný balík)
* vestavěný vývojový server v PHP
* nástroje jako XAMPP nebo Laragon (pokročilejší)

---

# 16. Spuštění PHP Development Serveru

Toto je nejjednodušší způsob, jak spustit PHP bez nutnosti instalovat Apache nebo XAMPP.

### 1) Přejít do složky projektu:

```
cd cesta/k/projektu
```

### 2) Spustit vestavěný server:

```
php -S localhost:8000
```

### 3) Otevřít v prohlížeči:

```
http://localhost:8000
```

### Poznámky:

* Funguje na Windows, macOS i Linuxu.
* Je vhodný pouze pro vývoj, ne pro produkci.
* Automaticky obsluhuje PHP skripty.

---

# 17. Příklad struktury jednoduchého projektu

```
projekt/
 ├── index.php
 ├── pozdrav.php
 └── data.txt
```

Spuštění:

```
php -S localhost:8000
```

---

# 18. Doporučené nástroje

* VS Code + rozšíření pro PHP
* PHP 8.x
* vestavěný server (`php -S`)
* XAMPP nebo Laragon jako pozdější krok

---

# 19. Doporučený postup pro žáky

1. Nainstalovat PHP (stačí samotné binární soubory).
2. Vytvořit složku projektu.
3. Otevřít ji ve VS Code.
4. Spustit PHP server příkazem `php -S localhost:8000`.
5. Učit se postupně:

   * proměnné,
   * podmínky,
   * cykly,
   * funkce,
   * pole,
   * jednoduchý formulář a GET/POST.

