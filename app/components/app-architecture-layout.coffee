import Ember from 'ember'

AppArchitectureLayout_Component = Ember.Component.extend(

  # Load "svg" argument (1st argument) passed to this component
  svg: Ember.computed('arguments.[]', -> @arguments[0])

  snapsvgInit: ->
    draw = Snap('#app-architecture-layout-svg')
    @set('draw', draw)

  didInsertElement: ->

    @snapsvgInit()
    s = @get('draw')

    Snap.load(@svg, (f) ->
      g = f.select("g")
      s.append(g)

      # On insertion, will trigger fade-in animation through CSS
      s.addClass("fadeIn fadeIn-1s")
    )

).reopenClass(positionalParams: 'arguments') # Component arguments extractor (extract all arguments passed to this component)

export default AppArchitectureLayout_Component
