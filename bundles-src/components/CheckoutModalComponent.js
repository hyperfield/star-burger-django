import React,{Component} from 'react';
import {Modal} from 'react-bootstrap';
import {Button} from 'react-bootstrap';

class CheckoutModal extends Component{
  state = {
    firstname: "",
    lastname: "",
    phonenumber: "",
    address: "",
    waitTillCheckoutEnds: false,
  }

  saveFirstname = event => {
    const {target : {value}}  = event;
    this.setState({
      firstname : value
    });
  }

  saveLastname = event => {
    const {target : {value}}  = event;
    this.setState({
      lastname : value
    });
  }

  savePhonenumber = (event) => {
    const {target : {value}} = event;
    this.setState({
      phonenumber : value
    });
  }

  saveAddress = event => {
    const {target : {value}} = event;
    this.setState({
      address : value
    });
  }

  async submit(event){
    event.preventDefault();

    this.setState({
      waitTillCheckoutEnds : true,
    });

    try {
      await this.props.handleCheckout(this.state);

    } finally {
      this.setState({
        waitTillCheckoutEnds : false,
      });
    }
  }

  render(){
    return (
      <Modal show={this.props.checkoutModalActive} onHide={this.props.handleCheckoutModalClose}>
        <form onSubmit={event=>this.submit(event)}>
          <Modal.Header closeButton>
            <h2>
              <center>
                <Modal.Title>Completing your order</Modal.Title>
              </center>
            </h2>
          </Modal.Header>
          <Modal.Body>
            <div className="form-group container-fluid">
              <label htmlFor="firstname">First name:</label>
              <input onChange={this.saveFirstname} required id="firstname" type="text" className="form-control"/><br/>
              <label htmlFor="lastname">Last name:</label>
              <input onChange={this.saveLastname} required id="lastname" type="text" className="form-control"/><br/>
              <label htmlFor="phonenumber">Telephone:</label>
              <input onChange={this.savePhonenumber} required id="phonenumber" maxLength="20" type="text" className="form-control" placeholder="+33 ..."/><br/>
              <label htmlFor="address">Delivery address:</label>
              <input onChange={this.saveAddress} required id="address" type="text" maxLength="256" className="form-control" placeholder="Street address, City, State/Province/Region"/><br/>
            </div>
          </Modal.Body>
          <Modal.Footer>
            <Button id="order-submit-btn" className="btn btn-primary" type="submit" disabled={ this.state.waitTillCheckoutEnds }>
              Send
            </Button>
            <Button onClick={this.props.handleCheckoutModalClose}>Close</Button>
          </Modal.Footer>
        </form>
      </Modal>
    );
  }
}

export default CheckoutModal;
