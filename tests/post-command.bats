#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "Verify an image" {
  export BUILDKITE_PLUGIN_COSIGN_IMAGE="blah"

  stub buildkite-agent 'annotate "blah" : echo Annotation created'

  run "$PWD/hooks/post-command"

  assert_success
  assert_output --partial ""
  assert_output --partial ""

  unstub buildkite-agent
}
