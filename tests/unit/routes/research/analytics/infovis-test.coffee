import { moduleFor, test } from 'ember-qunit'

moduleFor 'route:research/analytics/infovis', 'Unit | Route | research/analytics/infovis', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
