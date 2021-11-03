import React,{Component} from 'react';
import {Modal} from 'react-bootstrap';
import {Table} from 'react-bootstrap';
import {Button} from 'react-bootstrap';

class QuickView extends Component{
  render(){
    const imageSizing = {
      maxWidth: "400px",
      maxHeight: "400px",
      marginBottom:"30px"
    }
    return (
      <Modal show={true} onHide={this.props.handleQuickViewModalClose} alt={this.props.product.id}>
        <Modal.Header closeButton>
          <h2><center><Modal.Title>{this.props.product.name}</Modal.Title></center></h2>
        </Modal.Header>
        <Modal.Body>
          <center>
            <img src={this.props.product.image} style={imageSizing}/>
            <div className="container-fluid">
              <Table responsive>
                <thead>
                </thead>
                <tbody>
                  <tr>
                    <td>Название:</td>
                    <td>{this.props.product.name}</td>
                  </tr>
                  <tr>
                    <td>Подробнее:</td>
                    <td>{this.props.product.description}</td>
                  </tr>
                  <tr>
                    <td>Цена:</td>
                    <td>{this.props.product.price}</td>
                  </tr>
                </tbody>
              </Table>
            </div>
          </center>
        </Modal.Body>
        <Modal.Footer>
          <Button onClick={this.props.handleQuickViewModalClose}>Close</Button>
        </Modal.Footer>
      </Modal>
    );
  }
}


export default QuickView;
