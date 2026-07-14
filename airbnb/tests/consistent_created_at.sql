SELECT
    r.listing_id AS listing_id,
    r.review_date AS review_date,
    l.created_at AS listing_created_at
FROM {{ ref('fct_reviews') }} r
INNER JOIN {{ ref('dim_listings_cleansed') }} l
    ON r.listing_id = l.listing_id
WHERE r.review_date < l.created_at
LIMIT 10