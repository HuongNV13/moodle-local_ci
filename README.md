# CI local plugin

[![Build Status](https://github.com/moodlehq/moodle-local_ci/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/moodlehq/moodle-local_ci/actions/workflows/ci.yml) [![codecov](https://codecov.io/gh/stronk7/moodle-local_ci/graph/badge.svg?token=UOuiBCwsJf)](https://codecov.io/gh/stronk7/moodle-local_ci)

This local_ci plugin contains all the scripts needed
by Moodle CI servers to automate checks while
integration happens.

## Dependencies

+ Some checks require a MySQL, Moodle main-based site to be up and running.
+ Some checks require a PHP engine to run (other are pure shell scripts).
+ Some checks require the installation of 3rd part tools (phpunit...).
+ Some checks require the presence of local_moodlecheck local plugin.
+ To get all other dependencies installed, ensure that both composer and npm are run regularly.
+ You can run them standalone or also with the ease and functionalities coming with different tools like:
    - Jenkins: http://jenkins-php.org
    - GitHub workflows: https://docs.github.com/en/actions/language-and-framework-guides/using-php-with-github-actions
    - Travis: https://docs.travis-ci.com/user/languages/php/
    - Docker: https://github.com/moodlehq/moodle-php-apache
    - ...

## TODO

+ Complete the documentation.
+ Document each check properly.

## Self-versions

+ 20121112 - Eloy - Initial version of this README.md.
+ 20190722 - Eloy - Replace bogus link by some general information alternatives to use the scripts.
