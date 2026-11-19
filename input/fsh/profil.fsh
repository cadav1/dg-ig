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
// Schritt 5: Euer Profil
//
// Die Kopfzeilen sind schon ausgefüllt. Für jede Anforderung aus dem
// Aufgabenblatt steht unten eine auskommentierte Zeile mit dem Element.
// Entfernt die // und ersetzt TODO_Regel durch die Regel, die ihr
// gewählt habt. Eine Anforderung kann auch mehrere Zeilen brauchen.
//
// Wichtig: Hier stehen Regeln für alle Allergien, z. B. "criticality MS".
// Einen Wert setzt ihr im Profil nur, wenn er für jede Allergie immer
// gilt (Wert fixieren). Werte, die nur für eine bestimmte Patientin
// gelten, z. B. criticality #high, gehören ins Beispiel (beispiele.fsh).
//
// Regeltypen:
//   Kardinalität   * element 1..1
//   Must Support   * element MS
//   Binding        * element from $ValueSet (required)
//   Typ            * element[x] only dateTime
//                  * element only Reference(CHCorePractitioner)
//   Wert           * element = #code
//
// Nach jeder Änderung lokal prüfen:  sushi build .
// =====================================================================

Profile: DgMedicationAllergy
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy
Title: "DG Arzneimittelallergie"
Description: "Arzneimittelallergie, wie sie in der Hausarztpraxis erfasst und auf der Notfallstation gelesen wird."

// Anforderung 1: nur Allergien gegen Arzneimittel
// Das Profil gilt immer nur für Arzneimittel. Darum genau eine Kategorie,
// und die ist fix "medication".
* category 1..1 MS
* category = #medication

// Anforderung 2: klinischer Status
// "muss immer angegeben sein" -> Pflichtfeld (1..1) und Must Support.
* clinicalStatus 1..1 MS

// Anforderung 3: Codes aus der Schweizer Allergieliste ($ch-allergy-vs)
// Ein Code ist Pflicht. Binding "extensible": Gibt es einen passenden Code
// in der Liste, muss dieser verwendet werden. Fehlt einer, darf ein anderer
// Code oder nur Text (code.text) erfasst werden. CH Core hat "preferred",
// extensible ist strenger und damit erlaubt.
* code 1..1 MS
* code from $ch-allergy-vs (extensible)

// Anforderung 4: Kritikalität (wie gefährlich die Allergie ist)
// Pflicht und Must Support. Ist die Gefahr unbekannt, gibt es den Code
// #unable-to-assess, darum ist 1..1 immer erfüllbar.
* criticality 1..1 MS

// Anforderung 5: Beginn der Allergie
// Entweder ein Datum (dateTime) oder ein ungefähres Alter (Age).
// Period, Range und string sind nicht erlaubt.
* onset[x] MS
* onset[x] only dateTime or Age

// Anforderung 6: wer die Allergie erfasst hat
// Pflicht, und nur eine Ärztin oder ein Arzt (als Person oder in der
// Rolle in einer Praxis). Patient und RelatedPerson aus CH Core sind
// damit ausgeschlossen.
* recorder 1..1 MS
* recorder only Reference(CHCorePractitioner or CHCorePractitionerRole)

// Anforderung 7: Reaktionen (die Symptome einer Reaktion stehen in reaction.manifestation)
// Nicht Pflicht (0..*), aber Systeme müssen Reaktionen verarbeiten können.
// Symptome kommen aus der Schweizer Liste, andere Codes sind erlaubt,
// wenn kein passender existiert (extensible, strenger als CH Core).
* reaction MS
* reaction.manifestation MS
* reaction.manifestation from $ch-allergy-manifestation-vs (extensible)

// Invariante (steht schon in invarianten.fsh):
// Eine bestätigte Allergie muss mindestens eine Reaktion dokumentieren.
* obeys dg-allergy-1
