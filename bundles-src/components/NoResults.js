import React, {Component} from 'react';

const NoResults = () => {
  return (
    <div className="row">
      <div className="col-6">
        <center>
          <h2>Таких блюд в меню нет!</h2>
          <p>Введите другой запрос.</p>
        </center>
      </div>
      <div className="col-sm-3 col-md-3 col-lg-3"></div>
    </div>
  )
};

export default NoResults;
