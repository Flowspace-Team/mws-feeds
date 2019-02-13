[![Build Status](https://travis-ci.org/Flowspace-Team/mws-feeds.svg?branch=master)](https://travis-ci.org/Flowspace-Team/mws-feeds)

# MWS Feeds

**MWS Feeds** is a Ruby interface to the [Amazon Marketplace Web Service (MWS) Feeds API](http://docs.developer.amazonservices.com/en_US/feeds/index.html). With the MWS Feeds API, you can build applications that let sellers purchase shipping for non-Prime and Prime orders using Amazon’s Buy Shipping Services.

(To use Amazon MWS, you must have an Amazon MWS developer account.)

## Usage

Create a client:

```ruby
require "mws-feeds"
client = MWS.feeds(marketplace: "ATVPDKIKX0DER",
                    merchant_id: "123")
```

Set up credentials [when instantiating or with environment variables](https://github.com/Flowspace-Team/peddler#usage).

### Service Status

Check the operational status of the API:

```ruby
client.get_service_status.parse
```
