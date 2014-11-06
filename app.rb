#!/usr/bin/env ruby
require './config/application'
require 'commander/import'
require 'net/http'
require 'json'

program :name, 'Todos'
program :version, '0.0.1'
program :description, 'A console application to keep tracking of your todo lists'

command :new do |c|
  c.syntax = 'new [options]'
  c.description = 'Create a new task'
  c.option '--description STRING', String, 'Adds a description for a task'
  c.action do |args, options|
    name = args.join(' ') || ask("Name: ")
    description = options.description
    uri = URI.parse('http://localhost:9393')
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new("/tasks")
    request.add_field('Content-Type', 'application/json')
    request.body = {"task" => {"name" => "web post task", "description" => ""}}.to_json
    response = http.request(request)
    say "# OK" if response.code == "201"
  end
end

command :all do |c|
  c.syntax = 'all [options]'
  c.description = 'List all the tasks'
  c.action do |options|
    uri = URI('http://localhost:9393/tasks/all')
    res = Net::HTTP.get(uri)
    say "#{ res }"
  end
end
