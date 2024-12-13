backend_path=/Users/johnsonma/Projects/MINA/e2ep-mina-backend
db_connection=postgresql://localhost:5444/hasura
password=MqvfpB8LBcomcIjQfXOaFwhjqhKhEYw6b0z0zvuE

flyway $1 \
 -cleanDisabled="false" \
 -locations="filesystem:$backend_path" \
 -reportEnabled=false \
 -url="jdbc:$db_connection" \
 -user=postgres \
 -password=$password \
 -schemas=public
 