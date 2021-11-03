import React, {Component} from 'react';
import Counter from './Counter';

class Product extends Component{
  state = {
    isAdded: false,
    quantity: 1,
  }

  updateQuantity(qty){
    this.setState({
      quantity: qty
    })
  }

  addToCart(quantity){
    let selectedProduct = {
      ...this.props.product,
      quantity: quantity,
    };

    this.props.addToCart(selectedProduct);

    this.setState({
      isAdded: true
    });

    setTimeout(() => {
      this.updateQuantity(1);
      this.setState({
        isAdded: false,
      });
    }, 1500);
  }

  quickView(){
    this.props.openModal(this.props.product);
  }

  render(){
    let image = this.props.product.image;
    let name = this.props.product.name;
    let price = this.props.product.price;
    let id = this.props.product.id;
    return (
      <div className="product">
        <div className="product-image">
          <img src={image} alt={name} onClick={this.quickView.bind(this)}/>
        </div>
        <h4 className="product-name">{name}</h4>
        <p className="product-price currency">{price}</p>
        <Counter quantity={this.state.quantity} updateQuantity={qty=>this.updateQuantity(qty)}/>
        <div className="product-action">
          <button
            className={!this.state.isAdded ? "btn btn-primary" : "btn btn-success"}
            type="button"
            onClick={event => this.addToCart(this.state.quantity)}
          >
            {!this.state.isAdded ? "В корзину" : "✔ Добавлено"}
          </button>
        </div>
      </div>
    )
  }
}

export default Product;
