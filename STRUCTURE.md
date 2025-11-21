web-project/  
├─ README.md                  # krátký popis projektu + instrukce pro běh  
├─ /public                    # veřejně dostupné soubory (pokud používáte server)  
│  └─ index.html  
│  
├─ /assets  
│  ├─ /css  
│  │  └─ styles.css           # hlavní CSS (buildovaný Tailwind nebo vlastní)  
│  ├─ /js  
│  │  ├─ main.js              # inicializace, společné funkce  
│  │  ├─ about.js             # načítání about JSON  
│  │  ├─ shiba.js             # načítání plemeno JSON  
│  │  ├─ puppies.js           # načítání puppies JSON a generování karet  
│  │  └─ contact.js           # odesílání formuláře (AJAX)  
│  └─ /img  
│     ├─ /about  
│     ├─ /shiba  
│     └─ /puppies  
│  
├─ /data  
│  ├─ about.json    
│  ├─ shiba.json  
│  ├─ conditions.json  
│  ├─ contact.json  
│  └─ puppies.json  
│  
├─ /api  
│  └─ getPuppies.php         # endpoint vracející puppies.json  
│  
└─ /docs                     # dokumentace  
