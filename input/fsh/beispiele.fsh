/* ---------------------------------------------------------------------------
 * --  _____       _____ _______                                             -
 * -- |_   _|     |_   _|__   __|                                            -
 * --   | |  _ __   | |    | |       Institute of Computer Science           -
 * --   | | | '_ \  | |    | |       Zurich University of                    -
 * --  _| |_| | | |_| |_   | |       Applied Sciences                        -
 * -- |_____|_| |_|_____|  |_|       8401 Winterthur, Switzerland            -
 * ---------------------------------------------------------------------------
 */

// =====================================================================
// Schritt 6: Beispiel
//
// Erstellt ein gültiges Beispiel zu eurem Profil. Patientin, Ärztin und
// Praxis gibt es schon (basis-beispiele.fsh). Entfernt die // und ersetzt
// die TODOs. Das Beispiel muss alle Regeln aus eurem Profil erfüllen,
// auch die Invariante: Ist die Allergie bestätigt (confirmed), braucht
// sie eine Reaktion.
// =====================================================================

// Beispiel 1: bestätigte Penicillinallergie mit Reaktion (Nesselsucht).
// Weil sie bestätigt ist, braucht sie wegen dg-allergy-1 eine Reaktion.
Instance: PenicillinAllergieAnna
InstanceOf: DgMedicationAllergy
Usage: #example
Title: "Bestätigte Penicillinallergie von Anna Muster"
Description: "Bestätigte Penicillinallergie mit hoher Kritikalität und Nesselsucht als Reaktion, Beginn als Datum erfasst."
* patient = Reference(AnnaMuster)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#confirmed
* code = $sct#91936005 "Allergy to penicillin (finding)"
* criticality = #high
* onsetDateTime = "2015-06-03"
* recorder = Reference(DrSaraKeller)
* reaction.manifestation = $sct#126485001 "Urticaria (disorder)"

// Beispiel 2: unbestätigter Verdacht, Beginn nur als ungefähres Alter bekannt.
// Nicht bestätigt, darum ist keine Reaktion nötig.
Instance: BenzylpenicillinVerdachtAnna
InstanceOf: DgMedicationAllergy
Usage: #example
Title: "Verdacht auf Benzylpenicillinallergie von Anna Muster"
Description: "Unbestätigter Verdacht, Kritikalität nicht beurteilbar, Beginn nur als ungefähres Alter (30 Jahre) bekannt, erfasst von der Ärztin in ihrer Rolle in der Praxis."
* patient = Reference(AnnaMuster)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#unconfirmed
* code = $sct#294499007 "Allergy to benzylpenicillin (finding)"
* criticality = #unable-to-assess
* onsetAge = 30 'a' "Jahre"
* recorder = Reference(DrSaraKellerPraxisAmPark)
