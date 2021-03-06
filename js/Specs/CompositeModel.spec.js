// Generated by CoffeeScript 1.6.3
(function() {
  var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  describe('Auto model instances with a CompositeBin which', function() {
    beforeEach(function() {
      this.fuelInjector = new FuelInjector();
      this.engine = new Engine({}, {
        FuelInjector: this.fuelInjector
      });
      return this.auto = new Automobile({
        modelName: 'Ford'
      }, {
        Engine: this.engine
      });
      /*
      							Parts:
      								EngineParts:
      									fi: @fuelInjector
      */

    });
    it('should have made myInstances a public property', function() {
      return expect(this.auto.__.myInstances['Engine'].get('engineType')).toEqual('V8');
    });
    it('should have an Engine property', function() {
      return expect(this.auto.__.Engine.get('engineType')).toEqual('V8');
    });
    it('should have made getInstance a public method', function() {
      return expect(this.auto.__.getInstance('Engine').get('engineType')).toEqual('V8');
    });
    it('should have a hasPtr method that allows us to know what it holds given the name of the pointer', function() {
      return expect(this.auto.__.hasPtr('Engine')).toEqual(true);
    });
    it('should have a hasA method that allows us to know if it contains an instance of a given class', function() {
      return expect(this.auto.__.hasA(Engine)).toEqual(true);
    });
    it('should have a hasA method that allows us to know (recursively) if it contains an instance of a given class', function() {
      return expect(this.auto.__.hasA(FuelInjector, true)).toEqual(true);
    });
    it('with, the auto instance, should have attributes that are accessible', function() {
      return expect(this.auto.get('modelName')).toEqual('Ford');
    });
    it('should have a new property when added via the add method, and not when removed', function() {
      this.auto.__.add({
        Alarm: "I'm new"
      });
      expect(this.auto.__.Alarm).toEqual("I'm new");
      this.auto.__.remove('Alarm');
      return expect(__indexOf.call(this.auto, 'Alarm') >= 0).toEqual(false);
    });
    it('should not have any properties when removeAll is executed', function() {
      this.auto.__.removeAll();
      return expect(__indexOf.call(this.auto, 'Engine') >= 0).toEqual(false);
    });
    return it('should be started when the start method is called', function() {
      this.auto.startEngine();
      return expect(this.auto.isRunning()).toEqual(true);
    });
  });

}).call(this);
