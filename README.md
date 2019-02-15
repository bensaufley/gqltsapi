# babelts-starter

babelts-starter is a basic setup for a server-side Node application written
in TypeScript and using [`@babel/preset-typescript`]. It requires [Docker].

## Structure

- TypeScript code to be compiled goes in [`src`](/src).
- Tests go in [`test/src`](/test/src) and should mimick the directory structure
  of `src` with the addition of `.spec` to the filename. E.g., if you have a
  file at `src/lib/myFunc.ts`, your test would be at
  `test/src/lib/myFunc.spec.ts`.
- Running `yarn build` empties [`.build`](/build) and outputs compiled JS to
  that directory.

## Scripts

### [scripts to rule them all]

- `script/bootstrap` - installs/updates all dependencies
- `script/setup` - sets up a project to be used for the first time
- `script/update` - updates a project to run at its current version
- `script/server` - starts app
- `script/test` - runs tests
- `script/cibuild` - invoked by continuous integration servers to run tests
- `script/console` - opens a console

### Other [Yarn]-based scripts

- `yarn build`: builds TS files to JS files in `.build` directory
- `yarn lint:ts`: Runs `tslint` on TypeScript codebase
- `yarn lint:types`: Runs `tsc` to type-check TypeScript codebase

[`@babel/preset-typescript`]: https://babeljs.io/docs/en/babel-preset-typescript
[Docker]: https://www.docker.com
[scripts to rule them all]: https://githubengineering.com/scripts-to-rule-them-all/
[Yarn]: https://yarnpkg.com
