import React, {Component} from 'react';

const EmptyCart = (props) =>{
  return(
    <div className="container-fluid">
      <center>
        <div className="empty-cart"></div>
        <h4>Your cart is empty...</h4>
      </center>
    </div>
  )
};

export default EmptyCart;
