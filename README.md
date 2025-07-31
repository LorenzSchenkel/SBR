# OTHR-CI – Corporate Design LaTeX-Templates for OTH Regensburg

Copyright (C) xxxx-2024 Michael Niemetz <michael.niemetz@oth-regensburg.de>
      2025 Michael Nietmetz <michael.niemetz@oth-regensburg.de>, Marei Peischl (peiTeX) <othr-ci@peitex.de>

othr-ci v0.01-dev (2025-05-22)

***************************************************************************

This material is subject to the LaTeX Project Public License version 1.3c
or later. See http://www.latex-project.org/lppl.txt for details.

***************************************************************************

## Informationen zu den LaTeX-Vorlagen der OTH Regensburg

### Für Nutzer*innen

Ziel dieses Projektes ist es, LaTeX-Nutzer*innen entsprechende Vorlagen an die Hand zu geben, um Dokumente im Corporate Design der OTH Regensburg zu erstellen.

Das Projekt nutzt ein l3build script und ermöglicht somit das Testen ohne notwendige Installation durch den Aufruf von

```
l3build doc
```

* `doc`: Enthält Dokumentation zu den Dokumentklassen und Stildateien
  (soweit verfügbar)
* `tex`: Enthält die TeX-Paketquellen
* `tests`: Testdokumente ohne nennenswerten Beispielcharakter
* `examples`: Enthält komplette Beispieldokumente
* `templates`: Enthält (weitgehend) leere Dokumente, die als Grundlage
  zur Erstellung von eigenen Dokumenten dienen können

### Für Entwickler*innen

Das git-Repository enthält verschiedene Standardzweige mit vordefinierter Bedeutung:

* `main`: Die Release-Version (Integration durch Integratoren, wenn Reviews und Tests abgeschlossen sind)
* `development`: Die Development-Version (Integration, wenn die
Features fertig zu sein scheinen und die Tests abgeschlossen sind)
* alles andere: Zweige zur Entwicklung einzelner Features bis zu deren Fertigstellung
