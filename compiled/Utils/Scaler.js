// Generated by CoffeeScript 1.3.3
(function() {
  var Scaler;

  Scaler = {
    positions: function(positions, range_function, range_world) {
      var p, rate_x, rate_z, _i, _len, _results;
      rate_x = range_world.begin / range_function.begin;
      rate_z = range_world.end / range_function.end;
      _results = [];
      for (_i = 0, _len = positions.length; _i < _len; _i++) {
        p = positions[_i];
        p.x *= rate_x;
        _results.push(p.z *= rate_z);
      }
      return _results;
    }
  };

  this.Scaler = Scaler;

}).call(this);