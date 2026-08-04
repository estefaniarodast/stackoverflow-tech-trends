# Tendencias Tecnológicas en Stack Overflow (2008–2022)

## 📌 Objetivo del proyecto

Analizar preguntas publicadas en Stack Overflow entre 2008 y 2022 para identificar qué tecnologías (lenguajes, frameworks, herramientas) mostraron tendencias de crecimiento o decrecimiento en popularidad a lo largo del tiempo, usando SQL en Google BigQuery.

**Pregunta de negocio principal:**
> ¿Qué tecnologías crecieron o decayeron en popularidad entre 2008 y 2022, según el volumen de preguntas publicadas?

## 🗂️ Fuente de datos

- **Dataset:** [`bigquery-public-data.stackoverflow`](https://console.cloud.google.com/marketplace/product/stack-exchange/stack-overflow) (dataset público de Google BigQuery)
- **Tabla principal:** `posts_questions`
- **Tamaño:** ~23 millones de preguntas
- **Rango de fechas disponible:** 31 de julio de 2008 – 25 de septiembre de 2022

⚠️ **Limitación importante:** los datos no llegan hasta la fecha actual. Las conclusiones de este análisis describen tendencias históricas dentro de ese rango, no el estado actual del mercado tecnológico.

## 🛠️ Herramientas utilizadas

- Google BigQuery (SQL) — exploración, limpieza y transformación de datos
- Looker Studio — visualización (pendiente)
- GitHub — control de versiones y documentación del proceso

## 📋 Proceso

### 1. Exploración inicial
- Se identificaron las tablas disponibles en el dataset `stackoverflow` mediante la consola de BigQuery.
- Se seleccionó `posts_questions` como tabla principal por contener las columnas clave: `tags`, `creation_date`, `score`, `view_count`.
- Se determinó el tamaño total de la tabla y el rango de fechas disponible antes de iniciar cualquier análisis, para evitar conclusiones erróneas sobre "tendencias actuales".

### 2. Limpieza y transformación *(en progreso)*
- La columna `tags` viene como texto plano con múltiples tags separados por `;` (ej. `"python;pandas;dataframe"`). Se requiere transformarla para poder contar tecnologías individuales.
- Se documentarán aquí las decisiones sobre nulos, valores atípicos (`score` muy negativo, `view_count` en 0), etc.

### 3. Análisis *(pendiente)*
- Conteo de preguntas por tecnología a lo largo del tiempo.
- Identificación de tecnologías en crecimiento vs. declive.

### 4. Visualización *(pendiente)*
- Dashboard en Looker Studio con los hallazgos principales.

## 📁 Estructura del repositorio

```
stackoverflow-tech-trends/
├── README.md          ← este archivo
├── queries/            ← consultas SQL usadas, en orden cronológico
└── notas.md            ← decisiones tomadas, hallazgos y cosas raras encontradas en el camino
```

## 🔍 Hallazgos

*(Se irán agregando a medida que avance el análisis)*

## 🚧 Estado del proyecto

🟡 En progreso — exploración de datos completada, iniciando limpieza y transformación.
