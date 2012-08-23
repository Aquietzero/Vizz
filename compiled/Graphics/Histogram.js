// Generated by CoffeeScript 1.3.3
(function() {
  var Histogram;

  Histogram = (function() {

    function Histogram(raw_data, renderer) {
      this.raw_data = raw_data;
      this.renderer = renderer;
    }

    Histogram.prototype.process = function(curve, range) {
      var i, stops;
      stops = curve.stops(this.raw_data.length);
      Scaler.positions(stops, curve.range, range);
      return this.render_data = (function() {
        var _i, _ref, _results;
        _results = [];
        for (i = _i = 0, _ref = this.raw_data.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
          _results.push({
            pos: stops[i],
            val: this.raw_data[i]
          });
        }
        return _results;
      }).call(this);
    };

    Histogram.prototype.render = function() {
      var bar, i, pos, val, _i, _ref, _results;
      _results = [];
      for (i = _i = 0, _ref = this.render_data.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        pos = this.render_data[i].pos;
        val = this.render_data[i].val;
        bar = new Bar(5, val, 5, {
          x: pos.x,
          y: 0,
          z: pos.z
        }, 0x0000ff);
        _results.push(this.renderer.add(bar));
      }
      return _results;
    };

    Histogram.prototype.onCurve = function(curve, range) {
      this.process(curve, range);
      return this.render();
    };

    return Histogram;

  })();

  this.Histogram = Histogram;

}).call(this);
