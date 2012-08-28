# Configuration Pattern

Since Vizz is a library that makes data visualization easy and convenient, so the configuration of data visualization should be easy and intuitive. Here comes some configuration examples.


## Histogram

    var histogram = new Vizz.Graphics.Histogram(
      Data, {
        curve      : curve,
        dimension  : 1,
        color      : 0x0000ff,
        opacity    : 0.8,
        bar_radius : 5,
      }
    ).add('coordinate_system', {
      x        : false,
      y        : true,
      z        : false,
      color    : 0x0000ff,
      opacity  : 0.3,
      position : pos,
    })
