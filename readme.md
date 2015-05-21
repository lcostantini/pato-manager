Pato Manager
============

Is a console application to create and keep tracking of TODOs.

## Description

Every time you need to remember something, no matter what is it, you forget.
To solve your problem here is... (drum sound) **Pato Manager**.

When you're working in a terminal and want to save something to remember,
you only need to use the appropriate command and the todo is saved.
Pato Manager accepts commands than let you create and operate over your TODOs list.
For that Pato use an API called
[small-api-in-the-world](https://github.com/lcostantini/small-api-in-the-world/blob/master/README.md),
that can handle your request and save it in a Redis DB.

You can find [examples](https://github.com/lcostantini/pato-manager#examples) bellow.

## Install

```
git clone git@github.com:lcostantini/pato-manager.git
cd pato-manager
bundle
```

## Commands

All the commands support the option **-h** to see the help and description
for each one.

1. new
2. todo (is the default command)
3. all
4. update
5. done
6. undone
~~7. cancel~~
8. delete
9. category

## Examples

###### Create a new task.

```
bin/patodo new 'Example task' --c 'example'
```

The command _new_ accept options like --d and --c.
In this case --c add a category for the task.
If the task was correctly created, this return **# OK**.

Then to see the task that you create run...

```
bin/patodo todo

```

or, easier

```
bin/patodo
```

because the default command is **todo**.

This returns a table with all pending tasks.

| Name         | State | Category |
|:------------:|:-----:|:--------:|
| Example task | todo  | example  |

If you want the table show more information you can add options like
..* --d, to show the description column
..* --da, to show the creation date


With the command **all**

```
bin/patodo all

```

You can see the table with all the tasks, not only those that
have the todo state.

###### Update a task.

###### Done, Undone and Cancel a task.

###### Category.

## Contributing

1. Fork it ( https://github.com/lcostantini/pato-manager.git )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request.
