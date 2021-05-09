#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

export BUILDKITE_BUILD_ID='4735ba57-80d0-46e2-8fa0-b28223a86586'
export BUILDKITE_BUILD_URL='https://buildkite.com/acme-inc/my-project/builds/1514'
export BUILDKITE_COMMIT='83a20ec058e2fb00e7fa4558c4c6e81e2dcf253d'
export BUILDKITE_MESSAGE='Added a great new feature'
export BUILDKITE_BUILD_CREATOR_EMAIL='samlockart@gmail.com'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/console
#
@test "Verify an image" {
  export BUILDKITE_PLUGIN_COSIGN_MODE="verify"
  export BUILDKITE_PLUGIN_COSIGN_IMAGE="samlockart/plugin-tester"
  export BUILDKITE_PLUGIN_COSIGN_TAGS=""

  run "$PWD/hooks/post-command"

  assert_success
  assert_output --partial ""
  assert_output --partial ""
}

@test "Verify an image with annotations" {
  export BUILDKITE_PLUGIN_COSIGN_MODE="verify"
  export BUILDKITE_PLUGIN_COSIGN_IMAGE="samlockart/plugin-tester"
  export BUILDKITE_PLUGIN_COSIGN_TAGS="key=value"


  run "$PWD/hooks/post-command"

  assert_success
  assert_output --partial ""
  assert_output --partial ""
}

@test "Verify an image with incorrect annotations" {
  export BUILDKITE_PLUGIN_COSIGN_MODE="verify"
  export BUILDKITE_PLUGIN_COSIGN_IMAGE="samlockart/plugin-tester"
  export BUILDKITE_PLUGIN_COSIGN_TAGS="key=someothervalue"


  run "$PWD/hooks/post-command"

  assert_failure
  assert_output --partial ""
  assert_output --partial ""
}

@test "Generate a signature with Buidkite annotations" {
  export BUILDKITE_PLUGIN_COSIGN_MODE="generate"
  export BUILDKITE_PLUGIN_COSIGN_IMAGE="samlockart/plugin-tester"
  export BUILDKITE_PLUGIN_COSIGN_TAGS="key=value"
  run "$PWD/hooks/post-command"

  assert_success
  assert_output --partial ""
  assert_output --partial ""
}
