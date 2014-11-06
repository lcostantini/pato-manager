#!/usr/bin/env ruby
require './config/application'
require 'commander/import'
require 'httparty'
require 'json'

program :name, 'Todos'
program :version, '0.0.1'
program :description, 'A console application to keep tracking of your todo lists'

default_command :todo

command :new do |c|
  c.syntax = 'new [options]'
  c.description = 'Create a new task'
  c.option '--d STRING', String, 'Adds a description for a task'
  c.action do |args, options|
    name = args.join(' ') || ask("Name: ")
    description = options.d
    params = { task: { name: name, description: description } }
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

command :todo do |c|
  c.syntax = '[options]'
  c.description = 'List all the todo tasks'
  c.action do
    response = HTTParty.get "#{ ENV['LOCALHOST_URL'] }"
    say "#{ response }"
  end
end
