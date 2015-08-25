#!/bin/bash

save_token() {
token=$(create_token)
echo $token
#if [ token == 1 ]
#then
#  echo 'exit code is 1'
#fi
}

create_token() {
read -p "Please enter your GitHub username: " username
curl "https://api.github.com/authorizations" -u $username --data '{"scopes": ["user:email"], "note": "pato-manger"}' |
  ruby -r 'json' -e "
  response = JSON.parse(STDIN.read)
  if response['token']
    puts response['token']
  else
    raise response.to_s
  end" || (manually)
}

manually() {
echo -e "\n
There is an error getting the token, please read the error message and try again
or find a token manually.\n\n
\e[0;34mMANUALLY:\e[0m\n
To get the token manually, run the commands at the bottom.
In the curl command replacing the USERNAME for your GitHub username,
then execute the second command that creates a hidden file called pato-manager.
Finally copy the token provided by the Github API nd save it in the file.\n
curl "https://api.github.com/authorizations" -u USERNAME --data '{"scopes": ["user:email"], "note": "pato-manager"}'
touch ~/.pato-manager"
}

readme() {
echo -e "\n
\e[0;34mHOW IT WORKS:\e[0m\n
To know the user that is using the app or create a new one,
Pato Manager needs to know your GitHub email[*], for that,
the script ask your GitHub username and try to create or read
a public token .- \e[0;31m**only gets your public profile details**\e[0m -.\n
The GitHub API ask for your password, then the script capture
the response from the API and save in pato-manager file.
You can see your token in $HOME/.pato-manager
and in GitHub https://github.com/settings/tokens.\n
[*]: Because it's easier than having to remember another login account.\n"
}

readme
save_token
