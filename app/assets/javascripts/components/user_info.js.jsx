var UserInfo = React.createClass({
  render: function() {
    var imgUrl = (this.props.data.banner);
    var divStyle = {
        backgroundImage: 'url(' + imgUrl + ')'
    }
    return (
      <section>
        <div className="hover-tile-outer" style={divStyle}>
          <div className="hover-tile-container">
            <div className="hover-tile hover-tile-visible"></div>
            <div className="hover-tile hover-tile-hidden">
              <h4>{this.props.data.screen_name}</h4>
              <p>{this.props.data.description}</p>
            </div>
          </div>
        </div>
        <div className="stats">
          <ul>
            <li><i>{this.props.data.tweets_count}</i><span>Tweets</span></li>
            <li><i>{this.props.data.followers_count}</i><span>Followers</span></li>
            <li><i>{this.props.data.favourites_count}</i><span>Favourites</span></li>
          </ul>
        </div>
      </section>
    );
  }
});
