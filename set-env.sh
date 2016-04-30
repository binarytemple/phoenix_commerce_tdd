export HOST=$(awk 'BEGIN{n=split(ENVIRON["DOCKER_HOST"],a,/[:->\/-]/); print a[n-1]} ' < /dev/null)
export POSTGRES_PORT=$(docker ps --format '{{.Image}} {{.Ports}}' | awk '/^postgres/{n=split($2,a,/[:->\/-]/); print a[n-1]}')
export CHROMEDRIVER_PORT=$(docker ps --format '{{.Image}} {{.Ports}}' | awk '/chromedriver/{n=split($2,a,/[:->\/-]/); print a[n-1]}')

export postgres_test_username="postgres"
export postgres_test_password="postgres"
export postgres_test_database="phoenix_commerce_test"
export postgres_test_hostname="${HOST}"
export postgres_test_port="${POSTGRES_PORT}"

export postgres_dev_username="postgres"
export postgres_dev_password="postgres"
export postgres_dev_database="phoenix_commerce_dev"
export postgres_dev_hostname="${HOST}"
export postgres_dev_port="${POSTGRES_PORT}"

export postgres_prod_username="postgres"
export postgres_prod_password="postgres"
export postgres_prod_database="phoenix_commerce_prod"
export postgres_prod_hostname="${HOST}"
export postgres_prod_port="${POSTGRES_PORT}"

export chrome_driver_host="${HOST}"
export chrome_driver_port=${CHROMEDRIVER_PORT}
