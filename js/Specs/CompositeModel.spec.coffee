
describe 'Auto model instances with a CompositeBin which', ->
	
	beforeEach ->
		@fuelInjector = new FuelInjector()
		
		@engine = new Engine {}, FuelInjector: @fuelInjector
								
		@auto = new Automobile
							modelName: 'Ford'
						,
							Engine: @engine
		###
							Parts:
								EngineParts:
									fi: @fuelInjector
		###

		
	it 'should have made myInstances a public property', ->
		expect(@auto.__.myInstances['Engine'].get('engineType')).toEqual('V8')
		
	it 'should have an Engine property', ->
		expect(@auto.__.Engine.get('engineType')).toEqual('V8')

	it 'should have made getInstance a public method', ->
		expect(@auto.__.getInstance('Engine').get('engineType')).toEqual('V8')

	it 'should have a hasPtr method that allows us to know what it holds given the name of the pointer', ->
		expect(@auto.__.hasPtr('Engine')).toEqual(true)

	it 'should have a hasA method that allows us to know if it contains an instance of a given class', ->
		expect(@auto.__.hasA(Engine)).toEqual(true)

	it 'should have a hasA method that allows us to know (recursively) if it contains an instance of a given class', ->
		expect(@auto.__.hasA(FuelInjector,true)).toEqual(true)

	it 'with, the auto instance, should have attributes that are accessible', ->
		expect(@auto.get('modelName')).toEqual('Ford')
		
	it 'should have a new property when added via the add method, and not when removed', ->
		@auto.__.add(Alarm : "I'm new")
		expect(@auto.__.Alarm).toEqual("I'm new")
		@auto.__.remove('Alarm')
		expect('Alarm' in @auto).toEqual(false)

	it 'should not have any properties when removeAll is executed', ->
		@auto.__.removeAll()
		expect('Engine' in @auto).toEqual(false)
		
	it 'should be started when the start method is called', ->
		@auto.startEngine()
		expect(@auto.isRunning()).toEqual(true)



