#![cfg(feature = "ssr")]

use deadpool_postgres::Client;
use tokio_pg_mapper::FromTokioPostgresRow;

use crate::{errors::MyError, models::user::User};

pub async fn get_users(client: &Client) -> Result<Vec<User>, MyError> {
    println!("Fetching users from the database...");
    let stmt = include_str!("../sql/get_users.sql");
    let stmt = stmt.replace("$table_fields", &User::sql_table_fields());
    let stmt = client.prepare(&stmt).await.unwrap();

    let results = client
        .query(&stmt, &[])
        .await?
        .iter()
        .map(|row| User::from_row_ref(row).unwrap())
        .collect::<Vec<User>>();

    Ok(results)
}

pub async fn add_user(client: &Client, user_info: User) -> Result<User, MyError> {
    let _stmt = include_str!("../sql/add_user.sql");
    println!("Adding user with info: {:?}", user_info);
    let _stmt = _stmt.replace("$table_fields", &User::sql_table_fields());
    println!("Prepared SQL: {}", _stmt);

    println!("Executing SQL: {}", _stmt);
    println!("User Info: kthid: {} ", user_info.kth_id);

    println!("Client: {:?}", client);
    let stmt = client.prepare(&_stmt).await.unwrap();

    // let stmt = client.prepare(&_stmt).await.map_err(|e| {
    //     println!("DB prepare failed: {:?}", e);
    //     MyError::PGError(e) // map to your error type
    // })?;

    client
        .query(
            &stmt,
            &[
                &user_info.kth_id,
                &user_info.email,
                &user_info.first_name,
                &user_info.last_name,
                &user_info.psw,
            ],
        )
        .await?
        .iter()
        .map(|row| User::from_row_ref(row).unwrap())
        .collect::<Vec<User>>()
        .pop()
        .ok_or(MyError::NotFound) // more applicable for SELECTs
}
