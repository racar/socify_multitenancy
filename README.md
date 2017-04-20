### What it uses?

* [Ruby on Rails](https://github.com/rails/rails)
* [Bootstrap](https://github.com/twbs/bootstrap-sass)
* [Devise](https://github.com/plataformatec/devise)
* [Public Activity](https://github.com/chaps-io/public_activity)
* [Gioco](https://github.com/joaomdmoura/gioco)
* [Apartment](https://github.com/influitive/apartment)



Resolve dependencies using bundler:

```
bundle install
```

Install apartment:
```
bundle exec rails generate apartment:install
```


Run Migrations:

```
rake db:migrate
```

Run rails using

```
rails server
```

### Populate Mock data
To test the app with mock data by running the following rake task:
Note: This feed data is not working with apartment integration. The tenants need to be created from de GUI.  
```
rake fill:data
```

This will create records with values from faker & populator gems. Also here are the test user credentials:

* email: test@socify.com
* password: password
