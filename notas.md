# Notas del proyecto

Este archivo documenta decisiones, razonamiento y hallazgos a medida que avanza el análisis. La idea es registrar el "por qué" detrás de cada decisión, no solo el resultado final.

---

## 2026-08-04 — Exploración inicial

**Qué hice:**
- Exploré las tablas disponibles en `bigquery-public-data.stackoverflow` desde la consola de BigQuery (panel visual, sin SQL).
- Tablas encontradas: `badges`, `comments`, `post_history`, `post_links`, `posts_answers`, `posts_moderator_nomination`, `posts_orphaned_tag_wiki`, `posts_privilege_wiki`, `posts_questions`, `posts_tag_wiki`, `posts_tag_wiki_excerpt`, `posts_wiki_placeholder`, `stackoverflow_posts`, `tags`, `users`, `votes`.

**Decisión:** trabajar con `posts_questions` en vez de `stackoverflow_posts` (que parece ser una versión combinada de preguntas + respuestas).
**Por qué:** `posts_questions` es más específica para mi pregunta de negocio (tendencias por tecnología), y evita mezclar preguntas con respuestas en el conteo.

**Columnas relevantes identificadas:**
- `id`, `title`, `creation_date`, `tags`, `score`, `view_count`, `answer_count`

**Query de exploración inicial:** ver `queries/01_exploration_date_range.sql`

**Resultado:**
- Total de preguntas: 23,020,127
- Rango de fechas: 2008-07-31 a 2022-09-25

**Hallazgo importante:** los datos no llegan hasta la fecha actual (se detienen en septiembre 2022). Esto limita las conclusiones a tendencias históricas dentro de ese periodo, no al estado actual del mercado.

**Próximo paso:** revisar el formato de la columna `tags` para poder contar tecnologías individuales.

---

## 2026-08-04 (continuación) — Transformación de tags y primer conteo

**Qué hice:**
- Descubrí que la columna `tags` guarda varios tags juntos en un solo texto, separados por `|` (ej. `"javascript|concurrency|async-await"`), no por `;` como asumí inicialmente.
- Usé `SPLIT(tags, '|')` + `UNNEST()` para separar los tags en filas individuales — una fila por tecnología, en vez de una fila por pregunta con todos los tags mezclados.
- Query completa documentada en `queries/02_split_and_count_tags.sql`.

**Primer conteo (total histórico 2008-2022):**
Top tecnologías por volumen total de preguntas: javascript (2.4M), python (2.0M), java (1.9M), c# (1.6M), php (1.4M), android (1.4M), html (1.1M).

**Decisión:** para el análisis de tendencia por año, filtrar a un grupo específico de 6 lenguajes de programación (`python`, `javascript`, `java`, `php`, `c#`, `r`) en vez de traer todos los tags.
**Por qué:** traer todos los tags para todos los años genera cientos de miles de filas, difícil de leer e ineficiente de procesar. Filtrar a una selección con una narrativa clara (lenguajes de programación) hace el análisis más legible y con mejor storytelling.

**Query con `EXTRACT(YEAR FROM creation_date)` + filtro `WHERE tag IN (...)`:** agrupé por año y tag para ver la evolución en el tiempo.

**Nota sobre 2008 y 2022:** 2008 solo tiene ~5 meses de datos (Stack Overflow lanzó el 31 de julio de 2008), y 2022 está incompleto (datos hasta septiembre). Ambos años deben interpretarse con cuidado al comparar tendencias — no son años completos.

**Guardado de resultados:** creé mi propio dataset `stackoverflow_analysis` en BigQuery y guardé el resultado como tabla `tech_trends_by_year` (columnas: `year`, `tag`, `question_count`), para conectarlo a Looker Studio sin re-consultar la tabla pública cada vez.

**Visualización:** conecté `tech_trends_by_year` a Looker Studio y armé un gráfico de series temporales (una línea por lenguaje).

**Hallazgos del gráfico:**
- **Python** arranca bajo pero desde 2016-2017 supera a los demás lenguajes y termina como líder claro hacia 2022 — coincide con el auge de ciencia de datos/ML en ese periodo.
- **JavaScript** domina fuerte entre 2014-2020, con una caída notable después de 2020.
- **PHP** y **C#** muestran declive sostenido desde 2014-2016 en adelante.
- **R** se mantiene consistentemente bajo comparado con los demás lenguajes.
- Todos los lenguajes caen hacia 2022, pero esto se explica principalmente porque 2022 tiene datos incompletos (hasta septiembre), no necesariamente por una caída real de interés.

**Próximo paso:** pulir el gráfico (títulos, formato) y/o explorar otra dimensión (por ejemplo, frameworks en vez de lenguajes, o `view_count`/`score` en vez de solo volumen de preguntas).

---

## Plantilla para próximas entradas

```
## AAAA-MM-DD — [Título breve]

**Qué hice:**
-

**Decisión:**
**Por qué:**

**Query:**
```sql

```

**Resultado:**

**Próximo paso:**
```
