# Nexplore E2EP Development Tools

Development Tools/Script for enhancing the E2EP team development experience.

Developed for Windows.

_But this repo contains both shell and batch script because I am a maniac_

**Please assume configuration of value is needed inside `.bat` files**

## `database/azure`

> Before using this, please setup your remote env by following [this](https://nexplore.atlassian.net/wiki/spaces/E2EPMINA/pages/2369093819/How+to+create+a+new+latest+environment).

[Reference](https://nexplore.atlassian.net/wiki/spaces/E2EPMINA/pages/2346549771/How+to+connect+to+postgres+database)

### Core Feature:

1. Setup `kubectl` to use the remote namespace.
1. Shortcut for port-forward the remote DB to localhost

## `database/start-mina-local-db`

> Flyway CLI is needed for migration, please install it beforehand

### Core Feature:

1. Create a local docker postgres container
1. Migrate the database using migration files from Minerva

## `database/mina-db-clone`

### Core Feature:

1. Create dump of database on public environment
1. Restore the dump to development namespace

## `github/helper`

> This is a NPM package, run `npm i`

Get a API token from [here](https://id.atlassian.com/manage-profile/security/api-tokens)

### Core Feature:

1. Generate PR message according to JIRA ticket
1. Generate branch name according to JIRA ticket

### Usage

`generate-branch.bat [Ticket ID] [copyToClipboard]`

`generate-pr.bat [Ticket ID] [copyToClipboard]`
