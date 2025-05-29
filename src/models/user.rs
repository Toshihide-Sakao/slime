#![cfg(feature = "ssr")]

// use sqlx::{self, FromRow};
use serde::{Deserialize, Serialize};
use tokio_pg_mapper_derive::PostgresMapper;

#[derive(Deserialize, PostgresMapper, Serialize, Debug)]
#[pg_mapper(table = "users")]
pub struct User {
    pub kth_id: String,
    pub email: String,
    pub first_name: String,
    pub last_name: String,
    pub psw: String,
}