import Ember from 'ember'

Itsmystoryslideshow_Component = Ember.Component.extend(

  didInsertElement: ->
    @$(".slideshow").focus()

)

export default Itsmystoryslideshow_Component
