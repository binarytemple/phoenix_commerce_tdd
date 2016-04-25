docker exec -it postgres su - postgres -c "pg_dump -s phoenix_commerce_dev | sed -e '/No directory, logging in with HOME/{d;}'"
