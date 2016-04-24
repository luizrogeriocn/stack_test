var Tweet = React.createClass({
  render: function() {
    return (
      <div className="comment">
        <div className="comment-image">
          <img src={this.props.image} />
        </div>
        <div className="comment-content">
          <h1>{this.props.author}</h1>
          <p dangerouslySetInnerHTML={markup(this.props.children)} />
          <p className="comment-detail">{this.props.created}</p>
        </div>
      </div>
    );
  }
});

function markup(text){
  return {__html: text};
};
