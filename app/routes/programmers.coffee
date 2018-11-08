import Ember from 'ember'

ProgrammersRoute = Ember.Route.extend(
    model: ->
      ['Kent Beck', 'Grady Booch']
)

export default ProgrammersRoute
