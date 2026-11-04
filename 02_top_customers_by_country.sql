-- Question: Who are the highest-spending customers and where is revenue concentrated geographically?

SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.country,
    SUM(invoice.total) AS spent
FROM invoice
join customer on invoice.customer_id = customer.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name, customer.country
ORDER BY spent DESC
LIMIT 10;

SELECT
    customer.country,
    SUM(invoice.total) as revenue,
    COUNT(DISTINCT customer.customer_id) AS customers,
SUM(invoice.total) / COUNT(DISTINCT customer.customer_id) AS avg_per_customer
FROM invoice
JOIN customer on invoice.customer_id = customer.customer_id
GROUP BY customer.country
ORDER BY revenue, avg_per_customer DESC

/*
Key Findings:

Headline: Revenue is driven by customer count, not customer value. Spending is
remarkably flat across the entire base ($37.62-$49.62, average $39.47), so
revenue share tracks customer share almost exactly in every market. Growth
depends on acquiring customers, not on upselling existing ones.

Geographic concentration:
- USA leads with $523.06, 22.5% of total revenue ($2,328.60), from 13 customers.
- USA and Canada together bring in 35.5% of revenue.
- The top 5 countries (USA, Canada, France, Brazil, Germany) hold 59% of customers
  (35 of 59) and produce 58.8% of revenue.
- 15 of 24 countries have only one customer, so most of the tail rests on single accounts.

Customer spending:
- The top 10 customers are 17% of the base and produce 19.4% of revenue — no small
  group of big spenders is carrying the business.
- Highest individual spender: Helena Holy at $49.62.
- The USA has 4 of the top 10 spenders, more than any other country.
- Among countries with 2+ customers, Czech Republic has the highest average per
  customer ($45.12), followed by the USA ($40.24).
*/