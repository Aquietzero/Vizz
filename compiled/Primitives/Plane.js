// Generated by CoffeeScript 1.3.3
(function() {
  var Geometry, Plane,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Geometry = this.Vizz.Primitive.Geometry;

  Plane = (function(_super) {

    __extends(Plane, _super);

    Plane.prototype.CONFIG = {
      color: 0x0000ff,
      opacity: 0.8
    };

    function Plane(size, pos, config) {
      var geom, mesh;
      this.size = size;
      this.setConfig(config, this.CONFIG);
      geom = new THREE.CubeGeometry(this.size, 1, this.size);
      mesh = new THREE.MeshLambertMaterial({
        color: this.CONFIG.color,
        opacity: this.CONFIG.opacity,
        trasparent: true
      });
      Plane.__super__.constructor.call(this, geom, mesh, pos);
    }

    return Plane;

  })(Geometry);

  this.Vizz.Primitive.Plane = Plane;

}).call(this);
