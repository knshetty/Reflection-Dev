import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'tech-stack-physics', 'Integration | Component | tech-stack-physics', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{tech-stack-physics}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#tech-stack-physics}}
      template block text
    {{/tech-stack-physics}}
  """

  assert.equal @$().text().trim(), 'template block text'
