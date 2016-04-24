var TweetBox = React.createClass({
  loadTweetsFromServer: function() {
    $.ajax({
      url: window.location.pathname,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(window.location.pathname, status, err.toString());
      }.bind(this)
    });
  },
  handleCommentSubmit: function(comment) {
    $.ajax({
      url: '/',
      dataType: 'json',
      type: 'GET',
      data: comment,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: {tweets: []}};
  },
  componentDidMount: function() {
    this.loadTweetsFromServer();
  },
  render: function() {
    return (
      <div>
        <SearchForm onCommentSubmit={this.handleCommentSubmit} />
        <UserInfo data={this.state.data}/>
        <TweetList data={this.state.data} />
      </div>
    );
  }
});



