use serde::{Deserialize, Serialize};

// #[derive(Deserialize, PostgresMapper, Serialize)]
// #[pg_mapper(table = "users")] // singular 'user' is a keyword..
pub struct User {
    pub email: String,
    pub first_name: String,
    pub last_name: String,
    pub username: String,
}