Pato Manager
============

Is a console application for create and keep tracking of TODOs.

## Description

Every time you need to remember something, no matter it is, you forget.
For that you need **Pato Manager**.

When you're working in a terminal and want to save a task, you only need to run
the appropriate command and the task is saved. You can also check if you have
unfinished tasks.

## Install

```
git clone git@github.com:lcostantini/pato-manager.git
cd pato-manager
bundle
```

## Usage

For run the application you need to run.

```
bin/patodo
```

## Commands

All the commands support the option -h to see the help and description
for each.

1. new
2. todo (is the default command)
3. all
4. update
5. done
6. undone
7. category

## Example

Create a new task.

```
bin/patodo new 'Write Readme' task --c 'example'
```

this return **OK** if the task was correctly created.

then run...

```
bin/patodo
```

returns a table with all pending tasks.

| Name         | Description | Date       | State | Category |
|:------------:|:-----------:|:----------:|:-----:|:--------:|
| Example task |             | 2015-03-24 | todo  | example  |

If you try to create a new task without name and category Pato Manager
asking for one.

## Contributing

1. Fork it ( https://github.com/lcostantini/pato-manager.git )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request.
