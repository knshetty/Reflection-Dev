import Ember from 'ember'

IndexRoute = Ember.Route.extend(
  redirect: ->
    @transitionTo('mystory')
    #@transitionTo('projects')
)

export default IndexRoute
