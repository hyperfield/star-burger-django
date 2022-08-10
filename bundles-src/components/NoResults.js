import React, {Component} from 'react';

const NoResults = () => {
  return (
    <div className="row">
      <div className="col-6">
        <center>
          <h2>No such items in the menu!</h2>
          <p>Please try a different query.</p>
        </center>
      </div>
      <div className="col-sm-3 col-md-3 col-lg-3"></div>
    </div>
  )
};

export default NoResults;
