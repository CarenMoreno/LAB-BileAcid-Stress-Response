# LAB-BileAcid-Stress-Response
R-based reproducibility of bile acid stress response in probiotic lactic acid bacteria (L. parabuchneri CB12 &amp; L. plantarum CB2). Viability, Raman spectroscopy, zeta potential &amp; autoaggregation analyses. Based on Moreno et al., BioTech 2024.

# LAB-BileAcid-Stress-Response

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![R version](https://img.shields.io/badge/R-%3E%3D4.0-blue)](https://www.r-project.org/)
[![Publication](https://img.shields.io/badge/DOI-10.3390%2Fbiotech13030029-green)](https://doi.org/10.3390/biotech13030029)

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

## Autora

**Caren Moreno**
Biotecnóloga | Docente | Estudiante de Maestría en Bioinformática (UNIR)

Centro de Investigación en Biofísica Aplicada y Alimentos (CIBAAL-UNSE-CONICET)
