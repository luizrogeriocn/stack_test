var SearchForm = React.createClass({
  getInitialState: function() {
    return {author: ''};
  },
  handleAuthorChange: function(e) {
    this.setState({author: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var author = this.state.author.trim();
    if (!author) {
      return;
    }
    this.props.onCommentSubmit({screen_name: author});
    this.setState({author: ''});
  },
  render: function() {
    return (
      <section className="search">
        <form className="search-bar" onSubmit={this.handleSubmit}>
          <input
            type="text"
            placeholder="@username"
            value={this.state.author}
            onChange={this.handleAuthorChange}
          />
          <button type="submit">
            <RefillIcon name="search-icon-black" alt="Search Icon" />
          </button>
        </form>
      </section>
    )
  }
});
