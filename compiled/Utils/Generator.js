// Generated by CoffeeScript 1.3.3
(function() {
  var Random;

  Random = this.Vizz.Utils.Random;

  this.Vizz.Utils.Generator = {
    randomArray: function(n, vibration) {
      var arr, x, _i, _results;
      _results = [];
      for (x = _i = 0; 0 <= n ? _i < n : _i > n; x = 0 <= n ? ++_i : --_i) {
        _results.push(arr = Random.range(0, vibration));
      }
      return _results;
    },
    randomGrid: function(x_range, z_range, vibration) {
      var grid, x, z;
      return grid = (function() {
        var _i, _results;
        _results = [];
        for (x = _i = 0; 0 <= x_range ? _i < x_range : _i > x_range; x = 0 <= x_range ? ++_i : --_i) {
          _results.push((function() {
            var _j, _results1;
            _results1 = [];
            for (z = _j = 0; 0 <= z_range ? _j < z_range : _j > z_range; z = 0 <= z_range ? ++_j : --_j) {
              _results1.push(Random.range(0, vibration));
            }
            return _results1;
          })());
        }
        return _results;
      })();
    }
  };

}).call(this);
