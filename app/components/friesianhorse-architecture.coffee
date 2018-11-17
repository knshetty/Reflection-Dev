import Ember from 'ember'

ArchitectureComponent = Ember.Component.extend(

  snapsvgInit: ->
    draw = Snap('#friesianhorse-arch-svg')
    @set('draw', draw)

  didInsertElement: ->
    @snapsvgInit()
    s = @get('draw')

    Snap.load("/assets/images/projects/friesianhorse_architecture.svg", (f) ->
      g = f.select("g")
      s.append(g)

      # On insertion, will trigger fade-in animation through CSS
      s.addClass("fadeIn fadeIn-1s")
    )

)


export default ArchitectureComponent
