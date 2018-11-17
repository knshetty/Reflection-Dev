import Ember from 'ember'

FriesianhorseController = Ember.Controller.extend(
  actions:
    fire_demo: ->
      window.open(@get('demoSPA_url'))
)

export default FriesianhorseController
