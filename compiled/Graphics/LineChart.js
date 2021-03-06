// Generated by CoffeeScript 1.3.3
(function() {
  var Curve, Graph, LineChart, Range, Scaler, Segment, Sphere, Vector3,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Vector3 = this.Vizz.Core.Vector3;

  Range = this.Vizz.Core.Range;

  Curve = this.Vizz.Core.Curve;

  Scaler = this.Vizz.Core.Scaler;

  Segment = this.Vizz.Primitive.Segment;

  Sphere = this.Vizz.Primitive.Sphere;

  Graph = this.Vizz.Graphics.Graph;

  LineChart = (function(_super) {

    __extends(LineChart, _super);

    LineChart.prototype.CONFIG = {
      basic: null,
      curve: new Curve((function() {
        return 0;
      }), 'CARTESIAN', new Range(-6, 6), 0.01),
      range: new Range(-220, 220),
      type: 'SOLID'
    };

    function LineChart(raw_data, renderer, config) {
      this.raw_data = raw_data;
      this.renderer = renderer;
      this.setConfig(config, this.CONFIG);
      LineChart.__super__.constructor.call(this);
      this.onCurve();
    }

    LineChart.prototype.process = function() {
      var i, stops;
      stops = this.CONFIG.curve.stops(this.raw_data.length);
      this.CONFIG.curve.scale(stops, this.CONFIG.range);
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
        segment = new Segment(new Vector3(pos_curr.x, val_curr, pos_curr.z), new Vector3(pos_next.x, val_next, pos_next.z), this.CONFIG.basic.line);
        switch (this.CONFIG.type) {
          case 'SOLID':
            segment.solid();
            break;
          case 'DOTTED':
            segment.dotted();
        }
        point = new Sphere({
          x: pos_curr.x,
          y: val_curr,
          z: pos_curr.z
        }, this.CONFIG.basic.point);
        this.renderer.add(segment);
        this.renderer.add(point);
        _results.push(this.graph_data.push(point));
      }
      return _results;
    };

    return LineChart;

  })(Graph);

  this.Vizz.Graphics.LineChart = LineChart;

}).call(this);
