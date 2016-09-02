# capistrano-deploy\_into\_docker

Mini support task file for deploy into docker.

## Installation

Add in your Gemfile

```ruby
gem 'capistrano-deploy_into_docker'
```

## HowTo: deploy your rails appinto docker

### add sshkit supports docker backend

Currently docker backend is not merged yet into upsatrem.
You need to fetch gem from my github repository.

Add this line to Gemfile:

```ruby
gem 'sshkit', github: 'sugi/sshkit', branch: 'docker-backend', group: :development
```

When upstream merges docker backend, you do NOT need this.

### require task on Capfile

Add following like to your Capfile;

```ruby
require 'capistrano/deploy_into_docker'
```

This just add deploy_into_docker:commit task.

### deploy setting

Here is an example for config/deploy/docker.rb;

```ruby
set :branch, 'production'
set :deploy_to, '/var/local/app'
set :git_shallow_clone, 1
fetch(:default_env).merge!(rails_env: :production, SECRET_KEY_BASE: 'dummy', DEVISE_SECRET_KEY: 'dummy')

fetch(:linked_dirs, []).clear
fetch(:linked_files, []).clear

server docker: {
    image: 'sugi/rails-base',
    commit: 'myapp-web',
  }, user: 'rails:rails', roles: %w{web app}
```

## Server definition as Docker host

You need to set docker environment as host infomation hash.
The hash requires **:image** (or :container) key to run.

```ruby
server docker: {image: 'sugi/rails-base:latest'}
```

If you set **:commit** key, run "docker commit" after deploy automatically.

```ruby
server docker: {
    image: 'sugi/rails-base:latest',
    commit: 'new-image-name:tag',
  }, user: 'nobody:nogroup', roles: %w{web app}
```

In addtion, you can add any options for "docker run". for example;

```ruby
server docker: {
    image: 'sugi/rails-base:latest',
    commit: 'new-image-name:tag',
    volume: ['/storage/tmp:/tmp', '/storage/home:/home'],
    network: 'my-net',
    dns: '8.8.8.8',
    dns_search: 'example.com',
    cap_add: ['SYS_NICE', 'SYS_RESOURCE'],
  }, user: 'nobody:nogroup', roles: %w{web app}
```

## License

Author: Tatsuki Sugiura

Files are distributed under [MIT License](https://opensource.org/licenses/MIT).