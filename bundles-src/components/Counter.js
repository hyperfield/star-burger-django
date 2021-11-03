import React, { Component } from 'react';
import PropTypes from 'prop-types';

class Counter extends Component {
  increment(event){
    event.preventDefault();
    this.props.updateQuantity(this.props.quantity + 1);
  };

  decrement(event){
    event.preventDefault();

    if (this.props.quantity <= 1){
      return;
    }

    this.props.updateQuantity(this.props.quantity - 1);
  };

  feed(event){
    event.preventDefault();
    this.props.updateQuantity(Number(event.target.value) || 0);
  };

  render() {
    return (
      <div className="stepper-input">
        <a href="#" className="decrement" onClick={event=>this.decrement(event)}>–</a>
        <input ref="feedQty" type="number" className="quantity" value={this.props.quantity} onChange={event=>this.feed(event)} />
        <a href="#" className="increment" onClick={event=>this.increment(event)}>+</a>
      </div>
    )
  }
}

export default Counter;
