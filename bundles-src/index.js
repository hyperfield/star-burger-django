import "core-js/stable";
import "regenerator-runtime/runtime";

import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import './css/products.css';
import './css/product.css';

ReactDOM.render(<App />, document.getElementById('root'));


// Workaround for Parcel bug https://github.com/parcel-bundler/parcel/issues/2894
if (module.hot) {
  module.hot.accept(function () {
    setTimeout(function() {
      location.reload();
    }, 300);
  });
}
