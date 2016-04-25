var UserBanner = React.createClass({
  render: function() {
    var imgUrl = (this.props.image);
    var divStyle = {
          backgroundImage: 'url(' + imgUrl + ')'
    }

    return (
      <div className="hover-tile-outer" style={divStyle}>
        <div className="hover-tile-container">
          <div className="hover-tile hover-tile-visible"></div>
          <div className="hover-tile hover-tile-hidden">
            {this.props.children}
          </div>
        </div>
      </div>

    );
  }
});
