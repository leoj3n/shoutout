# Contributing

Looking to contribute something to Shoutout? __Here's how you can help.__

Please take a moment to review this document in order to make the contribution
process easy and effective for everyone involved.

Following these guidelines helps to communicate that you respect the time of
the developers managing and developing this open source project. In return,
they should reciprocate that respect in addressing your issue or assessing 
atches and features.

## Table of Contents

* [Using the Issue Tracker](#using-the-issue-tracker)
* [Bug Reports](#bug-reports)
* [Feature Requests](#feature-requests)
* [Pull Requests](#pull-requests)
* [Code Guidelines](#code-guidelines)
* [License](#license)

## Using the Issue Tracker

The [issue tracker][] is the preferred channel for
[bug reports](#bug-reports), [features requests](#feature-requests)
and [submitting pull requests](#pull-requests), but please respect the
following restrictions:

* Please __do not__ use the issue tracker for personal support requests. Stack
  Overflow ([`shoutout`][] tag) or [Gitter](README.md#community) are
  better places to get help.
 * Please __do not__ derail or troll issues. Keep the discussion on topic and
  respect the opinions of others.
 * Please __do not__ open issues or pull requests regarding the code in other
  repositories (open them in their respective repositories).

## Bug Reports

A bug is a _demonstrable problem_ that is caused by the code in the repository.
Good bug reports are extremely helpful, so thanks!

Guidelines for bug reports:

1. __Use the GitHub issue search__ &mdash; check if the issue has already been
  reported.
2. __Check if the issue has been fixed__ &mdash; try to reproduce it using the
  latest `master` or development branch in the repository.
3. __Isolate the problem__ &mdash; ideally create a [reduced test case][] and
  a live example. [This repository][] is a helpful template.

A good bug report shouldn't leave others needing to chase you up for more
information. Please try to be as detailed as possible in your report.
What is your environment?
What steps will reproduce the issue?
What browser(s) and OS experience the problem?
Do other browsers show the bug differently?
What would you expect to be the outcome?
All these details will help people to fix any potential bugs.

Example:

> Short and descriptive example bug report title

> A summary of the issue and the browser/OS environment in which it occurs.
> If suitable, include the steps required to reproduce the bug.

> 1. This is the first step
> 2. This is the second step
> 3. Further steps, etc.

> `<url>` - a link to the reduced test case

> Any other information you want to share that is relevant to the issue being
> reported. This might include the lines of code that you have identified as
> causing the bug, and potential solutions (and your opinions on their merits).

## Feature Requests

Feature requests are welcome. But take a moment to find out whether your idea
fits with the scope and aims of the project. It's up to *you* to make a strong
case to convince the project's developers of the merits of this feature.
Please provide as much detail and context as possible.

## Pull Requests

Good pull requests—patches, improvements, new features—are a fantastic help.
They should remain focused in scope and avoid containing unrelated commits.

__Please ask first__ before embarking on any significant pull request
(e.g. implementing features, refactoring code, porting to a different
language), otherwise you risk spending a lot of time working on something that
the project's developers might not want to merge into the project.

Please adhere to the [coding guidelines](#code-guidelines) used throughout the
project (indentation, accurate comments, etc.) and any other requirements
(such as test coverage).

Follow this process if you'd like your work considered for inclusion in the
project:

1. [Fork][] the project, clone your fork, and configure the remotes:

   ~~~bash
   # Clone your fork of the repo into the current directory
   git clone https://github.com/<your-username>/shoutout.git
   # Navigate to the newly cloned directory
   cd shoutout
   # Assign the original repo to a remote called "upstream"
   git remote add upstream https://github.com/leoj3n/shoutout.git
   ~~~

2. If you cloned a while ago, get the latest changes from upstream:

   ~~~bash
   git checkout develop
   git pull upstream develop
   ~~~

3. Create a new topic branch (off the main project development branch) to
  contain your feature, change, or fix:

   ~~~bash
   git checkout -b <topic-branch-name>
   ~~~

4. Commit your changes in logical chunks. Please adhere to these
  [git commit message guidelines][] or your code is unlikely be merged into
  the main project. Use Git's [interactive rebase][] feature to tidy up your
  commits before making them public.

5. Locally merge (or rebase) the upstream development branch into your topic
  branch:

   ~~~bash
   git pull [--rebase] upstream develop
   ~~~

6. Push your topic branch up to your fork:

   ~~~bash
   git push origin <topic-branch-name>
   ~~~

7. [Open a Pull Request][] with a clear title and description against the
  `develop` branch.

__IMPORTANT__: By submitting a patch, you agree to allow the project owners to
license your work under the the terms of the [MIT License](LICENSE).

## Code Guidelines

### HTML

* Always use proper indentation.
* Two spaces for indentation, never tabs.
* Double quotes only, never single quotes.
* Use tags and elements appropriate for an HTML5 doctype (e.g., self-closing
  tags).

### CSS

* End all lines with a semi-colon.
* Multiple-line approach (one property and value per line).
* For multiple, comma-separated selectors, place each selector on its own line.
* Avoid inheritance and over nesting—use single, explicit classes whenever
  possible.
* Always a space after a property's colon (e.g., `display: block;` and not
  `display:block;`).
* Attribute selectors should only be used where absolutely necessary (e.g.,
  form controls) and should be avoided on custom components for performance
  and explicitness.
* Series of classes for a component should include a base class (e.g.,
  `.component`) and use the base class as a prefix for modifier and sub-
  components (e.g., `.component-lg`).
* Attribute selectors, like `input[type="text"]` should always wrap the
  attribute's value in double quotes, for consistency and safety (see this
  [blog post on unquoted attribute values][] that can lead to XSS attacks).

### JS

* Comma last.
* strict mode.
* "Attractive".
* Use semicolons.
* 2 spaces (no tabs).
* [Idiomatic][].

## License

By contributing your code, you agree to license your contribution under the
[MIT License](LICENSE).

[issue tracker]: https://github.com/leoj3n/shoutout/issues
[`shoutout`]: http://stackoverflow.com/questions/tagged/shoutout
[reduced test case]: http://css-tricks.com/reduced-test-cases
[This repository]: https://github.com/necolas/issue-guidelines
[git commit message guidelines]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[interactive rebase]: https://help.github.com/articles/interactive-rebase
[Fork]: http://help.github.com/fork-a-repo
[Open a Pull Request]: https://help.github.com/articles/using-pull-requests
[blog post on unquoted attribute values]: http://mathiasbynens.be/notes/unquoted-attribute-values
[idiomatic]: https://github.com/rwaldron/idiomatic.js
