import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'its-my-story-slideshow', 'Integration | Component | its-my-story-slideshow', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{its-my-story-slideshow}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#its-my-story-slideshow}}
      template block text
    {{/its-my-story-slideshow}}
  """

  assert.equal @$().text().trim(), 'template block text'
