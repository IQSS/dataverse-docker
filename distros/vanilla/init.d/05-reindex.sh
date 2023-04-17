# Reindex all datasets
if [ "${REINDEX}" ]; then
    curl http://localhost:8080/api/admin/index/clear
    curl http://localhost:8080/api/admin/index
fi
