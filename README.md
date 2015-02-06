# Post::Api::Client

Ruby client implementation for po.st URL shortener service

## Installation

Add this line to your application's Gemfile:

    gem 'post-api-client', github: "wildtangent/post-api-client"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install post-api-client

## Usage

```ruby
client = Post::Api::Client::Shortener.new("YOUR_API_KEY")

shortener = client.shorten(
  longUrl: "http://mywebsite.com/mylongurl"
)

puts shortener['short_url']
```

## Running Tests
First create a `config.yml` in the root of the gem as follows: Note the tests run against a live server at present.

```yaml
api_key: "YOUR_API_KEY"
```

Then run the specs
```shell
bundle exec rake spec
```

## TODO  
* Implement mocks for test HTTP responses

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
