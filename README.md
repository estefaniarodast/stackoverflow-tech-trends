# Stack Overflow Technology Trends (2008–2022)

## 📌 Project Goal

Analyze questions posted on Stack Overflow between 2008 and 2022 to identify which technologies (languages, frameworks, tools) showed growth or decline trends in popularity over time, using SQL in Google BigQuery.

**Main business question:**
> Which technologies grew or declined in popularity between 2008 and 2022, based on the volume of questions posted?

## 🗂️ Data Source

- **Dataset:** [`bigquery-public-data.stackoverflow`](https://console.cloud.google.com/marketplace/product/stack-exchange/stack-overflow) (BigQuery public dataset)
- **Main table:** `posts_questions`
- **Size:** ~23 million questions
- **Available date range:** July 31, 2008 – September 25, 2022

⚠️ **Important limitation:** the data does not extend to the present day. Conclusions from this analysis describe historical trends within that range, not the current state of the tech market.

## 🛠️ Tools Used

- Google BigQuery (SQL) — exploration, cleaning, and data transformation
- Looker Studio — visualization (pending)
- GitHub — version control and process documentation

## 📋 Process

### 1. Initial Exploration
- Identified the tables available in the `stackoverflow` dataset using the BigQuery console.
- Selected `posts_questions` as the main table for containing the key columns: `tags`, `creation_date`, `score`, `view_count`.
- Determined the total table size and available date range before starting any analysis, to avoid drawing conclusions about "current" trends.

### 2. Cleaning and Transformation *(in progress)*
- The `tags` column comes as plain text with multiple tags separated by `;` (e.g. `"python;pandas;dataframe"`). It needs to be transformed to count individual technologies.
- Decisions about nulls, outliers (very negative `score`, `view_count` of 0), etc. will be documented here.

### 3. Analysis *(pending)*
- Count of questions per technology over time.
- Identification of growing vs. declining technologies.

### 4. Visualization *(pending)*
- Looker Studio dashboard with key findings.

## 📁 Repository Structure

```
stackoverflow-tech-trends/
├── README.md          ← this file
├── queries/            ← SQL queries used, in chronological order
└── notas.md            ← decisions made, findings, and interesting things found along the way
```

## 🔍 Findings

Analysis of 6 major programming languages (Python, JavaScript, Java, PHP, C#, R) from 2008–2022, based on question volume per year:

- **Python** started low but overtook every other language around 2016–2017, ending as the clear leader by 2022 — consistent with the rise of data science and ML during that period.
- **JavaScript** dominated between 2014–2020, with a noticeable decline after 2020.
- **PHP** and **C#** show a sustained decline starting around 2014–2016.
- **R** remained consistently lower in volume compared to the other languages throughout the period.
- All languages show a drop toward 2022, mainly because that year's data is incomplete (only through September), not necessarily a real decline in interest.

⚠️ 2008 and 2022 should be interpreted with caution: 2008 only has ~5 months of data (Stack Overflow launched July 31, 2008), and 2022 is incomplete.

## 🚧 Project Status

🟡 In progress — tag transformation, yearly trend analysis, and first Looker Studio visualization completed. Next: refine visualization and explore additional dimensions (frameworks, view_count/score).
