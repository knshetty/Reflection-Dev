import Ember from 'ember'

SoftwareRoute = Ember.Route.extend(
  setupController: (controller, model) ->
    tabs = [
      Ember.Object.create({ title: 'MDSD', linkTo: 'research.software.mdsd' })
      Ember.Object.create({ title: 'DSL', linkTo: 'research.software.dsl' })
    ]
    controller.set('tabs', tabs)

  afterModel: ->
    @transitionTo('research.software.mdsd')
)

export default SoftwareRoute
