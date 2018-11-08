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
  @route 'research'
  @route 'projects'

export default Router
