import { moduleFor, test } from 'ember-qunit'

moduleFor 'route:research/software', 'Unit | Route | research/software', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
