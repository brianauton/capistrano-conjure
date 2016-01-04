## Capistrano::Conjure

Capistrano-conjure adds commands for Capistrano 3.x that use [Conjure](https://github.com/brianauton/conjure) to create and update cloud servers suitable for deploying with Capistrano.

WARNING: Capistrano-conjure creates server instances and other resources using service provider accounts that you specify. In most cases this incurs service charges that will recur until you explicitly cancel them. You are responsible for all charges incurred through your use of Capistrano-conjure.

WARNING: Capistrano-conjure attempts to have a good security model and to treat your code and data responsibly, but this is not guaranteed. You are responsible for the security and confidentiality of the code of applications deployed with Capistrano-conjure, the data handled by these applications, and your service credentials and public keys used for deployment.

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-conjure'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-conjure

### Usage

Add this line to your `Capfile`:

``` ruby
require 'capistrano/conjure'
```

Then you can provision a new server for any stage defined in your Capistrano configuration:

``` bash
$ cap staging conjure:provision
```

After provisioning is complete, you'll see some data about the new instance that needs to be added back to your capistrano configuration. For example,

```bash
Provisioning complete. Add the following settings to Capistrano:
  ip_address: 11.22.33.44
  port: 2222
  user: app
```

You'll need to add these values to the configuration for your Capistrano stage before you can deploy. For example, if the stage you just provisioned is defined in `config/deploy/staging.rb`, you could change the first line of the file to this:

```ruby
server "11.22.33.44", roles: [:web, :app, :db], user: "app", port: 2222
```

Then you're ready to deploy to your new server instance as normal.

```bash
cap staging deploy
```

### Updating an existing instance

Conjure can update existing server instances, to continue an interrupted provisioning or to rebuild any containers that are missing.

```bash
cap staging conjure:update
```

This will expect to find a Conjure-provisioned server at the IP address configured for the stage. If you want to update an existing server to the latest version of Conjure or change its provisioning options, you can manually delete the `passenger` Docker container from the server and then use this command (an easier way to do this may be added in the future).

### Conjure options

Conjure has several options that control the staging instance and the environment that it contains for running your Rails application. All these options are listed in the README file for the [Conjure project](https://github.com/brianauton/conjure). You can add any of these options to the `conjure_options` setting in your Capistrano configuration, and they'll be used for all conjure-related commands. For example, you could add this to your `config/deploy/staging.rb`:

```ruby
set :conjure_options, {
  max_upload_mb: 300,
  system_packages: [:pdftk],
}
```

### Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec capistrano-conjure` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/brianauton/capistrano-conjure](https://github.com/brianauton/capistrano-conjure).
