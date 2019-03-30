# Info

This action wrappers the [aktau/github-release](https://github.com/aktau/github-release) so
that it can be used as a normal GitHub Action.

Inspired from https://github.com/vsoch/pull-request-action

## Testing

Still much to do, like setting up a `Dockerfile.test` and bats to go with it.

- build it: `docker build -t github-release .`
- test command: `docker run -e GITHUB_TOKEN -it --rm github-release <command>`

## Setup a workflow

```
action "Release" {
  uses = "wenlock/actions/github-release@master"
  args = "release"
}
```

## Commands
- `help` : display some help from `github-release`
- `release` : release the current repo
- `version` : show the current `github-release` version
- `tag` : tag up a current repo and generate the version from a `./VERSION` file if found.
