// Generated by CoffeeScript 1.3.3
(function() {
  var Graph, LineChart, Scaler, Segment, Sphere, Vector3,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Vector3 = this.Vizz.Core.Vector3;

  Scaler = this.Vizz.Core.Scaler;

  Segment = this.Vizz.Primitive.Segment;

  Sphere = this.Vizz.Primitive.Sphere;

  Graph = this.Vizz.Graphics.Graph;

  LineChart = (function(_super) {

    __extends(LineChart, _super);

    function LineChart(raw_data, renderer) {
      this.raw_data = raw_data;
      this.renderer = renderer;
      LineChart.__super__.constructor.call(this);
    }

    LineChart.prototype.process = function(curve, range) {
      var i, stops;
      stops = curve.stops(this.raw_data.length);
      curve.scale(stops, range);
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

    LineChart.prototype.render = function() {
      var i, point, pos_curr, pos_next, segment, val_curr, val_next, _i, _ref, _results;
      _results = [];
      for (i = _i = 1, _ref = this.render_data.length; 1 <= _ref ? _i < _ref : _i > _ref; i = 1 <= _ref ? ++_i : --_i) {
        pos_curr = this.render_data[i - 1].pos;
        pos_next = this.render_data[i].pos;
        val_curr = this.render_data[i - 1].val;
        val_next = this.render_data[i].val;
        segment = new Segment(new Vector3(pos_curr.x, val_curr, pos_curr.z), new Vector3(pos_next.x, val_next, pos_next.z));
        segment.solid(2, 0xffff00);
        point = new Sphere(5, {
          x: pos_curr.x,
          y: val_curr,
          z: pos_curr.z
        }, 0xffff00);
        this.renderer.add(segment);
        _results.push(this.renderer.add(point));
      }
      return _results;
    };

    LineChart.prototype.onCurve = function(curve, range) {
      this.process(curve, range);
      return this.render();
    };

    return LineChart;

  })(Graph);

  this.Vizz.Graphics.LineChart = LineChart;

}).call(this);
