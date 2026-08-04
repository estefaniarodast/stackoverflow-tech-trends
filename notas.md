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

**Query de exploración inicial:**
```sql
SELECT 
  COUNT(*) as total_preguntas,
  MIN(creation_date) as fecha_mas_antigua,
  MAX(creation_date) as fecha_mas_reciente
FROM `bigquery-public-data.stackoverflow.posts_questions`;
```

**Resultado:**
- Total de preguntas: 23,020,127
- Rango de fechas: 2008-07-31 a 2022-09-25

**Hallazgo importante:** los datos no llegan hasta la fecha actual (se detienen en septiembre 2022). Esto limita las conclusiones a tendencias históricas dentro de ese periodo, no al estado actual del mercado.

**Próximo paso:** revisar el formato de la columna `tags` (varios tags por fila, separados por `;`) para decidir cómo transformarla y poder contar tecnologías individuales.

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
