// Generated by CoffeeScript 1.6.3
(function() {
  var _ref, _ref1, _ref2,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.FuelInjector = (function(_super) {
    __extends(FuelInjector, _super);

    function FuelInjector() {
      _ref = FuelInjector.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    return FuelInjector;

  })(Backbone.Model);

  window.Engine = (function(_super) {
    __extends(Engine, _super);

    function Engine() {
      this.isStarted = __bind(this.isStarted, this);
      this.start = __bind(this.start, this);
      _ref1 = Engine.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    Engine.prototype.initialize = function(attributes, options) {};

    Engine.prototype.defaults = {
      engineType: 'V8',
      started: false
    };

    Engine.prototype.start = function() {
      this.set('started', true);
      return console.log(this.get('engineType') + ' engine started');
    };

    Engine.prototype.isStarted = function() {
      return this.get('started');
    };

    return Engine;

  })(Backbone.SF.CompositeModel);

  window.Automobile = (function(_super) {
    __extends(Automobile, _super);

    function Automobile() {
      this.isRunning = __bind(this.isRunning, this);
      this.startEngine = __bind(this.startEngine, this);
      _ref2 = Automobile.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    Automobile.prototype.initialize = function(attributes, options) {};

    Automobile.prototype.defaults = {
      modelName: null
    };

    Automobile.prototype.startEngine = function() {
      return this.__.Engine.start();
    };

    Automobile.prototype.isRunning = function() {
      return this.__.Engine.isStarted();
    };

    return Automobile;

  })(Backbone.SF.CompositeModel);

}).call(this);