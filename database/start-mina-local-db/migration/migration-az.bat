set backend_path=C:\Projects\e2ep-mina-backend
set db_connection=postgresql://localhost:5444/hasura
set password=3srNazbayjqSa3PTrz8DLgpAJA3wSBo4gVzbMV1H

flyway %1 ^
 -cleanDisabled="false" ^
 -locations="filesystem:%backend_path%" ^
 -reportEnabled=false ^
 -url="jdbc:%db_connection%" ^
 -user=postgres ^
 -password=%password% ^
 -schemas=public
 