#!/bin/sh
# optional parameters
# -a    to filter by author
# -s    to select start date
# -e    to select end date
# -o    to save it to file
# -r    to specify the repository path
NEXT=$(date +%F)
SINCE="last 7"
UNTIL=$NEXT
AUTHOR=$(git config user.email)
OUTPUT="$(date +%F).md"
while getopts "a:s:e:o:r:" arg
do
  case $arg in
    a)
      AUTHOR=$OPTARG
      ;;
    s)
      SINCE=$OPTARG
      ;;
    e)
      UNTIL=$OPTARG
      ;;
    o)
      OUTPUT=$OPTARG
      ;;
    r)
      REPO=$OPTARG
      ;;
    ?)
      echo "unknown argument"
      exit 1
      ;;
  esac
done
(
git -C "${REPO}" log --author="${AUTHOR}" --since="${SINCE}" --until="${UNTIL}" --format="%cd" --date=short | sort -u | while read DATE ; do
  GIT_PAGER=$(git -C "${REPO}" log --no-merges --reverse --format="* %s" --since="${DATE} 00:00:00" --until="${DATE} 23:59:59" --author="${AUTHOR}")
  if [ ! -z "$GIT_PAGER" ]
  then
    echo "[${DATE}]"
    echo "${GIT_PAGER}"
    echo
  fi
done
) > $OUTPUT
echo "log is written to ${OUTPUT}"