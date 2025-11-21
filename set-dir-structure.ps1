# vytvoření adresářů uvnitř projektového adresáře
$dirs = @(
    "assets",
    "assets/css",
    "assets/js",
    "assets/img/about",
    "assets/img/shiba",
    "assets/img/puppies",
    "data",
    "api",
    "docs",
    "public"
)

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
}

# vytvoření prázdných souborů
$files = @(
    "public/index.html",
    "README.md",
    "assets/css/styles.css",
    "assets/js/main.js",
    "assets/js/about.js",
    "assets/js/shiba.js",
    "assets/js/puppies.js",
    "assets/js/contact.js",
    "data/about.json",
    "data/shiba.json",
    "data/conditions.json",
    "data/contact.json",
    "data/puppies.json",
    "api/getPuppies.php"
)

foreach ($file in $files) {
    New-Item -ItemType File -Path $file -Force | Out-Null
}

# zobrazení výsledku
Write-Host "Adresářová struktura projektu byla úspěšně vytvořena." -ForegroundColor Green
