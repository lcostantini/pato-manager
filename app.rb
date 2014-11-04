#!/usr/bin/env ruby
require './config/application'
require 'commander/import'

program :name, 'Foo Bar'
program :version, '0.0.1'
program :description, 'Todo list'

command :new do |c|
  c.syntax = ' new [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    Task.create name: args
  end
end

command :all do |c|
  c.syntax = ' all [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    Task.all.each do |task|
      say "name: #{ task.name }"
    end
  end
end
