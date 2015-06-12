### Test
```
$ rake rspec
```

### Usage
Start the API
```
$ bundle exec ruby api <purchases>
```

There is an example file in the `etc/` folder.
```
$ bundle exec ruby api etc/purchases
```

Once the API is running query for recommendations
```
$ curl localhost:4567/api/v0/recommendations.json?uid=<userid>
```
