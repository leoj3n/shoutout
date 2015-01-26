# Releasing 

Branching, versioning, and releasing Shoutout in a nutshell.

## Table of Contents

 * [Branching](#branching)
 * [Versioning](#versioning)
 * [Releasing](#releasing)

## Branching

Shoutout uses Vincent [Driessen's branching model][].

To help adhear to this model, please consider using [git-flow][]. Good primers
can be found at these resources:

- [Gitflow Workflow][]
- [git-flow cheatsheet][]
- [Why aren't you using git-flow?][]

## Versioning

For transparency into our release cycle and in striving to maintain backward
compatibility, Shoutout is maintained under the Semantic Versioning
guidelines. Releases will be numbered with the following format:

`<major>.<minor>.<patch>`

And constructed with the following guidelines:

* Breaking backward compatibility __bumps the major__ while resetting minor
  and patch.
* New additions without breaking backward compatibility __bumps the minor__
  while resetting the patch.
* Bug fixes and misc changes __bumps only the patch__.

For more information on SemVer, please visit <http://semver.org>.

## Releasing

Note: This section applies only to contributors with __commit access__.

### Using `git-flow`

Please use [git-flow][] with default settings.

1. Run `git flow release start X.Y.Z`. This checks out a branch named
  `release/X.Y.Z`. To cut the release on a past commit, instead use
  `git flow release start X.Y.Z fd89773`, where `fd89773` is the commit you
  want to target.
2. If this is a major release, run `git flow release publish X.0.0` so that
  other contributors can review and add last minute commits. Other
  contributors can then track the remote release branch with `git flow release
  track X.0.0`.
3. The final commit of the release should always be an edit of `CHANGELOG.md`,
  recording all of the __Features__, __Breaking Changes__, __Fixes__ and
  __Release Date__ included in the release. Generate the release date with
  this command: `echo "$(date -u '+%Y-%m-%d %H:%M:%S') UTC"`. For
  `CHANGELOG.md`, use the version string as a second-level heading and leave
  top-level bullet points even if there's nothing to report. The message of
  this final commit should be `Cut X.Y.Z`.
4. When finished adding commits, run `git flow release finish X.Y.Z`. This
  command opens three consecutive interactive prompts. For the __first__ and
  __third__ prompts, accept the default messages. For the __second__ prompt,
  enter `X.Y.Z`. Fix any conflicts that arise during this process.
5. After resolving the prompts, push the affected branches and tags
  __right away__ with `git push origin master develop` and
  `git push origin X.Y.Z`.
6. Once the tag has been pushed, find it on the [releases page][]. Click into
  it, and on the next page click __Add release notes__. Ensure the first
  input, __Tag version__, matches exactly the `X.Y.Z` string used to cut the
  release. The second input, __Release title__, should also be this exact
  string. The third and final input, __Describe this release__, should contain
  the `CHANGELOG.md` record minus the second-level heading.
7. Finally, click the __Publish release__ button and rejoice!

### Using `git`

1. Checkout a new branch for the release:
  `git checkout -b release/X.Y.Z develop`. To cut the release on a past
  commit, instead use `git checkout -b release/X.Y.Z fd89773`, where `fd89773`
  is the commit you want to target.
2. If this is a major release, run `git push -u origin release/X.Y.Z`. Other
  contributors can then track the remote branch with
  `git checkout -t origin/release/X.Y.Z`.
3. Follow No. 3 under [Using git-flow](#using-git-flow).
4. When finished adding commits, you will need to merge with master, add a tag
  message, and merge with develop. First, ensure origin is up-to-date:
  `git pull origin`. Next, run
  `git checkout master` and `git merge --no-ff release/X.Y.Z`, accepting the
  default message. Now do the tagging: `git tag -a X.Y.Z -m X.Y.Z`. Next, run
  `git checkout develop` and `git merge --no-ff release/X.Y.Z`, fixing any
  conflicts and accepting the default message. At this point it's safe to
  remove the release branch: `git branch -d release/X.Y.Z`.
5. Follow No. 5 under [Using git-flow](#using-git-flow).
6. Follow No. 6 under [Using git-flow](#using-git-flow).
7. Follow No. 7 under [Using git-flow](#using-git-flow).

[Driessen's branching model]: http://nvie.com/posts/a-successful-git-branching-model
[git-flow]: https://github.com/nvie/gitflow
[Why aren't you using git-flow?]: http://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow
[git-flow cheatsheet]: http://danielkummer.github.io/git-flow-cheatsheet
[Gitflow Workflow]: https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow
[releases page]: https://github.com/leoj3n/shoutout/releases
