# Dokku for GitHub Actions

Deploy an application to your Dokku server over SSH.

## Usage

To use the action add the following lines to your `.github/workflows/main.yml`

```yaml
name: deploy

on:
  push:
    branches:
      - master

jobs:
  deploy:
    runs-on: ubuntu-18.04

    steps:
      - name: Checkout
        uses: actions/checkout@v1

      - name: Deploy the application
        uses: thadeu/dokku-for-github-actions@master
        with:
          BRANCH: master
          PROJECT: project-name
          SSH_PRIVATE_KEY: ${{ secrets.DOKKU_PRIVATE_KEY }}
          SSH_PUBLIC_KEY: ${{ secrets.DOKKU_PUBLIC_KEY }}
          SSH_HOST: ${{ secrets.DOKKU_HOST }}
          SSH_OPTIONS: --force --port 22
```

### Required Secrets

You'll need to provide some secrets to use the action.

- DOKKU_PRIVATE_KEY: Your SSH private key.
- DOKKU_PUBLIC_KEY: Your SSH public key.
- DOKKU_HOST: Your Host

# Required Environments

You'll need to provide some env to use the action.

- **BRANCH**: Repository branch that should be used for deploy: ie, `master`
- **PROJECT**: The project is Dokku project name.
- **SSH_PRIVATE_KEY**: Your SSH private key.
- **SSH_PUBLIC_KEY**: Your SSH public key.
- **SSH_HOST**: The host the action will SSH to run the git push command. ie, `your.site.com`.
- **SSH_OPTIONS**: Your options to SSH Connection

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
