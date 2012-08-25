// Generated by CoffeeScript 1.3.3
(function() {
  var Geometry, Sphere,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Geometry = this.Vizz.Primitive.Geometry;

  Sphere = (function(_super) {

    __extends(Sphere, _super);

    function Sphere(radius, pos, color) {
      var geom, mesh;
      geom = new THREE.SphereGeometry(radius, 50, 50);
      mesh = new THREE.MeshLambertMaterial({
        color: color
      });
      Sphere.__super__.constructor.call(this, geom, mesh, pos);
    }

    return Sphere;

  })(Geometry);

  this.Vizz.Primitive.Sphere = Sphere;

}).call(this);
