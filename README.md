# LAB-BileAcid-Stress-Response

<p align="center">
  <a href="https://www.r-project.org/">
    <img src="https://img.shields.io/badge/R-%3E%3D4.0-276DC3?style=for-the-badge&logo=R&logoColor=white"/>
  </a>
  <a href="https://creativecommons.org/licenses/by/4.0/">
    <img src="https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey?style=for-the-badge"/>
  </a>
  <a href="https://www.mdpi.com/2673-6284/13/3/29">
    <img src="https://img.shields.io/badge/DOI-10.3390%2Fbiotech13030029-28A745?style=for-the-badge"/>
  </a>
  <a href="https://www.ncbi.nlm.nih.gov/nuccore/OQ107531.1">
    <img src="https://img.shields.io/badge/GenBank-CB2%20OQ107531.1-E67E22?style=for-the-badge"/>
  </a>
  <a href="https://www.ncbi.nlm.nih.gov/nuccore/OQ107533.1">
    <img src="https://img.shields.io/badge/GenBank-CB12%20OQ107533.1-8E44AD?style=for-the-badge"/>
  </a>
</p>

<p align="center">
  <a href="https://creativecommons.org/licenses/by/4.0/">
    <img src="https://shields.io" alt="License"/>
  </a>
  <a href="https://www.r-project.org/">
    <img src="https://shields.io" alt="R Version"/>
  </a>
  <a href="https://www.mdpi.com/2673-6284/13/3/29">
    <img src="https://shields.io" alt="Publication"/>
  </a>
  <img src="https://shields.io" alt="Samples"/>
</p>

<p align="center">
  <b>GenBank:</b> 
  <a href="https://nih.gov">CB2 (OQ107531.1)</a> | 
  <a href="https://nih.gov">CB12 (OQ107533.1)</a>
</p>

## Descripción

Repositorio de reproducibilidad de los resultados presentados en la tesis de grado
**"Respuesta de bacterias lácticas al estrés por ácidos biliares y su potencial
modulación por oligosacáridos prebióticos"** y en la publicación científica asociada:

> **Moreno, C.N.; Gomez, J.N.; Taranto, M.P.; Ledesma, A.E.; Bustos, A.Y.**
> *Molecular Insight into the Response of Lactic Acid Bacteria to Bile Acids.*
> BioTech 2024, 13, 29. https://doi.org/10.3390/biotech13030029

Todos los gráficos fueron generados con R (originalmente producidos con OriginPro)
como parte del portfolio de bioinformática de la autora.

## Organismos de estudio

- *Lentilactobacillus parabuchneri* CB12
- *Lactiplantibacillus plantarum* CB2

Ambas cepas fueron aisladas de quesos artesanales de cabra y seleccionadas
por sus propiedades probióticas potenciales.

<p align="center">
  <img src="figures/biotech.png?raw=true" width="350" alt="Mecanismo de acción">
</p>

## Estructura del repositorio

```
LAB-BileAcid-Stress-Response/
│
├── README.md                    ← Presentación del proyecto
├── LICENSE                      ← MIT o CC BY 4.0 (paper)
│
├── data/                        ← Todos los datos crudos en CSV
│   ├── raw/                     ← Datos tal como los extrajiste de Origin
│   └── processed/               ← Si hubiera transformaciones previas
│
├── R/                           ← Scripts de R
│   ├── 00_setup.R               ← Instalación de paquetes
│   ├── 01_viability_conjugated.R
│   ├── 02_viability_free.R
│   ├── 03_prebiotics.R
│   ├── 04_zeta_potential.R
│   ├── 05_autoaggregation.R
│   └── 06_all_figures.R         ← Script maestro que corre todo
│
├── figures/                     ← Figuras generadas por R (PNG/SVG)
│
├── docs/                        ← Documentación adicional
│   └── methods_summary.md
│
└── publication/
    └── Moreno_et_al_2024_BioTech.pdf  ← Paper publicado
```

## Contenido del repositorio

| Carpeta | Contenido |
|---------|-----------|
| `data/raw/` | Datos extraídos de figuras originales (CSV) |
| `R/` | Scripts de R para cada figura |
| `figures/` | Figuras generadas (PNG, 300 dpi) |
| `docs/` | Resumen de métodos |
| `publication/` | Paper publicado (CC BY 4.0) |

## Reproducción

### Requisitos

- R ≥ 4.0
- RStudio (recomendado)

### Pasos

```r
# 1. Instalar dependencias
source("R/00_setup.R")

# 2. Generar todas las figuras
source("R/06_all_figures.R")
```

## Figuras reproducidas

| Script | Figura | Descripción |
|--------|--------|-------------|
| `01_viability_conjugated.R` | Figs. 20-21 | Sobrevida con GDCA, GCA, TDCA, TCA |
| `02_viability_free.R` | Figs. 22, 24 | Sobrevida con DCA y CA |
| `03_prebiotics.R` | Fig. 25 | Efecto de inulina HP y lactulosa |
| `04_zeta_potential.R` | Figs. 40-42 | Potencial zeta con TDCA, DCA, CA |
| `05_autoaggregation.R` | Fig. 45 | Autoagregación en el tiempo |

<p align="center">
  <img src="figures/04_zeta_potential.png?raw=true" width="850" alt="Potencial Z">
</p>

## Autora

**Caren Moreno**
Biotecnóloga | Docente | Estudiante de Maestría en Bioinformática (UNIR)

Centro de Investigación en Biofísica Aplicada y Alimentos (CIBAAL-UNSE-CONICET)
