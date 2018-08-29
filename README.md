# Quiz Master!

Quiz Master is Quipper's technical test.

# Components

You're required to use Rails API as backend and frontend. Minimum spec already defined in each component. Improvements are welcomed and encouraged. We value passion and creativity!

## Backend

- [Ruby](https://www.ruby-lang.org/en/) 2.5.1
- [Rails](https://rubyonrails.org/) 5.2.0

It should be rails API only.

## Frontend

## Docker

We provide `docker-compose.yml`, but you're not required to use `docker`.

To bootstrap and run dockerized version, you can do:

```bash
docker-compose run backend rake db:create
docker-compose run backend rake db:migrate
docker-compose run backend rake db:seed

docker-compose up # will run application on localhost:3000
```
