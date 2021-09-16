# iOS intern

Internship for Kryvy Rih IDAP office. Please, note, that you should live in Kryvy Rih or its vicinity to apply for internship.

## General

Below is the first stage task, that you need to implement in order to be assessed as a possible internship candidate. The assessment is a 2-step process:

1. coding solution;
2. on-site interview.

There are no requirements to the OS or programming language used for task implementation. First- and third-party libraries that implement the whole task are not permitted.

Solutions would be assessed based on the following criteria:

* decomposition;
* extensibility;
* reusability;
* DRY and KISS;
* polish.

Applicants should provide the solution asap. To ship the solution, create the pull request to this repo with your solution placed into: Internship/iOS/2021-KR/<Your Surname>. Please, make sure, that your GitHub profile has your contacts accessible and public.

Partial solutions are allowed, but would be ranked lower, than complete solutions.

## Task

Implement transformation library, that would transform input integer number into ordinal strings.

Examples of usage (input -> output):

* 1 -> "first"
* 124 -> "one hundred twenty fourth"

Requirements:

* It should work with additional languages (either programmatic rules or config files);
* It should have embedded German, English and Ukrainian transforms;
* It should transform numbers up to 10^15 - 1.
