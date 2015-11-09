Pato Manager
============

Is a console application to create and keep tracking of TODOs.

## Description

Every time you need to remember something, no matter what is it, you forget.
To solve your problem here is **Pato Manager**.

When you're working in a terminal and want to save something to remember,
you only need to use the appropriate command and the task is saved.
Pato Manager accepts commands than let you create and operate over your TODOs list.
For that Pato use an API called
[small-api-in-the-world](https://github.com/lcostantini/small-api-in-the-world/blob/master/README.md),
that can handle your request and save it in a Redis DB.

You can find [examples](https://github.com/lcostantini/pato-manager#examples) bellow.

## Install

```
gem install patodo
```

## Usage

To start using Pato, you need to create a token for your GitHub account.
This is to avoid create a user account and remember another username and password.
For that you can use your GitHub account to login.
You need to run the command _token_ or _manually_ those commands create a
token for your GitHub account and **get only your email**, the token and email
are used to create the account.
Each command send in the header of the request the token and the API find or
create a user with the email provide by the token.
For that you don't need to login every time you run a command Pato find the
token in the file and send every time. You need to run the command _token_ or
_manually_ only one time.

## Commands

All the commands support the option **-h** to see the help and description
for each one.

1. [token](https://github.com/lcostantini/pato-manager#token)
2. [manually](https://github.com/lcostantini/pato-manager#manually)
3. [token_help](https://github.com/lcostantini/pato-manager#token-help)
4. [new](https://github.com/lcostantini/pato-manager#create-a-new-task)
5. todo
6. all
7. [update](https://github.com/lcostantini/pato-manager#update-a-task)
8. [done](https://github.com/lcostantini/pato-manager#done-and-undone-a-task)
9. [undone](https://github.com/lcostantini/pato-manager#done-and-undone-a-task)
10. ~~cancel~~ (WIP)
11. [category](https://github.com/lcostantini/pato-manager#find-a-task-with-category)
12. [delete](https://github.com/lcostantini/pato-manager#delete-a-task)

## Examples


___

###### Token.

With this command you can create a token for your GitHub account.
Pato use this token to get **only your email** and create a user
or find it if you already have one.

The GitHub API ask for your password, then the command capture
the response from the API and save in pato-manager file.
You can see your token in $HOME/.pato-manager
and in GitHub https://github.com/settings/tokens.

You can always delete the token in the GitHub page.


___

###### Manually.

This command make the same as _token_ but shows how to do it manually.
You only need to follow the instructions.


___

###### Token Help.

If the GitHub API returns a error message you can find here more information
about that and the way to solved.


___

###### Create a new task.

To create a new task you can run

```
patodo new 'Example task' --c 'example'
```

The command _new_ accept options like --d and --c.
In this case --c add a category for the task.
If the task was correctly created, this return **# SAVED**.

Then to see the task that you create run...

```
patodo todo

```

This returns a table with all pending tasks.

| Id | Name         | State | Category |
|:--:|:------------:|:-----:|:--------:|
| 1  | Example task |  ❏    | example  |

If you want the table show more information you can add options like
* --d, to show the description column
* --da, to show the creation date


___

###### Update a task.

You can update the task with the command

```
patodo update 1 --n 'Updated task'

```

In this case the option --n update the name, --d update the description
and with --c update the category. If everything was ok the command shows
an **# UPDATED** message.
Remember that you can always use the -h option to see a full help of the command.

If you run again the command

```
patodo todo

```

Now the table shows

| Id | Name         | State | Category |
|:--:|:------------:|:-----:|:--------:|
| 1  | Updated task |  ❏    | example  |


___

###### Done and Undone a task.

Also you can mark a task with done or undone.
To mark the task as done you can do this

```
patodo done 1

```

The command respond **# MARKED AS DONE** if everything was ok.
You can make the same with the _undone_ command.


Now if you run the _todo_ command you get the message **# The list is empty**.
This is because all the tasks you have are done.

You can use the command **all** to see all the task done and undone.

```
patodo all

```

| Id | Name         | State | Category |
|:--:|:------------:|:-----:|:--------:|
| 1  | Updated task |   ✔   | example  |


___

###### Find a task with category.

With this command you can get all the tasks with an specific category.

```
patodo category 'example'

```

| Id | Name         | State | Category |
|:--:|:------------:|:-----:|:--------:|
| 1  | Updated task |   ✔   | example  |


___

###### Delete a task.

You can delete a task with this command.

```
patodo delete 1

```

If was ok you see the message **# DELETED**.


## Contributing

1. Fork it ( https://github.com/lcostantini/pato-manager.git )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request.
