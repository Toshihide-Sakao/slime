
use crate::models::User;

#[cfg(feature = "ssr")]
pub async fn get_users(client: &Client) -> Result<Vec<User>, Error> {


    // let stmt = include_str!("../sql/get_users.sql");
    // let stmt = stmt.replace("$table_fields", &User::sql_table_fields());
    // let stmt = client.prepare(&stmt).await.unwrap();

    // let results = client
    //     .query(&stmt, &[])
    //     .await?
    //     .iter()
    //     .map(|row| User::from_row_ref(row).unwrap())
    //     .collect::<Vec<User>>();

    // Ok(results)
}