# Backend Setup

You're required to use Rails API as backend. Minimum spec already defined in each component. Improvements are welcome and encouraged. We value passion and creativity!

- [Ruby](https://www.ruby-lang.org/en/) 2.5.1
- [Rails](https://rubyonrails.org/) 5.2.0

We use Ruby on Rails as the backend server for most Quipper products so we would like to see your skills in using this technology!

# Setup

!> If you have [setup using Docker](/), you can skip these setup steps.

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

Backend server is now available at http://localhost:3000.
