import React from 'react';

const FooterComponent = props => {
  const style = {
    backgroundColor: "black",
    color: "white",
    paddingTop: "50px",
    paddingBottom: "50px",
    backgroundColor:"black",
    fontSize: "130%",
  }

  // FIXME should be moved to backend db ?
  let email = 'office@star-burger.xyz';
  let phoneNumber = '+1 800 999-99-99';
  let address = 'New York, NY, 10101';

  return (
    <div style={style}>
      <div className="container">
        <div className="row">
          <div className="col-sm-5">
            <p>Contact us</p>
            <p><span className="glyphicon glyphicon-map-marker"></span> {address}</p>
            <p>
              <a href={'tel:' + phoneNumber } style={{color: 'white'}}>
                <span className="glyphicon glyphicon-phone"></span> {phoneNumber}
              </a>
            </p>
            <p>
              <a href={'mailto:'+ email} style={{color: 'white'}}>
                <span className="glyphicon glyphicon-envelope"></span> {email}
              </a>
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}

export default FooterComponent;
