
class window.CompositeBin

	#accept the map that is the options portion of the Backbone.Model constructor
	constructor: (instanceNameMap) ->
		@myInstances = instanceNameMap

		@getInstance = (name)->
			instanceNameMap[name]
			
		@setInstance = (name, value)->
			instanceNameMap[name] = value 

		#dynamically create a property on the CompositeBin instance for each object in the options map
		#works in all modern browsers and IE > 8
		@buildProperties = (obj) ->
		
			buildGetter = (name) ->
				-> @getInstance(name)

			buildSetter = (name) ->
				(value) -> @setInstance(name, value)
		
			for key, val of instanceNameMap
				Object.defineProperty obj, key,
					get: buildGetter key
					set: buildSetter key
					enumerable: true
					configurable: true
					

		@buildProperties(@)
	
	#Add a new property dynamically
	add: (map) =>
		for key, val of map
			Object.defineProperty @, key,
				get: -> val
				set: (newVal) -> val = newVal
				enumerable: true
				configurable: true
				

	#Remove a property, if necessary
	remove: (propName) ->
		delete @[propName]
		
	#Remove all properties of the CompositeBin instance if you desire
	removeAll: ->
		for key, val of @myInstances
			delete @[key]
		
	
	#Performs a depth first search for properties with a particular class name
	hasADFS: (className, obj)->
		if obj is null or not obj instanceof Object
			return false
			
		for key, val of obj
			if val is null || _.isFunction(val) || not _.isObject(val)
				continue

			if val instanceof className
				console.log('hasADFS found ' + className + ' in ' + key)
				return true
			else if not (val instanceof className) and val instanceof Object
				console.log("key: " + key + " recursing val")
				if not @hasADFS(className, val)
					continue
				else
					return true		

		return false
	
	#Use if you want to know if an object has a reference to a specific class or "type"
	#Could be modified to return the actual object, of course	
	hasA: (className, recurse)->
		if arguments[1] is undefined or arguments[1] is false
			for key, val of @myInstances
				if val is null || _.isFunction(val)
					continue
	
				if val instanceof className
					return true
				
				#else if not (val instanceof className) and val instanceof Object and arguments[1] isnt undefined and arguments[1] is true
				#	return @hasADFS(className, val)
		else
			return @hasADFS(className, @myInstances)
				
		return false
		
	hasPtr: (ptrName)->
		if @myInstances[ptrName] is null then false else true
		

class window.CompositeModel extends Backbone.Model

	#override the Backbone.Model constructor -- setting up our CompositeBin, and then
	#allow Backbone.Model to run its constructor
	constructor: (attributes, options)->
		@__ = new CompositeBin(options)
		Backbone.Model.apply(@, arguments)

#When your Shui ain't Funging, homes
Backbone.SF = {}
Backbone.SF.CompositeModel = window.CompositeModel

	

