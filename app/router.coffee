import Ember from 'ember'
import config from './config/environment'

Router = Ember.Router.extend(
  location: config.locationType,
  rootURL: config.rootURL
)

Router.map ->
  # --------------------------------------------
  # Public routes
  # --------------------------------------------
  @route 'scientists'
  @route 'programmers'
  @route 'mystory'
  @route 'projects'
  @route 'research', ->
    @route 'analytics', ->
      @route 'algotrading'
      @route 'infovis'
    @route 'software', ->
      @route 'mdsd',
      @route 'dsl'
    @route 'robotics'

export default Router
