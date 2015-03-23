require 'commander'
require 'ohm'
require 'httparty'
require 'json'
require 'pry'
require 'terminal-table/import'
require './models/response_decorator'

class Task < Ohm::Model

  attribute :name
  attribute :description
  attribute :created_at
  attribute :state

  index :name
  index :created_at

  include Commander::Methods

  def run
    program :version, '0.0.1'
    program :description, 'A console application to keep track of your tasks'

    default_command :todo

    command :new do |c|
      c.syntax = 'Pato Manager new'
      c.description = 'Create a new task'
      c.option '-d--description STRING', String, 'Adds a description for a task'
      c.action do |args, options|
        name = args.join(' ') || ask("Name: ")
        description = options.description
        params = { task: { name: name, description: description } }
        response = HTTParty.post 'http://localhost:9393/tasks', headers: {'Content-Type' => 'application/json'}, body: params.to_json
        binding.pry
        say "# OK" if response.code == 201
      end
    end

    command :all do |c|
      c.syntax = 'all [options]'
      c.description = 'List all the tasks'
      c.action do
        response = HTTParty.get "http://localhost:9393/tasks/all"
        puts ResponseDecorator.new.decorate_table(response)
      end
    end

    command :todo do |c|
      c.syntax = '[options]'
      c.description = 'List all the todo tasks'
      c.action do
        response = HTTParty.get "http://localhost:9393/tasks"
        puts ResponseDecorator.new.decorate_table(response, {header: ['Name', 'Description', 'Date', 'State']})
      end
    end

    command :done do |c|
      c.description = 'Mark a task as done'
      c.action do |args|
        id = args.join('')
        response = HTTParty.put "http://localhost:9393/tasks/#{ id }/done"
        say "# OK" if response.code == 200
      end
    end

    command :delete do |c|
      c.description = 'Delete a task'
      c.action do |args|
        id = args.join('')
        response = HTTParty.delete "http://localhost:9393/tasks/#{ id }"
        say "# OK" if response.code == 200
      end
    end

    command :update do |c|
      c.description = 'Update a task'
      c.option '--n STRING', String, 'Adds a new name for a task'
      c.option '--d STRING', String, 'Adds a new description for a task'
      c.action do |args, options|
        id = args.join('')
        params = { task: { name: options.n, description: options.d } }
        binding.pry
        response = HTTParty.put "http://localhost:9393/tasks/#{ id }", headers: {'Content-Type' => 'application/json'}, body: params.to_json
        say "# OK" if response.code == 200
      end
    end

    run!
  end
end

Task.new.run
