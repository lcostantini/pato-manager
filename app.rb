#!/usr/bin/env ruby
require './config/application'
require 'commander/import'
require 'httparty'
require 'json'

program :name, 'Todos'
program :version, '0.0.1'
program :description, 'A console application to keep tracking of your todo lists'

default_command :todo

command :todo do |c|
  c.syntax = '[options]'
  c.description = 'List all the todo tasks'
  c.action do
    response = HTTParty.get "#{ ENV['LOCALHOST_URL'] }"
    say "#{ response }"
  end
end

command :new do |c|
  c.syntax = 'new [options]'
  c.description = 'Create a new task'
  c.option '--d STRING', String, 'Adds a description for a task'
  c.action do |args, options|
    name = args.join(' ') || ask("Name: ")
    params = { task: { name: name, description: options.d } }
    response = HTTParty.post "#{ ENV['LOCALHOST_URL'] }", headers: {'Content-Type' => 'application/json'}, body: params.to_json
    say "# OK" if response.code == 201
  end
end

command :all do |c|
  c.syntax = 'all [options]'
  c.description = 'List all the tasks'
  c.action do
    response = HTTParty.get "#{ ENV['LOCALHOST_URL'] }/all"
    say "#{ response }"
  end
end

command :update do |c|
  c.description = 'Update a task'
  c.option '--n STRING', String, 'Adds a new name for a task'
  c.option '--d STRING', String, 'Adds a new description for a task'
  c.action do |args, options|
    id = args.join('')
    params = { task: { name: options.n, description: options.d } }
    response = HTTParty.put "#{ ENV['LOCALHOST_URL'] }/#{ id }", headers: {'Content-Type' => 'application/json'}, body: params.to_json
    say "# OK" if response.code == 200
  end
end

command :done do |c|
  c.description = 'Mark a task as done'
  c.action do |args|
    id = args.join('')
    response = HTTParty.put "#{ ENV['LOCALHOST_URL'] }/#{ id }/done"
    say "# OK" if response.code == 200
  end
end

command :undone do |c|
  c.description = 'Mark a task as done'
  c.action do |args|
    id = args.join('')
    response = HTTParty.put "#{ ENV['LOCALHOST_URL'] }/#{ id }/undone"
    say "# OK" if response.code == 200
  end
end

command :delete do |c|
  c.description = 'Delete a task'
  c.action do |args|
    id = args.join('')
    response = HTTParty.delete "#{ ENV['LOCALHOST_URL'] }/#{ id }"
    say "# OK" if response.code == 200
  end
end
