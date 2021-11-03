import React, { Component } from 'react';
import _ from 'lodash';

import NavBarComponent from './components/NavBarComponent';
import CartModalComponent from './components/CartModalComponent';
import BannerComponent from './components/BannerComponent';
import Products from './components/Products';
import QuickView from './components/QuickView';
import FooterComponent from './components/FooterComponent';
import CheckoutModal from './components/CheckoutModalComponent';
import LoadingProducts from './components/loaders/LoadingProducts';
import NoResults from "./components/NoResults";

import './css/App.css';

class App extends Component {

  constructor(props){
    super();
    this.state = {
      banners: [],  // null represent "Loading" state, will be replaced by Array on server response
      products: null,  // null represent "Loading" state, will be replaced by Array on server response
      term: '',
      cart: [],
      quickViewProduct: null,  // will be replaced by selected product attributes
      showCart: false,
      checkoutModalActive: false,
    };
    this.handleSearch = this.handleSearch.bind(this);
    this.handleAddToCart = this.handleAddToCart.bind(this);
    this.checkProduct = this.checkProduct.bind(this);
    this.handleRemoveProduct = this.handleRemoveProduct.bind(this);
    this.handleCartShow = this.handleCartShow.bind(this);
    this.handleCartClose = this.handleCartClose.bind(this);
    this.handleQuickViewModalClose = this.handleQuickViewModalClose.bind(this);
    this.handleQuickViewModalShow = this.handleQuickViewModalShow.bind(this);
    this.handleCheckout=this.handleCheckout.bind(this);
    this.handleCheckoutModalShow=this.handleCheckoutModalShow.bind(this);
    this.handleCheckoutModalClose=this.handleCheckoutModalClose.bind(this);
  }

  handleCheckoutModalShow(){
    this.setState({checkoutModalActive: true});
  }

  handleCheckoutModalClose(){
    this.setState({checkoutModalActive: false});
  }

