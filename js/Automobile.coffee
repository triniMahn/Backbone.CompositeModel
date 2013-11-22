
class window.FuelInjector extends Backbone.Model
	
class window.Engine extends Backbone.SF.CompositeModel
	
	initialize: (attributes, options) ->
	
	defaults:
		engineType: 'V8'
		started: false	
		
	start: =>
		@set('started', true)
		console.log(@get('engineType') + ' engine started')
		
	isStarted: =>
		@get('started')

class window.Automobile extends Backbone.SF.CompositeModel

	initialize: (attributes,options)->
		#@modelName = options.modelName
		
	defaults:
		modelName: null
	
	#modelName: null
	
	startEngine: =>
		@__.Engine.start()
		
	isRunning: =>
		@__.Engine.isStarted()
