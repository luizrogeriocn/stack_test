var UserStats = React.createClass({

  render: function() {
    return (
      <div className="stats">
        <ul>{this.props.children}</ul>
      </div>
    );
  }
});