  async handleCheckout({firstname, lastname, phonenumber, address}){
    const url = "api/order/";
    let data = {
      'products': this.state.cart.map(item=>({
        product: item.id,
        quantity: item.quantity,
      })),
      firstname,
      lastname,
      phonenumber,
      address
    };

    let csrfToken = document.querySelector("[name=csrfmiddlewaretoken]").value;

    try {
      let response = await fetch(url, {
        method: 'post',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'X-CSRFToken': csrfToken,
        },
        body: JSON.stringify(data),
      });

      if (!response.ok){
        alert('Ошибка при оформлении заказа. Попробуйте ещё раз или свяжитесь с нами по телефону.');
        return;
      }
      let responseData = await response.json();

      this.setState({
        cart: [],
      });

      alert("Заказ оформлен. Вам перезвонят в течение 10 минут.");

      this.handleCartClose();
    } catch(error){
      alert('Ошибка при оформлении заказа. Попробуйте ещё раз или свяжитесь с нами по телефону.');
      throw error;
    };
  }


  updateToken(NewToken){

    this.setState({
      token:NewToken
    })
  }


  async getProducts(){
    let response = await fetch('/api/products/', {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }
    });

    if (!response.ok){
      return;
    }

    let data = await response.json();
    this.setState({
      products : data
    });
  }

  async getBanners(){
    let response = await fetch('/api/banners/', {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }
    });

    if (!response.ok){
      return;
    }

    let data = await response.json();
    this.setState({
      banners : data
    });
  }

  componentDidMount(){
    this.getProducts();
    this.getBanners();
  }


  // Search by Keyword
  handleSearch(event){
    this.setState({term: event.target.value});
  }

  handleCartClose() {
    this.setState({ showCart: false });
  }

  handleCartShow() {
    this.setState({ showCart: true });
  }

  // Add to Cart
  handleAddToCart(selectedProducts){

    let cartItems = this.state.cart;
    let productID = selectedProducts.id;
    let productQty = selectedProducts.quantity;

    if (this.checkProduct(productID)){
      let index = cartItems.findIndex((x => x.id == productID));
      cartItems[index].quantity = parseFloat(cartItems[index].quantity) + parseFloat(productQty);
      this.setState({
        cart: cartItems
      })
    }
    else {
      cartItems.push(selectedProducts);
    }

    this.setState({
      cart : cartItems,
    });
  }


  handleRemoveProduct(id, e){
    let cart = this.state.cart;
    let index = cart.findIndex((x => x.id == id));
    cart.splice(index, 1);
    this.setState({
      cart: cart
    })
    e.preventDefault();
  }


  checkProduct(productID){
    let cart = this.state.cart;
    return cart.some(function(item) {
      return item.id === productID;
    });
  }

  handleQuickViewModalShow(product){
    this.setState({
      quickViewProduct: product,
    })
  }

  handleQuickViewModalClose(){
    this.setState({
      quickViewProduct: null,
    })
  }

  render() {

    const totalAmount = this.state.cart.map(item => item.price * item.quantity).reduce((a,b) => a + b, 0);

    let menuBlocks = [];
    let normalizedTerm = _.lowerCase(_.trim(this.state.term));

    if (this.state.products){
      let filteredProducts = this.state.products;

      if (normalizedTerm){
        filteredProducts = this.state.products.filter(product => !normalizedTerm || product.name.toLowerCase().includes(normalizedTerm));
      } else {
        let highlightedProducts = this.state.products.filter(x => x.special_status);

        if (highlightedProducts.length){
          menuBlocks.push(
            <div style={{marginTop:"50px"}} className="form-group" key={'_popular'}>
              <center>
                <h2>Популярное</h2>
                <hr/>
              </center>

              <Products
                productsList={highlightedProducts}
                addToCart={this.handleAddToCart}
                openModal={this.handleQuickViewModalShow}
              />
            </div>
          )
        }
      }

      let menuGroups = _.groupBy(filteredProducts, product => product.category && product.category.name);
      menuBlocks.push(...Object.entries(menuGroups).map( ([groupName, products], index) => (
        <div style={{marginTop:"50px"}} className="form-group" key={index}>
          <center>
            <h2>{ groupName }</h2>
            <hr/>
          </center>

          <Products
            productsList={products}
            addToCart={this.handleAddToCart}
            openModal={this.handleQuickViewModalShow}
          />
        </div>
      )));
    }

    return (

      <React.Fragment>
        <NavBarComponent
          totalItems={this.state.cart.length}
          totalAmount={totalAmount}
          handleCartShow={this.handleCartShow}
        />

        <CartModalComponent
          cartItems={this.state.cart}
          showCart={this.state.showCart}
          removeProduct={this.handleRemoveProduct}
          handleCartClose={this.handleCartClose}
          handleProceed={this.handleCheckoutModalShow}
        />

        { this.state.quickViewProduct &&
          <QuickView
            product={this.state.quickViewProduct}
            handleQuickViewModalClose={this.handleQuickViewModalClose}
          />
        }

        { this.state.banners &&
          <BannerComponent banners={this.state.banners}/>
        }

        <a id="menu" href="#"></a>

        <div className="container-fluid">
          <div className="row" style={{marginBottom:"50px"}}>
            <div className="col-md-3  col-lg-3"></div>
            <div className="col-md-6 col-sm-12 col-lg-6 mt-5" style={{marginTop: '50px'}}>
              <div className="input-group">
                <input type="text" onChange={this.handleSearch} className="form-control"/>
                <span className="input-group-addon" style={{marginTop:"40px"}}>
                  <span className="glyphicon glyphicon-search"></span>
                </span>
              </div>
            </div>
            <div className="col-md-3 col-lg-3"></div>
          </div>

          { !this.state.products && (
            <div>
              <center>
                <h2>Меню Star Burger</h2>
                <hr/>
              </center>
              <LoadingProducts />
            </div>
          )}

          { this.state.products && normalizedTerm && !menuBlocks.length && (
            <NoResults />
          )}

          { this.state.products && !normalizedTerm && !menuBlocks.length && (
            <div className="row">
              <div className="col-6">
                <center>
                  <h2>Меню пока пусто...</h2>
                </center>
              </div>
            </div>
          )}

          { menuBlocks }

          <br/>
          <br/>
          <br/>


        </div>

        <a href="#" id="contact_us"></a>
        <FooterComponent/>

        <CheckoutModal
          checkoutModalActive={true}
          checkoutModalActive={this.state.checkoutModalActive}
          handleCheckoutModalShow={this.handleCheckoutModalShow}
          handleCheckoutModalClose={this.handleCheckoutModalClose}
          handleCheckout={this.handleCheckout}
        />

      </React.Fragment>
    );
  }
}

export default App;
