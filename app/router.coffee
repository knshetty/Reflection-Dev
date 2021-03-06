import Ember from 'ember'
import config from './config/environment'

Router = Ember.Router.extend(
  location: config.locationType,
  rootURL: config.rootURL
)

Router.map ->
  @route 'mystory'
  @route 'research', ->
    @route 'analytics', ->
      @route 'algotrading'
      @route 'infovis'
    @route 'software', ->
      @route 'mdsd',
      @route 'dsl'
    @route 'robotics'
  @route 'projects', ->
    @route 'shirehorse'
    @route 'friesianhorse'
    @route 'hackneyhorse'
    @route 'norfolktrotter'
    @route 'markhor'
    @route 'nutcracker'
    @route 'hornet'
    @route 'manucode'

export default Router
