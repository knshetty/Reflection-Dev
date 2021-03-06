import Ember from 'ember'

Analytics_Route = Ember.Route.extend(
  setupController: (controller, model) ->
    tabs = [
      Ember.Object.create({ title: 'Algorithmic Trading', linkTo: 'research.analytics.algotrading' })
      Ember.Object.create({ title: 'Information Visualisation', linkTo: 'research.analytics.infovis' })
    ]
    controller.set('tabs', tabs)

  afterModel: ->
    @transitionTo('research.analytics.algotrading')
)

export default Analytics_Route
