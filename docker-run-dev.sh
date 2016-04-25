#docker run --name postgres --net my-network -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres

#must listen 
#docker run --name phoenix_commerce_dev --net my-network -p 5432:5432 -ti binarytemple/phoenix_commerce_dev:latest /bin/bash

docker rm phoenix_commerce_dev
#docker run --name phoenix_commerce_dev --net my-network -p 4000:4000 \
#-e postgres_dev_username \
#-e postgres_dev_password \
#-e postgres_dev_database \
#-e postgres_dev_hostname=postgres \
#-e postgres_dev_port=5432 \
#-e PHOENIX_COMMERCE_AWS_ACCESS_KEY_ID \
#-e PHOENIX_COMMERCE_AWS_SECRET_ACCESS_KEY \
#-e PHOENIX_COMMERCE_STRIPE_SECRET_KEY \
#-ti binarytemple/phoenix_commerce_dev:latest /bin/bash 


docker run --name phoenix_commerce_dev --net my-network -p 4000:4000 \
-e PHOENIX_COMMERCE_AWS_ACCESS_KEY_ID \
-e PHOENIX_COMMERCE_AWS_SECRET_ACCESS_KEY \
-e PHOENIX_COMMERCE_STRIPE_SECRET_KEY \
-ti binarytemple/phoenix_commerce_dev:latest /bin/bash 

