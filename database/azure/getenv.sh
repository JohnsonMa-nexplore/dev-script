kubectl exec postgresql-0 -- env | findstr -i post > postgresql_info
cat postgresql_info