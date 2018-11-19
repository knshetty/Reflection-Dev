import Ember from 'ember'

Software_Route = Ember.Route.extend(
  setupController: (controller, model) ->
    tabs = [
      Ember.Object.create({ title: 'MDSD', linkTo: 'research.software.mdsd' })
      Ember.Object.create({ title: 'DSL', linkTo: 'research.software.dsl' })
    ]
    controller.set('tabs', tabs)

  afterModel: ->
    @transitionTo('research.software.mdsd')
)

export default Software_Route
