# Chinook SQL Analysis (PostgreSQL)

SQL analysis of the Chinook digital media store database, answering three business
questions about revenue concentration, customer value, and sales rep performance.

## Dataset

[Chinook](https://github.com/lerocha/chinook-database) — an open sample database
representing a digital media store. 11 related tables covering artists, albums,
tracks, customers, invoices, and employees. Loaded into PostgreSQL 18 from the
`Chinook_PostgreSql.sql` script; the data file is not included in this repo.

Total revenue across the dataset: **$2,328.60** from **59 customers** in **24 countries**.

## Questions and Findings

### 1. Which genres generate the most revenue?
`01_revenue_by_genre.sql` — joins `invoice_line` → `track` → `genre`

- Rock dominates at **$826.65 (35.5% of all revenue)** — more than the bottom 20
  genres combined.
- The top 4 genres produce **73.5%** of revenue: Rock, Latin ($382.14), Metal
  ($261.36), and Alternative & Punk ($241.56).
- Rock-related genres together account for roughly **58%**, pointing to a catalog
  and customer base centered on rock.
- Long tail: 11 genres each earn under $20, including names you would expect to
  sell — Pop ($27.72) and Hip Hop ($16.83) sit near the bottom.

### 2. Who are the top customers, and where is revenue concentrated?
`02_top_customers_by_country.sql` — joins `invoice` → `customer`

- **Revenue is driven by customer count, not customer value.** Spending is flat
  across the entire base ($37.62–$49.62, average $39.47), so revenue share tracks
  customer share almost exactly in every market.
- USA leads with $523.06 (22.5% of revenue) from 13 customers; USA and Canada
  together produce 35.5%.
- The top 5 countries hold 59% of customers (35 of 59) and produce 58.8% of revenue.
- The top 10 customers are 17% of the base and produce 19.4% of revenue — no small
  group of big spenders is carrying the business.
- 15 of 24 countries have only one customer, so most of the tail rests on single accounts.

### 3. Do sales reps differ in performance?
`03_sales_rep_performance.sql` — joins `invoice` → `customer` → `employee`

- **Apparent performance gaps are an artifact of customer assignment.** The leading
  rep earns 15.7% more than the lowest and has 16.7% more customers — the extra
  accounts explain the entire gap.
- Per-customer revenue differs by only **$1.24** across the three reps, which is
  noise at roughly 20 customers each.
- Revenue splits almost evenly, each rep at roughly a third.

### Across all three
Two independent angles — geography and rep assignment — land on the same conclusion:
this store's revenue scales with the number of customers, not with how much any
customer or segment spends. Growth means acquisition, not upselling.

## SQL Concepts Used

- Multi-table `JOIN` chains (two and three hops)
- `GROUP BY` with aggregate functions (`SUM`, `COUNT`, `COUNT(DISTINCT ...)`)
- Derived metrics (revenue per customer) for fair comparison across unequal group sizes
- `ORDER BY` / `LIMIT` for top-N analysis
- Column aliasing and table prefixes across joined tables

## Tools

PostgreSQL 18 · VS Code with the SQLTools extension · pgAdmin 4

## Repo Structure

```
01_revenue_by_genre.sql          Revenue by genre, with findings
02_top_customers_by_country.sql  Top customers and revenue by country, with findings
03_sales_rep_performance.sql     Sales rep revenue and per-customer comparison
README.md
```

Each `.sql` file opens with the business question it answers and closes with the
findings from its results.