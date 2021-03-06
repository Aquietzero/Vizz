// Generated by CoffeeScript 1.3.3
(function() {
  var Coordinate, Distance, Range, Scaler, Surface;

  Range = Vizz.Core.Range;

  Scaler = Vizz.Core.Scaler;

  Distance = Vizz.Core.Distance;

  Coordinate = Vizz.Core.Coordinate;

  Surface = (function() {

    function Surface(func, rect) {
      this.func = func;
      this.rect = rect;
    }

    Surface.prototype.stops = function(m, n) {
      var curr_x, curr_z, i, j, step_x, step_z, stops, x, z, _i, _j;
      x = this.rect.x.begin;
      z = this.rect.z.begin;
      step_x = this.rect.x.length() / m;
      step_z = this.rect.z.length() / n;
      stops = [];
      for (i = _i = 0; 0 <= m ? _i < m : _i > m; i = 0 <= m ? ++_i : --_i) {
        for (j = _j = 0; 0 <= n ? _j < n : _j > n; j = 0 <= n ? ++_j : --_j) {
          curr_x = x + step_x * i;
          curr_z = z + step_z * j;
          stops.push({
            x: curr_x,
            y: this.func(curr_x, curr_z),
            z: curr_z
          });
        }
      }
      return stops;
    };

    return Surface;

  })();

  this.Vizz.Core.Surface = Surface;

}).call(this);
