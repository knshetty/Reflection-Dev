import Ember from 'ember'

Friesianhorse_Route = Ember.Route.extend(

  setupController: (controller, model) ->

    demoSPA_url = 'http://knshetty.github.io/ebook-searcher-app/'

    # --- Check 'Demo SPA' is alive + Initialise variables ---
    Ember.$.get(demoSPA_url).done( ->
      #console.log('FriesianHorse-SPA Available')
      controller.set('demo', true)
      controller.set('demoSPA_url', demoSPA_url)
    ).fail(->
      #console.log('FriesianHorse-Service Not Available!')
      controller.set('demo', false)
    )
)

export default Friesianhorse_Route
