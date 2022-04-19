# get the root folder of git repository
git_root(){
  git rev-parse --show-toplevel
}
# get the current git branch
branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
}

# adding a clipboard folder with 5 empty slots
setup_clipboard(){
  groot=`git_root`
  mkdir -p "$groot"/.git/clipboard
  cd "$groot"/.git/clipboard
  for i in {1..5}
  do
    echo '' > "$i"
  done
  cd "$groot"
  echo 'done!'
}

# give the memory slot a value
# usage: "put 1" to save the current branch to slot 1
#        "put 1 'some quick note'" to save 'some quick note' to slot 1
put(){
 groot=`git_root`
 if [ -z $2 ]; then
  branch > "$groot"/.git/clipboard/"$1"
 else
  echo "$2" > "$groot"/.git/clipboard/"$1"
 fi
 echo "got it!"
}

read-clipboard(){
 cat "`git_root`/.git/clipboard/$1"
}

checkout_from_clipboard(){
  git checkout `read-clipboard $1`
}

show-clipboards(){
  for i in {1..5}
  do
    echo "$i \c";
    read-clipboard "$i"
  done
}
# usage: "c 1" to checkout the branch in slot 1
alias c="checkout_from_clipboard"
# usage: "b" to show all the memory slots
alias b="show-clipboards"