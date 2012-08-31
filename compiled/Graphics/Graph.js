// Generated by CoffeeScript 1.3.3
(function() {
  var Graph, PrimitiveCollection;

  PrimitiveCollection = this.Vizz.Primitive.PrimitiveCollection;

  Graph = (function() {

    function Graph() {
      this.graph_data = [];
      this.events = null;
    }

    Graph.prototype.process = function() {};

    Graph.prototype.render = function() {};

    Graph.prototype.onCurve = function() {
      this.process();
      return this.render();
    };

    Graph.prototype.setConfig = function(user_config, default_config) {
      var key, val, _results;
      _results = [];
      for (key in user_config) {
        val = user_config[key];
        if (default_config.hasOwnProperty(key)) {
          _results.push(default_config[key] = user_config[key]);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    Graph.prototype.on = function(event, attrs) {
      var obj, _i, _len, _ref;
      _ref = this.graph_data;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        obj = _ref[_i];
        obj.eventHandler.bind(event, attrs);
      }
      return this;
    };

    return Graph;

  })();

  this.Vizz.Graphics.Graph = Graph;

}).call(this);
