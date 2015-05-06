#!/bin/bash

#check_file_exists() {
#  if [ -e "$HOME/.pato-manager" ]
#  then
#    echo "File already exists."
#  else
#    touch $HOME/.pato-manager
#    echo "File was created."
#  fi
#}

ask_to_get_token() {
readme
while true; do
  read -p "Get the token from GitHub? (y/n): " yn
  case $yn in
    [Yy]* ) get_token; break;;
    [Nn]* ) manually; exit;;
    * ) echo "Please answer yes or no.";;
  esac
done
}

get_token() {
read -p "Please enter your GitHub username: " username
curl "https://api.github.com/authorizations" -u $username --data '{"note": "admin script"}' |
  ruby -r 'json' -e "puts JSON.parse(STDIN.read)['token']" > $HOME/.pato-manager
}

manually() {
echo "
# To get the token manually, run this command

curl "https://api.github.com/authorizations" -u USERNAME --data '{"note": "admin script"}'

# replacing the USERNAME for your GitHub username,
# then copy the token and save it in a hidden file called pato-manager.
# The file needs to be in the home directory. ie: $HOME/.pato-manager."
}

readme() {
echo "
# HOW IT WORKS:
# To know the user that is using the app, Pato Manager
# needs to know your GitHub email, for that, the script ask for
# your GitHub username and try to create a public token
# (only reads your public profile details).

# The GitHub API ask for your password, then script capture the
# response from the API and save in pato-manager file.

# You can see your token in $HOME/.pato-manager
# and in GitHub https://github.com/settings/tokens.

***
# If you want to get the token manually, respond 'no' to the
# question and follow the instructions.
"
}

#check_file_exists
ask_to_get_token
