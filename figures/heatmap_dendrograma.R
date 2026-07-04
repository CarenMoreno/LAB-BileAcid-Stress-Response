# ===========================================================================
# Heatmap con dendrogramas — Ácidos biliares conjugados
# Tesis Caren N. Moreno
# Correr bloque por bloque en RStudio
# ===========================================================================

library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(pheatmap)   # instalar si no tenés: install.packages("pheatmap")

DATA_DIR <- "C:/Users/Usuario/Documents/Tesis Biotecnología 2023/Archivos de datos"

# ---------------------------------------------------------------------------
# BLOQUE 1: función de carga
# ---------------------------------------------------------------------------

leer_ab <- function(archivo, prefijo_ab) {
  ruta   <- file.path(DATA_DIR, paste0(archivo, ".xlsx"))
  df_raw <- read_xlsx(ruta)
  colnames(df_raw)[1] <- "replica_id"

  df_raw %>%
    mutate(cepa = ifelse(grepl("CB12", replica_id), "CB12", "CB2")) %>%
    pivot_longer(
      cols      = -c(replica_id, cepa),
      names_to  = "conc_label",
      values_to = "supervivencia"
    ) %>%
    mutate(
      supervivencia = as.numeric(supervivencia),
      concentracion = as.numeric(
        gsub(",", ".", gsub(paste0(prefijo_ab, "\\s*"), "", conc_label))
      )
    ) %>%
    filter(!is.na(concentracion)) %>%
    group_by(AB = prefijo_ab, cepa, concentracion) %>%
    summarise(media = mean(supervivencia, na.rm = TRUE), .groups = "drop")
}

# ---------------------------------------------------------------------------
# BLOQUE 2: cargar y construir matriz para pheatmap
# ---------------------------------------------------------------------------

df_all <- bind_rows(
  leer_ab("fig1_GDCA_survival", "AGDC"),
  leer_ab("fig2_GCA_survival",  "AGC"),
  leer_ab("fig3_TDCA_survival", "ATDC"),
  leer_ab("fig4_TCA_survival",  "ATC")
)

# Construir matriz: filas = Cepa_AB, columnas = concentración
df_wide <- df_all %>%
  mutate(
    cepa_ab = paste0(cepa, "_", AB),
    conc_label = paste0(concentracion, " mM")
  ) %>%
  select(cepa_ab, conc_label, media) %>%
  pivot_wider(names_from = conc_label, values_from = media)

# Convertir a matriz numérica
mat <- as.matrix(df_wide[, -1])
rownames(mat) <- df_wide$cepa_ab

# Reordenar columnas: 0, 2.5, 5, 7.5 mM
mat <- mat[, c("0 mM", "2.5 mM", "5 mM", "7.5 mM")]

# Reordenar filas: CB12 primero, después CB2, mismo orden de AB
orden_filas <- c("CB12_AGDC", "CB12_AGC", "CB12_ATDC", "CB12_ATC",
                 "CB2_AGDC",  "CB2_AGC",  "CB2_ATDC",  "CB2_ATC")
mat <- mat[orden_filas, ]

# Etiquetas más limpias para las filas
rownames(mat) <- c(
  "CB12 — AGDC", "CB12 — AGC", "CB12 — ATDC", "CB12 — ATC",
  "CB2 — AGDC",  "CB2 — AGC",  "CB2 — ATDC",  "CB2 — ATC"
)

# Etiquetas columnas con coma decimal
colnames(mat) <- c("0 mM", "2,5 mM", "5 mM", "7,5 mM")

print(mat)

# ---------------------------------------------------------------------------
# BLOQUE 3: anotación lateral para separar cepas
# ---------------------------------------------------------------------------

anotacion_filas <- data.frame(
  Cepa = c(rep("L. parabuchneri CB12", 4), rep("Lp. plantarum CB2", 4)),
  row.names = rownames(mat)
)

colores_anotacion <- list(
  Cepa = c(
    "L. parabuchneri CB12" = "#EAD2FA",   # lavanda
    "Lp. plantarum CB2"    = "#F8B195"    # salmón
  )
)

# ---------------------------------------------------------------------------
# BLOQUE 4: paleta de colores — violeta (alta supervivencia) a salmón claro (baja)
# ---------------------------------------------------------------------------

paleta_heatmap <- colorRampPalette(c(
  "#F8C8B8",    # salmón muy claro (baja supervivencia)
  "#FDE8E0",    # casi blanco-salmón
  "#F5EFFA",    # blanco-lavanda
  "#D4B8E8",    # lavanda media
  "#9069C0",    # violeta medio
  "#6A3FA0"     # violeta oscuro (alta supervivencia)
))(100)

# ---------------------------------------------------------------------------
# BLOQUE 5: graficar con pheatmap
# ---------------------------------------------------------------------------

pheatmap(
  mat,
  color             = paleta_heatmap,
  cluster_rows      = TRUE,     # dendrograma en filas
  cluster_cols      = TRUE,     # dendrograma en columnas
  clustering_method = "complete",
  annotation_row    = anotacion_filas,
  annotation_colors = colores_anotacion,
  display_numbers   = TRUE,
  number_format     = "%.1f",
  number_color      = "black",
  fontsize_number   = 9,
  fontsize_row      = 10,
  fontsize_col      = 11,
  fontsize          = 10,
  border_color      = "white",
  cellwidth         = 70,
  cellheight        = 40,
  main              = "Supervivencia de LAB ante ácidos biliares conjugados",
  angle_col         = 0,         # etiquetas columna horizontales
  legend_breaks     = c(0, 25, 50, 75, 100),
  legend_labels     = c("0%", "25%", "50%", "75%", "100%"),
  gaps_row          = 4,         # línea separadora entre CB12 y CB2
  treeheight_row    = 50,        # altura del dendrograma de filas
  treeheight_col    = 30,        # altura del dendrograma de columnas
  annotation_legend = TRUE,
  filename          = NA         # NA = mostrar en pantalla, no guardar aún
)

# ---------------------------------------------------------------------------
# BLOQUE 6: guardar — corré solo cuando el gráfico te guste
# ---------------------------------------------------------------------------

pheatmap(
  mat,
  color             = paleta_heatmap,
  cluster_rows      = TRUE,
  cluster_cols      = TRUE,
  clustering_method = "complete",
  annotation_row    = anotacion_filas,
  annotation_colors = colores_anotacion,
  display_numbers   = TRUE,
  number_format     = "%.1f",
  number_color      = "black",
  fontsize_number   = 9,
  fontsize_row      = 10,
  fontsize_col      = 11,
  fontsize          = 10,
  border_color      = "white",
  cellwidth         = 70,
  cellheight        = 40,
  main              = "Supervivencia de LAB ante ácidos biliares conjugados",
  angle_col         = 0,
  legend_breaks     = c(0, 25, 50, 75, 100),
  legend_labels     = c("0%", "25%", "50%", "75%", "100%"),
  gaps_row          = 4,
  treeheight_row    = 50,
  treeheight_col    = 30,
  annotation_legend = TRUE,
  filename          = "heatmap_dendrograma_conjugados.png",
  width             = 10,
  height            = 7
)

cat("Guardado en:", getwd(), "\n")
