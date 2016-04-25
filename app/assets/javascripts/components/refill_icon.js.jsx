var RefillIcon = React.createClass({

  render: function() {
    return (
      <img src={this.urlIcon(this.props.name)} alt="Search Icon" />
    );
  },

  urlIcon: function(name) {
    return "https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/"+name+".png";
  }
});
