import Ember from 'ember'

IndexRoute = Ember.Route.extend(

  redirect: ->
    #@transitionTo('mystory')
    @transitionTo('research')

)

export default IndexRoute
