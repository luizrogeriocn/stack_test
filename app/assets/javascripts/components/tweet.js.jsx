var Tweet = React.createClass({
  render: function() {
    return (
      <div className="comment">
        <div className="comment-image">
          <img src={this.props.image} />
        </div>
        <div className="comment-content">
          <h1>
            <a className="author" href={'/'+this.props.author}>{this.props.author} </a>
            <i className={this.retweet(this.props.is_retweet)}></i>
          </h1>
          <p dangerouslySetInnerHTML={markup(this.props.children)} />
          <p className="comment-detail">{this.props.created}</p>
        </div>
      </div>
    );
  },
  retweet: function(is_retweet){
    return is_retweet ? "fa fa-retweet" : '';
  }
});

function markup(text){
  return {__html: text};
};
