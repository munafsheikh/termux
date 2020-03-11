
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

alias ls='ls -lap --color=auto'
alias lint='docker-compose run --rm tool npm run lint'

alias sf='sbt scalafmtAll'
alias sa='sbt -Dgit.branch=master clean update scalafmtAll compile test:compile test assembly'
alias sr='sbt -Dgit.branch=master clean coverage test coverageReport'
alias sc='sbt -Dgit.branch=master clean update compile'
alias st='sbt -Dgit.branch=master scalafmtAll test:scalastyle' 
alias s='. ~/.bashrc'

alias gac='git add . && git commit -m $1'
alias gsr='git reset --soft HEAD~1 && git reset HEAD .'
alias guc='gitUpdateCommits'

alias gpo='git push origin `getCurrentGitBranch`' 
alias gpof='git push origin `getCurrentGitBranch`  -f' 

alias g='git'
alias gs='git status'
alias gRd='git push origin --delete'
alias gLd='git branch -D'

alias gitBranch=''
alias p='git pull origin master'
alias d='git diff'
alias mm='git merge master'
alias c='git commit $1 -m "fix: generic message - clean up"'
alias l='git l'

gitUpdateCommits(){
  export commitM=`git log | grep "fix" | head -n 1`
  echo "git unstage, uncommit"
  gsr
  echo "git add commit..."
  gac "$commitM"
  echo "git push origin branch force"
  gpof
}


gLRd() {
 if [ -z "$1" ]; then 
  echo "specify a branch to delete locally and remote"		
 else
  gLd $1
  gRd $1
 fi
}


getCurrentGitBranch() {
 git branch &>/dev/null
 local OUTCOME=$?
 if [ $OUTCOME -eq 128 ] 
 then
  return 1
 else
  git branch | grep '*' | cut -f2 -d' ' 
 fi
}

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
