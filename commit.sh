#!/bin/bash
#
# 版本号 例如 1.0.0
VERSION=$1

# 提交
function commit() {
  msg="release: ${VERSION}"
  git add --all &&
  git commit -m "${msg}" &&
  git push origin main &&
  git tag ${VERSION} &&
  git push --tags &&
  printf "\n\n> \033[32m%s\033[0m\n" 'Congratulations!' ||
  printf "\n\n> \033[31m%s\033[0m\n" 'Operation failed.'
}

while :
do
  case $VERSION in
    '')
      read -p "请输入要发布的版本号: " VERSION
    ;;
    *)
    break
    ;;
  esac
done

commit
