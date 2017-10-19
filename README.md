# W205-Exercise-1

## Setup
If running an AWS AMI:
```
mount -t ext4 /dev/xvdf /data
./start-hadoop.sh
/data/start_postgres.sh
```

Clone the repo in your desired location:
git clone https://github.com/jrosenfeld13/W205-Exercise-1.git

## Load the data
cd W205-Exercise-1/loading_and_modeling/
chmod +rwx load_data_lake.sh
./load_data_lake.sh
