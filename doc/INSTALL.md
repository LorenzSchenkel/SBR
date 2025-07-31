
Installationsanweisungen
========================

Zur Installation der LaTeX-Stilvorlagen nach dem CI-Design der OTH Regensburg ist der in diesem Archiv bereitgestellte texmf-Baum ("texmf_OTHR") in die lokale TeX-Installation einzubinden und die Dateinamendatenbank zu aktualisieren. Je nach verwendeter Distribution sind die konkreten Arbeitsabläufe leicht unterschiedlich und im Folgenden beschrieben:

# MikTex (Windows)

* Der Inhalt des Pakets ist (am Besten komplett) an eine geeignete Stelle zu kopieren. (Im Folgenden wird C:/OTHRtex verwendet, natürlich ist eine für den jeweiligen Rechner geeignete Stelle zu wählen). Das betreffende Verzeichnis sollte jetzt z.B. Unterverzeichnisse wie "doc" oder "texmf_OTHR" enthalten.

Wichtig: Das gewählte Verzeichnis darf nicht innerhalb des "texmf"-Verzeichnisses der vorhandenen Miktex-Installation liegen. 

* In der MiKTeX-eigenen Setup-Anwendung (am Besten verwendet man stets die admin-Variante, wenn möglich) ist jetzt zusätzlich zu den bisher eventuell bereits registrierten texmf-Verzeichnissen (trees) zusätzlich der neu gelieferte texmf-Baum <...hier steht der gewählte Ort, z.B. C:/OTHRtex>/texmf_OTHR einzutragen.
  * Seite Einstellungen wählen
  * Reiter "Verzeichnisse" auswählen
  * Das texmf_OTHR-Verzeichnis <...hier steht der gewählte Installationsort, z.B. C:/OTHRtex>/texmf_OTHR hinzufügen
  
* Nun ist noch die Dateinamendatenbank (FNDB) zu aktualisieren, da sonst die neuen Dateien nicht gefunden werden. Dazu im Menü "Aufgaben" die Option "Dateinamendatenbank aktualisieren" auswählen

* Fertig! Zum Test der Installation kann nun einfach eine der mitgelieferten Test- oder Beispieldateien *in ein neues Verzeichnis kopiert* und dort übersetzt werden. Wie üblich müssen hierbei eventuell noch einige benötigte Pakete nachinstalliert werden.

# TexLive (z.B. Linux, aber auch Windows und andere Systeme)

* Der Inhalt des Pakets ist (am Besten komplett) an eine geeignete Stelle zu kopieren. (Im folgenden /usr/local/share/OTHRtex). Das betreffende Verzeichnis sollte jetzt z.B. Unterverzeichnisse wie "doc" oder "OTHR_texmf" enthalten.

* In der TexLife-Konfiguration ist jetzt zusätzlich zu den bisher eventuell bereits registrierten texmf-Verzeichnissen (trees) zusätzlich der neu gelieferte texmf-Baum (beim im Beispiel gewählten Installationsort: /usr/local/share/OTHRtex/OTHR_texmf) einzutragen. Ort und Inhalt der Konfiguration kann von System zu System variieren. Zum Beispiel könnte in der Datei /etc/texmf/web2c/texmf.cnf die Zeile

TEXMFLOCAL = /usr/local/share/texmf

in die Zeile

TEXMFLOCAL = {/usr/local/share/texmf,/usr/local/share/texmf_OTHR}

geändert werden.

* Nun sind die Dateirechte zu kontrollieren. Zweckmäßigerweise sollten die Rechte auf den selben Wert wie in anderen texmf-Verzeichnissen des Systems gesetzt werden. 

* Nun ist noch die Dateinamendatenbank über den Aufruf von texhash zu aktualisieren.

* Fertig! Zum Test der Installation kann nun einfach eine der mitgelieferten Test- oder Beispieldateien *in ein neues Verzeichnis kopiert* und dort übersetzt werden. Wie üblich müssen hierbei eventuell noch einige benötigte Pakete nachinstalliert werden.

# Overleaf

Overleaf (www.overleaf.com) bietet einen Online-Editor mit Compiler. 

Das im OTH-Paket für Overleaf enthaltene(!) zip-File kann direkt als zip-File in Overleaf hochgeladen werden. 

Die Compilierung der darin enthaltenen Beispieldatei oder auch anderer Beispieldateien, die im Paket aber außerhalb des overleaf-Zip-Files enthalten sind (einzeln hochladen!) sollte dort umgehend lauffähig sein.



