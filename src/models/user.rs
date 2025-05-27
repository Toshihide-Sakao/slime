use sqlx::{self, FromRow};
use serde::{Deserialize, Serialize};

#[derive(Serialize, FromRow)]
pub struct User {
    pub id: i64,
    pub kth_id: String,
    pub email: String,
    pub first_name: String,
    pub last_name: String,
    pub psw: String,
}