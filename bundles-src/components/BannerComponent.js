import React, { Component } from 'react';

const BannerComponent = (props) => {
  const title_container_style = "position: absolute;z-index: 99; width: 100vw; height: 600px;background-color: rgba(0,0,0,0.3);";
  const section_style = "height:600px;";
  const headline_style = "margin-top: 155px;"
  const bannerStyle = {
    maxWidth: "100%",
    height: "auto",
    width: "auto"
  };

  let carousel_items = props.banners.map( (cfg, index) => {
    return (
      <div className={index ? 'item' : 'item active'} key={index}>
        <img src={cfg.src} alt={cfg.title} style={bannerStyle}/>
        <div className="carousel-caption">
          <h3>{cfg.title}</h3>
          <p>{cfg.text}</p>
        </div>
      </div>
    )
  });

  let carousel_indicators = props.banners.map( (cfg, index) => {
    return (
      <li data-target="#myCarousel" key={index} data-slide-to={index} className={index ? '' : 'active'}></li>
    )
  });

  return (
    <div id="myCarousel" className="carousel slide" data-ride="carousel">
      <ol className="carousel-indicators">
        {carousel_indicators}
      </ol>

      <div className="carousel-inner">
        {carousel_items}
      </div>

      <a className="left carousel-control" href="#myCarousel" data-slide="prev">
        <span className="glyphicon glyphicon-chevron-left"></span>
        <span className="sr-only">Назад</span>
      </a>
      <a className="right carousel-control" href="#myCarousel" data-slide="next">
        <span className="glyphicon glyphicon-chevron-right"></span>
        <span className="sr-only">Вперёд</span>
      </a>
    </div>
  );
}

export default BannerComponent;
