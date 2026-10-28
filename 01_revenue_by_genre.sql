-- Question: Which genres generate the most revenue?


SELECT
    genre.name, SUM(invoice_line.unit_price * invoice_line.quantity) AS revenue
from invoice_line
join track on invoice_line.track_id = track.track_id
join genre on track.genre_id = genre.genre_id
group by genre.name
order by revenue DESC;

/*
Key findings (total revenue: $2,328.60)
- Rock dominates: $826.65, or 35.5% of all revenue - more than the bottom 20 genres combined ($616.89).
- The top 4 genres bring in 73.5% ($1,711.71): Rock, Latin ($382.14, 16.4%), Metal ($261.36, 11.2%), and Alternative & Punk ($241.56, 10.4%).
- Rock-related genres account for about 58% ($1,355.31): Rock, Metal, Alternative & Punk, Alternative, and Heavy Metal.
- Latin is a strong #2, earning more than Metal and Jazz combined - unusual for a general-catalog store.
- Video content is a minor slice: TV Shows, Drama, Sci Fi & Fantasy, Comedy, and Science Fiction total $220.89 (9.5%). TV Shows ($93.53) ranks 5th overall.
- Long tail: 11 genres each earn under $20, together about 6% of revenue. Rock And Roll is lowest at $5.94.
*/