# README

## Project setup

### Install Ruby

1. Install a ruby version manager

   To do so, you can install [RVM](https://rvm.io/rvm/install)

2. Check the ruby version on `.ruby-version` file and install it on your local env.
   Install that specific version with

   ```bash
   rvm install "ruby-x.y.z"
   ```

3. Install bundler

   ```bash
   gem install bundler
   ```

4. Install all dependencies

   ```bash
   bundle install
   ```

#### Configuration

Ask for the `config/master.key` file

#### Database creation/initialization

```bash
rails db:setup
```

#### How to run the test suite

```bash
rspec
```

#### Services (job queues, cache servers, search engines, etc.)

Not apply yet.

#### Linters and checks

```bash
rubocop
```

```bash
reek
```

#### Run dev server

```bash
bin/dev
```

or

```bash
rails tailwindcss:watch
rails server

```
