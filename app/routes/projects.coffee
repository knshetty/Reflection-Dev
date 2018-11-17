import Ember from 'ember'

ProjectsRoute = Ember.Route.extend(
  setupController: (controller, model) ->
    tabs = [
      Ember.Object.create({ title: 'Shire Horse - 2017', linkTo: 'projects.shirehorse' })
      Ember.Object.create({ title: 'Friesian Horse - 2015', linkTo: 'projects.friesianhorse' })
      Ember.Object.create({ title: 'Hackney Horse - 2015', linkTo: 'projects.hackneyhorse' })
      Ember.Object.create({ title: 'Norfolk Trotter - 2015', linkTo: 'projects.norfolktrotter' })
      Ember.Object.create({ title: 'Markhor - 2014', linkTo: 'projects.markhor' })
      Ember.Object.create({ title: 'Nutcracker/Rooks - 2012', linkTo: 'projects.nutcracker' })
      Ember.Object.create({ title: 'Hornet - 2012', linkTo: 'projects.hornet' })
      Ember.Object.create({ title: 'Manucode/SnailShell - 2011', linkTo: 'projects.manucode' })
    ]
    controller.set('tabs', tabs)

  afterModel: ->
    @transitionTo('projects.friesianhorse')
)

export default ProjectsRoute
