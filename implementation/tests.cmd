[main].

?K:klijent[ime->?Ime].
moja_banka[prag_prosjecne_place->?P].

?K:klijent[ime->?Ime], ?K[ukupna_primanja->?U].
?K:klijent[ime->?Ime], ?K[dodatna_obveza_kartice_prekoracenje->?X].
?K:klijent[ime->?Ime], ?K[postojece_obveze_ukupno->?O].
?K:klijent[ime->?Ime], ?K[raspolozivo_za_ratu->?R].

?Z:zahtjev, ?Z[ukupna_primanja_ukupno->?U2].
?Z:zahtjev, ?Z[postojece_obveze_ukupno->?O2].
?Z:zahtjev, ?Z[raspolozivo->?R2].
?Z:zahtjev, ?Z[omjer_sposobnosti->?Om].
?Z:zahtjev, ?Z[dsti->?DSTI].
?Z:zahtjev, ?Z[sposobnost->?S].
?Z:zahtjev, ?Z[zabrana->?Zabr].
?Z:zahtjev, ?Z[odluka->?Odl].
?Z:zahtjev, ?Z[razlog->?Raz].

?Z:zahtjev,
?Z[
  ukupna_primanja_ukupno->?UU,
  postojece_obveze_ukupno->?OO,
  raspolozivo->?RR,
  omjer_sposobnosti->?OM,
  dsti->?DD,
  sposobnost->?SS,
  odluka->?OD,
  razlog->?RA
].

\halt
