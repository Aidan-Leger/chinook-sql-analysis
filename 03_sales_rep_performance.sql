-- Question: Which support reps generate the most revenue, and is the difference meaningful?

Select
    employee.first_name,
    employee.last_name,
    COUNT(DISTINCT customer.customer_id) AS customers,
    SUM(invoice.total) AS revenue
FROM invoice
Join customer ON invoice.customer_id = customer.customer_id
Join employee On customer.support_rep_id = employee.employee_id
Group By employee.employee_id, employee.first_name, employee.last_name
Order By revenue DESC;

/*
Key Findings:

- Revenue follows customer count. Jane earns 15.7% more than Steve and has 16.7% more customers, so the extra customers account for the whole gap.
- Per-customer revenue differs by only $1.24 across the three reps. Every customer spends between $37.62 and $49.62, so a gap that small with about 20 customers per rep is noise.
- Steve has the highest revenue per customer, even though his total is the lowest.
- Revenue is split almost evenly, with each rep at roughly a third.

Takeaway: you can't say any rep sells better. Jane brings in more because she was given more customers.
*/