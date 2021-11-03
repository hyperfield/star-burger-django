import React,{Component} from 'react';
import {TransitionGroup, CSSTransition} from 'react-transition-group';
import EmptyCart from './EmptyCart';
import { Button } from 'react-bootstrap';
import {Modal} from 'react-bootstrap';
import {Table} from 'react-bootstrap';
import '../css/modal.css';

class CartModalComponent extends Component{
  handleCheckout(){
    document.getElementById('checkout').style.pointerEvents = 'none';
    document.getElementById("checkout").setAttribute("disabled", "disabled");
    if (this.props.cartItems.length>0){
      this.props.handleCartClose();
      this.props.handleProceed();
    }
    document.getElementById('checkout').style.pointerEvents = 'auto';
  }

  render(){
    const imgStyle = {
      maxWidth: "100px",
      maxHeight: "50px"
    };

    let cartItems = this.props.cartItems.map(product => (
      <CSSTransition classNames="fadeIn" key={product.id} timeout={{ enter:500, exit: 300 }}>
        <tr>
          <td><img src={product.image} style={imgStyle} /></td>
          <td>{product.name}</td>
          <td className="currency">{product.price}</td>
          <td>{product.quantity} шт.</td>
          <td className="currency">{product.quantity * product.price}</td>
          <td><a href="#" onClick={this.props.removeProduct.bind(this, product.id)}>×</a></td>
        </tr>
      </CSSTransition>
    ));

    let view;
    if(cartItems.length <= 0){
      view = <EmptyCart />
    } else {
      view = (
        <Table responsive>
          <thead>
            <tr>
              <th></th>
              <th>Название</th>
              <th>Цена</th>
              <th>Количество</th>
              <th>Итого</th>
              <th></th>
            </tr>
          </thead>
          <TransitionGroup component="tbody">
            {cartItems}
          </TransitionGroup>
        </Table>
      )
    }

    return (
      <Modal show={this.props.showCart} onHide={this.props.handleCartClose}>
        <Modal.Header closeButton>
          <center><Modal.Title>Ваша корзина</Modal.Title></center>
        </Modal.Header>
        <Modal.Body>
          {view}
        </Modal.Body>
        <Modal.Footer>
          <Button
            id="checkout"
            onClick={event => this.handleCheckout()}
            className={this.props.cartItems.length>0 ? "btn btn-danger" : "disabled btn btn-danger"}
          >
            Оформить заказ
          </Button>
          <Button onClick={this.props.handleCartClose}>Закрыть</Button>
        </Modal.Footer>
      </Modal>
    );
  }
}

export default CartModalComponent;
