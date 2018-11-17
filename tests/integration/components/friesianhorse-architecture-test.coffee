import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'friesianhorse-architecture', 'Integration | Component | friesianhorse-architecture', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{friesianhorse-architecture}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#friesianhorse-architecture}}
      template block text
    {{/friesianhorse-architecture}}
  """

  assert.equal @$().text().trim(), 'template block text'
