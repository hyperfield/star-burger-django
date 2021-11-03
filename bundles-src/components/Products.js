import React, {Component} from 'react';
import Product from './Product';
import LoadingProducts from './loaders/LoadingProducts';
import {TransitionGroup, CSSTransition} from 'react-transition-group';

class Products extends Component{
  render(){
    let productCards = this.props.productsList.map(product => {
      return (
        <CSSTransition
          classNames="fadeIn"
          timeout={{ enter:500, exit: 300 }}
          component="div"
          key={product.id}
        >
          <Product
            product={product}
            addToCart={this.props.addToCart}
            openModal={this.props.openModal}
          />
        </CSSTransition>
      )
    });

    return (
      <div className="products-wrapper">
        <TransitionGroup className="products">
          {productCards}
        </TransitionGroup>
      </div>
    )
  }
}

export default Products;
