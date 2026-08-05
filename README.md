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

## 📊 Visualization

[View interactive dashboard on Looker Studio](https://datastudio.google.com/reporting/dc7fdc65-f110-4dcb-80f3-9fc9140db444)

The dashboard shows question volume per year for 6 major programming languages (Python, JavaScript, Java, PHP, C#, R) between 2008 and 2022.

## 🔍 Findings

Analysis of 6 major programming languages (Python, JavaScript, Java, PHP, C#, R) from 2008–2022, based on question volume per year:

- **Python** started low but overtook every other language around 2016–2017, ending as the clear leader by 2022 — consistent with the rise of data science and ML during that period.
- **JavaScript** dominated between 2014–2020, with a noticeable decline after 2020.
- **PHP** and **C#** show a sustained decline starting around 2014–2016.
- **R** remained consistently lower in volume compared to the other languages throughout the period.
- All languages show a drop toward 2022, mainly because that year's data is incomplete (only through September), not necessarily a real decline in interest.

⚠️ 2008 and 2022 should be interpreted with caution: 2008 only has ~5 months of data (Stack Overflow launched July 31, 2008), and 2022 is incomplete.

## 💡 Conclusion

This project walked through a full, small-scale data analysis workflow: exploring an unfamiliar dataset, transforming messy multi-value columns into an analyzable format, aggregating data to answer a specific business question, and communicating the result through a dashboard.

**Key takeaway:** Python's rise and PHP/C#'s decline in question volume align with broader, well-known shifts in the developer ecosystem (the growth of data science/ML and the relative decline of some earlier web-era languages), which gives some confidence that question volume on Stack Overflow is a reasonable, if imperfect, proxy for technology popularity.

**If I extended this project, I would:**
- Compare frameworks (React, Angular, Vue, Django, Flask) instead of languages, for a more granular view of the ecosystem
- Weight trends by `view_count` or `score` instead of raw question volume, to account for question quality/engagement
- Cross-reference with an external source (e.g. Google Trends, GitHub Octoverse) to validate whether Stack Overflow volume actually tracks real-world adoption

## 🚧 Project Status

🟢 Completed — first portfolio project. See [Project 2](#) *(link to be added)* for the next project in this series, focused on product/user behavior analysis.
