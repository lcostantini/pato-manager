require 'commander'
require 'ohm'
require 'pry'

  def run
    program :version, '0.0.1'
    program :description, 'A console application to keep track of your tasks'

    command :new do |c|
      c.syntax = 'Pato Manager new'
      c.description = 'Create a new task'
      c.option '--name STRING', String, 'Adds a name for a task'
      c.option '--description STRING', String, 'Adds a description for a task'
      c.action do |args, options|
        name = options.name || ask("Name: ")
        description = options.description || ask("Description: ")
        Task.create(name: name, description: description, created_at: Date.today.to_s, state: 'not started')
      end
    end

    command :all do |c|
      c.syntax = 'Pato Manager all'
      c.description = 'List all the tasks'
      c.action do |options|
        Task.all.each do |task|
          puts task.attributes
        end
      end
    end

  end
