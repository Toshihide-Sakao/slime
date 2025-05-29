You may need to ensure that you are running the commands with the correct SQL user. On many Linux distributions you may prefix the shell commands with `sudo -u postgres`

1. Create database user

   ```shell
   createuser -P test_user
   ```

   Enter a password of your choice. The following instructions assume you used `testing` as password.

   This step is **optional** and you can also use an existing database user for that. Just make sure to replace `test_user` by the database user of your choice in the following steps and change the `.env` file containing the configuration accordingly.

   An alternative using SQL:

   ```sql
   CREATE USER test_user WITH PASSWORD 'testing';
   ```

2. Create database

   ```shell
   createdb -O test_user testing_db
   ```

   An alternative using SQL:

   ```sql
   CREATE DATABASE testing_db OWNER test_user;
   ```

3. Initialize database

   ```shell
   psql -f sql/schema.sql testing_db
   ```

   This step can be repeated and clears the database as it drops and recreates the schema `testing` which is used within the database.

4. Grant privileges to new user

```sql
GRANT ALL PRIVILEGES ON SCHEMA slime TO test_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN slime testing TO test_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN slime testing TO test_user;
```
5. Create `.env` file:
```ini
SERVER_ADDR=127.0.0.1:8080
PG__USER=test_user
PG__PASSWORD=testing
PG__HOST=127.0.0.1
PG__PORT=5432
PG__DBNAME=testing_db
PG__POOL_MAX_SIZE=16
```
6. Run with `cargo leptos watch`

7. Try sending POST request
```shell
echo '{"kth_id": "wtf", "email": "wtf@kth.se", "first_name": "brirst", "last_name": "brast", "psw": "password"}' | http -f --json --print h POST http://127.0.0.1:3000/users
```