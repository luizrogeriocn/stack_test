var UserStat = React.createClass({

  render: function() {
    return (
      <li><i>{this.props.count}</i><span>{this.props.label}</span></li>
    );
  }
});
