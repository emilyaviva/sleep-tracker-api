# Sleep Tracker API

This API tracks sleep periods (e.g. for a toddler).

See the API documentation on Apiary: https://sleeptrackerapi.docs.apiary.io/

## Installation

0. Make sure you have Ruby installed. See [this page](https://www.ruby-lang.org/en/documentation/installation/) for instructions to check if you already have Ruby installed, or what to do if you don't.
1. Clone this repo, and `cd` into it.
2. Run `gem install bundler`
3. Run `bundle install`
4. Run `bundle exec rails server --port=3001` (or whatever port your frontend expects)

From another terminal, you should then be able to make HTTP requests to `http://localhost:3001/people` or whatever endpoint you like, with whatever client or frontend you wish.

### Help! There aren't any people in my database!

If you have the server running, you can make HTTP requests to add people, e.g. (using [httpie](https://httpie.org/)):

```
http post localhost:3001/people name="Harry Potter" birthdate="31 July 1980"
```

Alternatively, you can manually add people from the Rails console. In your terminal:
1. `bundle exec rails console`
2. `Person.create(name: "John Smith", birthdate: "12 January 2019")`, repeat as necessary
3. `exit`

## Testing

Unit tests and request specs are written in RSpec. To run them, run `bundle exec rspec --format documentation`.
