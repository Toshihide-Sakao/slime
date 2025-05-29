INSERT INTO slime.users(kth_id, email, first_name, last_name, psw)
VALUES ($1, $2, $3, $4, $5)
RETURNING $table_fields;