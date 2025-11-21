# Kde a jak se načítá JSON přes HTTP

**Kde se provádí načítání JSON:**

* Na klientské straně: v JavaScript souborech v `/assets/js/` — např. `about.js`, `shiba.js`, `puppies.js`, `contact.js`. Tyto skripty posílají HTTP GET požadavky (AJAX / `fetch`) na server a zpracují odpověď.
* Na serveru: buď staticky (webserver přímo obslouží soubor `/data/*.json`) **nebo** dynamicky přes endpoint v `/api/` (např. `api/getPuppies.php`), který načte data (z JSON souboru nebo DB) a vrátí je klientovi jako JSON.

## Jak proběhne předání ze serveru klientovi (krok za krokem)

1. **Klient (prohlížeč)** spustí JS (např. `puppies.js`) a zavolá `fetch('/data/puppies.json')` nebo `fetch('/api/getPuppies.php')`.
2. **Server** přijme HTTP GET.

   * Pokud je to statický soubor (`/data/puppies.json`), webserver (Apache/Nginx) jej jen pošle zpět s hlavičkou `Content-Type: application/json`.
   * Pokud je to PHP endpoint (`/api/getPuppies.php`), skript na serveru načte data (soubor nebo DB), nastaví hlavičky a **echo** JSON (např. `echo json_encode($data);`). Nezapomenout `header('Content-Type: application/json; charset=utf-8');`.
3. **Prohlížeč** obdrží odpověď, JS zavolá `response.json()` a dostane JS objekt/array.
4. **JS** vygeneruje HTML (karty, odstavce apod.) a vloží ho do DOM.
5. Případné chyby (404, 500, JSON parse error, síť) se ošetří v `catch` a uživateli zobrazí vhodná hláška.

## Doporučené endpointy (jednoduché)

* Statické: `/data/about.json`, `/data/shiba.json`, `/data/conditions.json`, `/data/contact.json`, `/data/puppies.json`
* Dynamické: `/api/getPuppies.php` — vrací JSON (může číst ze stejného `data/puppies.json` nebo přímo z DB)
