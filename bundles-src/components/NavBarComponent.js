import React, { Component } from 'react'

class NavBarComponent extends Component{
  render(){
    return (
      <nav className="navbar navbar-inverse navbar-fixed-top">
        <div className="container-fluid">
          <div className="navbar-header">
              <button type="button" className="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span className="icon-bar"></span>
                <span className="icon-bar"></span>
                <span className="icon-bar"></span>
            </button>
            <a className="navbar-brand" href="#">Star Burger</a>
          </div>
          <div>
            <div className="collapse navbar-collapse" id="myNavbar">
              <ul className="nav navbar-nav">
                <li><a href="#menu">Меню</a></li>
                <li><a href="#contact_us">Контакты</a></li>
              </ul>
              <ul className="nav navbar-nav navbar-right">
                <li>
                  <a href="#">Блюд в заказе: {this.props.totalItems ? <span>{this.props.totalItems}</span> : "" }</a>
                </li>
                <li>
                  <a href="#" className={ this.props.totalAmount ? 'currency' : '' }>Стоимость: {this.props.totalAmount ? <span>{this.props.totalAmount}</span> : "" }</a>
                </li>
                <li style={{float:'right'}}>
                  <a onClick={this.props.handleCartShow}>
                    <button type="button" href="#" className="btn btn-primary btn-sm">
                      <span className="glyphicon glyphicon-shopping-cart"></span> Корзина
                    </button>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </nav>
    );
  }
}

export default NavBarComponent;
