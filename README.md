Welcome to StackCommerce Twitter client!
===================

Check out this [live demo](http://stackcommerce-test.herokuapp.com)
> **Test credentials:**  
**E-mail:** user@example.com  
**Password:** 12345678 

This application was built using RubyOnRails and React to show you the last 25 tweets from anyone with an open Twitter account, and it is **awesome!**

But it wasn't always like that,  at first it was purely built with Rails so the views were server-side rendered - what could slow down response times if the app ever became more fully-featured.

Enter ReactJS and its components. With React, the application can focus on serving resources via a JSON endpoint, and that feels pretty faster than the old-fashioned server-rendered views!

There were some challenges along the way, e.g., searches for nonexistent and private users - a.k.a NotFound and NotAuthorized - that could potentially lead the application to raise an Error. This was avoided by creating abstractions for Users and Tweets, including NullUsers and NullTweets. Using this approach, pretty much any request sent to the application can be handled gracefully.

> **Possible Improvements:**
- Inject MessageParser into Tweet as a dependency. Besides the testability improvement, it would be easier to inject a custom parser for NullTweets handling.
- Show original tweet message for retweets.
- Some tests are not very descriptive.
- Add Integration tests to make sure everything is working together.

Usage of the [Twitter gem][1] has been limited only to match the application needs, so there is a wrapper for the API communication. The Twitter Client itself is injected as a dependency for the API wrapper, which makes it easier to test.

----------

Application Setup
-------------
Setting up a local environment is as simple as running:
```shell
bin/setup
```

That command will set up almost everything. There is a ```.sample.env``` file indicating all the environment variables the application needs.
Create a ```.env``` file like this one:
```
RACK_ENV=development
TWITTER_CONSUMER_KEY=your_twitter_app_consumer_key
TWITTER_CONSUMER_SECRET=your_twitter_app_consumer_secret
TWITTER_ACCESS_TOKEN=your_twitter_app_access_token
TWITTER_ACCESS_TOKEN_SECRET=your_twitter_app_access_token_secret
```

You can create a Twitter app and get your own credentials [here](https://apps.twitter.com/)

#### <i class="icon-upload"></i> Heroku Deploy
Follow [this Getting started guide](https://devcenter.heroku.com/articles/getting-started-with-rails4) for Heroku deployment instructions.
> **Important Note:**
Remember to set environments variables on Heroku!


Running the test suite
-------------

Just run ```rake```. That simple, really! :)


[1]: https://github.com/sferik/twitter
