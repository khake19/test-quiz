# Backend Setup

You're required to use Rails API as backend and frontend. Minimum spec already defined in each component. Improvements are welcomed and encouraged. We value passion and creativity!

- [Ruby](https://www.ruby-lang.org/en/) 2.5.1
- [Rails](https://rubyonrails.org/) 5.2.0

We use Ruby on Rails as the backend server for most Quipper products so we would like to see your skills in using this technology!

# Setup

Move to `backend/` directory and perform the following setup steps

## Install dependencies

```
bundle install
```

## Setup database

```
bundle exec run rails db:create db:migrate db:seed
```

## Start server

```
bundle exec rails server
```

Backend server is now available at [localhost:3000](http://localhost:3000).
