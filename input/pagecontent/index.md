### Use Case

Eine Hausarztpraxis erfasst Arzneimittelallergien strukturiert und mit Schweizer Codes, damit eine Notfallstation sie zuverlässig auswerten und gefährliche Medikamentengaben vermeiden kann.

### Scope

Abgedeckt:

* Allergien und Unverträglichkeiten gegen **Arzneimittel** (`category` ist fix `medication`)
* Codierung mit der Schweizer Allergieliste aus CH Term (Binding *extensible*, damit auch ohne passenden Code etwas erfasst werden kann)
* Pflichtangaben für die Notfallstation: klinischer Status, Allergie-Code, Kritikalität und erfassende Ärztin bzw. erfassender Arzt
* Beginn als Datum oder als ungefähres Alter
* Reaktionen mit Symptomen, falls bekannt; eine bestätigte Allergie muss mindestens eine Reaktion dokumentieren (Invariante `dg-allergy-1`)

Bewusst nicht abgedeckt:

* Allergien gegen Nahrungsmittel, Umweltstoffe oder biologische Substanzen
* Erfassung durch die Patientin selbst oder durch Angehörige
* Austauschformate wie Dokumente oder Bundles, Suchparameter und CapabilityStatements

### Artefakte

* [DG Arzneimittelallergie](StructureDefinition-dg-medication-allergy.html): Profil auf CH Core AllergyIntolerance, das die Anforderungen der Notfallstation an eine Arzneimittelallergie festlegt.
* [Bestätigte Penicillinallergie von Anna Muster](AllergyIntolerance-PenicillinAllergieAnna.html): Beispiel einer bestätigten Allergie mit hoher Kritikalität, Beginn als Datum und Nesselsucht als Reaktion.
* [Verdacht auf Benzylpenicillinallergie von Anna Muster](AllergyIntolerance-BenzylpenicillinVerdachtAnna.html): Beispiel eines unbestätigten Verdachts, bei dem die Kritikalität nicht beurteilbar ist und der Beginn nur als ungefähres Alter bekannt ist.

### Abhängigkeiten

Dieses IG baut auf [CH Core 6.0.0](https://fhir.ch/ig/ch-core/6.0.0/) auf.

### Autorin oder Autor

VORNAME NACHNAME

<p style="font-size:smaller">Erstellt im Lab des Moduls Data Standards in Healthcare, ZHAW, HS26. Kein offizieller Standard.</p>
