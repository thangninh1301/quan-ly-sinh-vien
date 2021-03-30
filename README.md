# README

## Development
```
cp config/application.yml.example config/application.yml
cp config/database.yml.example config/database.yml
bundle install
rails db:create db:migrate db:seed
```

## Production
### Deploy
```
cp config/deploy/settings.yml.example config/deploy/settings.yml # and edit config/deploy/settings.yml
bundle exec cap production deploy
```


