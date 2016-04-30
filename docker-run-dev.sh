docker rm phoenix_commerce_dev

docker run --name phoenix_commerce_dev --net my-network -p 4000:4000 \
-e PHOENIX_COMMERCE_AWS_ACCESS_KEY_ID \
-e PHOENIX_COMMERCE_AWS_SECRET_ACCESS_KEY \
-e PHOENIX_COMMERCE_STRIPE_SECRET_KEY \
-ti binarytemple/phoenix_commerce_dev:latest /bin/bash 

