#!/usr/bin/env bats

load libs/shared_setup

statedir=$LOCAL_CI_TESTS_CACHEDIR/illegal_whitespace_state/

setup () {
    create_git_branch MOODLE_31_STABLE v3.1.1

    # Reset state between runs.
    if [ -d $statedir ]; then
        cp -R $statedir/. $WORKSPACE
    fi
}

teardown () {
    # Save state between individual runs
    mkdir -p $statedir
    cp -R $WORKSPACE/. $statedir
}

@test "illegal_whitespace: first run OK" {
    # Ensure initial state is clean.
    clean_workspace_directory

    # On first run, there are no results to compare to so should always
    # pass.
    ci_run illegal_whitespace/illegal_whitespace.sh

    assert_success
    assert_output --partial "current count: 959"
    # The 'no previously recorded value' number is 999999
    assert_output --partial "previous count: 999999"
    assert_output --partial "best count: 999999"
    assert_output --partial "got best results ever, yay!"
}

@test "illegal_whitespace: normal state OK" {
    # On second run, should still pass with same results
    ci_run illegal_whitespace/illegal_whitespace.sh

    assert_success
    assert_output --partial "current count: 959"
    assert_output --partial "previous count: 959"
    assert_output --partial "best count: 959"
    assert_output --partial "continue in best results ever"
}

@test "illegal_whitespace: failure reported when whitespace error detected" {
    # Lets introduce a whitespace error and ensure it fails
    git_apply_fixture 31-whitespace-error.patch

    ci_run illegal_whitespace/illegal_whitespace.sh
    assert_failure
    assert_output --partial "current count: 961"
    assert_output --partial "previous count: 959"
    assert_output --partial "best count: 959"
    assert_output --partial "worse results than previous counter"
}

@test "illegal_whitespace: clean up state" {
    # Not a real test, just allows us to avoid storing state after
    # the rest of the test suite has run.
    clean_workspace_directory
}