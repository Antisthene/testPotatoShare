# README

Welcome to the potato share API

## Command

First run:
```shell
bundle
rake db:create
rake db:migrate
```

To run
```shell
rails s
```
## API calls

```shell
curl -X GET \
  -H "Content-type: application/json" \
  -H "Accept: application/json" \
  -d '{"selected_date":{"year":"2022","month":"11","day":"8"}}' \
  "localhost:3000/api/v1/potato_shares"
```

## Stack

* Rails: 7.0
* Ruby: 3.1
