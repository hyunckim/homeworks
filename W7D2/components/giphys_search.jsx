import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor() {
    super();
    this.state = { searchTerm: "" };
  }

  handleChange() {
    (event) => {
      this.setState({ searchTerm: event.currentTarget.value });
    };
  }

  render() {
    return (
      <div>
        <input type="text" onChange={this.handleChange} value={this.state.searchTerm}></input>
      </div>
    );
  }
}
