```
docker build -t test:pandas .
docker run -it test:pandas 2021-11-15
```

```
https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf
```

```
python ingest_data.py \
  --user=root \
  --password=root \ 
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --table_name=yellow_taxi_trip \
  --url=
```