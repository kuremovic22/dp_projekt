# Ekspertni sustav za procjenu kreditne sposobnosti

Ova wiki stranica opisuje ekspertni sustav za procjenu kreditne sposobnosti klijenata, razvijen korištenjem deklarativnog programiranja u jeziku **Flora-2 (F-logic)** iznad **XSB Prologa**. Sustav se temelji na poslovnim pravilima kojima se modeliraju financijski pokazatelji i kriteriji odlučivanja koji se uobičajeno koriste u bankarskoj praksi.

---

## Opis sustava

Sustav omogućuje procjenu kreditne sposobnosti klijenata na temelju:
- prosječnih mjesečnih primanja,
- postojećih kreditnih i kartičnih obveza,
- tipa ugovora o radu i staža,
- DSTI pokazatelja (Debt Service to Income),
- poslovnih zabrana (npr. OSR status).

Zaključivanje se provodi deklarativno, izvođenjem novih atributa i odluka nad objektima klase `klijent` i `zahtjev`, bez eksplicitnog opisivanja algoritamskog toka.

---

## Korištene tehnologije

- **Flora-2 (F-logic)** – reprezentacija znanja i zaključivanje
- **XSB Prolog** – logičko izvršno okruženje
- **Emacs** – razvojno sučelje
- **Ubuntu Linux** – operacijski sustav

---

## Struktura repozitorija

- `schema.flr`  
  Definicija domene: klase, atributi i odnosi između entiteta.

- `rules.flr`  
  Pravila zaključivanja za izračun financijskih pokazatelja i donošenje odluka.

- `data.flr`  
  Testni podaci: klijenti, krediti i kreditni zahtjevi.

- `main.flr`  
  Glavna ulazna datoteka koja uključuje sve ostale komponente sustava.

- `tests.cmd`  
  Skup testnih upita za provjeru rada sustava.

- `test.sh`  
  Shell skripta za automatizirano pokretanje testova.

---

## Preduvjeti

Sustav je razvijan i testiran u sljedećem okruženju:

- Ubuntu Linux
- XSB Prolog
- Flora-2
- Emacs

Flora-2 je korišten kao nadogradnja nad XSB Prologom. Emacs je služio kao uređivač koda i interaktivno sučelje za učitavanje modula i izvođenje upita.

Službene stranice alata:
- https://xsb.sourceforge.net/
- https://flora.sourceforge.net/

---

## Pokretanje sustava

### Pokretanje u Emacsu

1. Pokrenuti Emacs iz terminala:
   ```bash
   emacs
   ```
2. Otvoriti glavnu datoteku: main.flr
3. U Emacs učitati datoteku u Flora-2 okruženje pomoću:
     Ctrl+c, Ctrl+b

Nakon učitavanja, sustav je spreman za izvođenje upita.

## Primjeri upita

### Ispis svih klijenata
  ```prolog
?K:klijent[ime->?Ime].
```

### Ukupna primanja klijenta
  ```prolog
   ?K:klijent[ime->?Ime], ?K[ukupna_primanja->?U].```

Postojeće obveze klijenta
  ```prolog
   ?K:klijent[ime->?Ime], ?K[postojece_obveze_ukupno->?O].
```

### Raspoloživo za ratu (klijent)
  ```prolog
   ?K:klijent[ime->?Ime], ?K[raspolozivo_za_ratu->?R].
```

### Odluka o kreditnom zahtjevu
  ```prolog
   ?Z:zahtjev, ?Z[odluka->?Odluka].
```

### Razlog odluke
  ```prolog
   ?Z:zahtjev, ?Z[razlog->?Razlog].
```

### Cjelovita procjena kreditnog zahtjeva (sažeti prikaz)
  ```prolog
   ?Z:zahtjev,
   ?Z[
     ukupna_primanja_ukupno->?U,
     postojece_obveze_ukupno->?O,
     raspolozivo->?R,
     omjer_sposobnosti->?OM,
     dsti->?DSTI,
     sposobnost->?S,
     odluka->?Odl,
     razlog->?Raz
   ].
```

## Testiranje

## Testiranje sustava

Testiranje sustava provedeno je pomoću **shell skripte `test.sh`**, koja automatizira pokretanje **Flora-2 okruženja** i izvršavanje testnih upita definiranih u datoteci `tests.cmd`.

Datoteka `tests.cmd` sadrži skup reprezentativnih upita kojima se provjeravaju:
- izračun financijskih pokazatelja (ukupna primanja, obveze, raspoloživi iznos),
- izračun omjera sposobnosti i DSTI pokazatelja,
- detekcija poslovnih zabrana (OSR status, nedovoljan staž),
- konačna odluka o kreditnom zahtjevu i pripadajući razlozi.

Shell skripta `test.sh` služi kao **ulazna točka za testiranje**, pri čemu:
1. Pokreće XSB Prolog,
2. Učitava Flora-2 okruženje,
3. Učitava glavnu datoteku sustava (`main.flr`),
4. Automatski izvršava sve upite iz datoteke `tests.cmd`,
5. Ispisuje rezultate u terminal.

### Pokretanje testova

Prije prvog pokretanja potrebno je skripti dodijeliti prava izvođenja:

  ```bash
  chmod +x test.sh
```

Testovi se pokreću naredbom:
  ```bash
  ./test.sh
```

## Licenca

Ovaj projekt objavljen je pod licencom GNU General Public License v3.0 (GPL-3.0).
