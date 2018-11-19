import Ember from 'ember'

Research_Route = Ember.Route.extend(
  setupController: (controller, model) ->
    tabs = [
      Ember.Object.create({ title: 'Big Data / Analytics', linkTo: 'research.analytics' })
      Ember.Object.create({ title: 'Software Engineering', linkTo: 'research.software' })
      Ember.Object.create({ title: 'Robotics', linkTo: 'research.robotics' })
    ]
    controller.set('tabs', tabs)

  afterModel: ->
    @transitionTo('research.analytics')
)

export default Research_Route
