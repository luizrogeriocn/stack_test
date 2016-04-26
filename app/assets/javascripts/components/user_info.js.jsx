var UserInfo = React.createClass({
  render: function() {
    return (
      <section>
        <UserBanner image={this.props.data.banner}>
          <div>
            <img src={this.props.data.profile_image}/>
            <h4>{this.props.data.screen_name}</h4>
          </div>
          <p>{this.props.data.description}</p>
        </UserBanner>

        <UserStats>
          <UserStat count={this.props.data.tweets_count} label="Tweets" />
          <UserStat count={this.props.data.followers_count} label="Followers" />
          <UserStat count={this.props.data.favourites_count} label="Favourites" />
        </UserStats>
      </section>
    );
  }
});
