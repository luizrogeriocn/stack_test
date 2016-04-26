var TweetList = React.createClass({
  render: function() {
    var tweetNodes = this.props.data.tweets.map(function(tweet) {
      return (
        <Tweet
          author={tweet.author}
          created={tweet.created_at}
          is_retweet={tweet.is_retweet}
          key={tweet.id}
          image={tweet.image}>
          {tweet.text}
        </Tweet>
      );
    });
    return (
      <section className="tweets">
        {tweetNodes}
      </section>
    );
  }
});
