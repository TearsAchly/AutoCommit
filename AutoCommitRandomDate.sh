#!/bin/bash

# Set the start date
start_date="2024-01-01"
# Set the end date
end_date="2024-06-30"

# Convert dates to seconds since 1970-01-01 00:00:00 UTC 
start_sec=$(date --date="$start_date" +%s)
end_sec=$(date --date="$end_date" +%s)

# Loop from start date to end date
current_sec=$start_sec
while [ $current_sec -le $end_sec ]
do
  # Generate a random number (0-1), and decide whether to commit or not
  random_commit=$(shuf -i 0-1 -n 1)
  
  if [ $random_commit -eq 1 ]; then
    # Convert current seconds back to date format
    current_date=$(date --date="@$current_sec" +%Y-%m-%d)
    echo "Committing for date: $current_date"
    
    # Generate random number of commits (1 to 5)
    num_commits=$(shuf -i 1-5 -n 1)
    
    for ((i=1; i<=$num_commits; i++))
    do
      # Generate random hour (0 to 23)
      random_hour=$(shuf -i 0-23 -n 1)
      random_minute=$(shuf -i 0-59 -n 1)
      random_second=$(shuf -i 0-59 -n 1)
      
      # Format the random time as HH:MM:SS
      commit_time=$(printf "%02d:%02d:%02d" $random_hour $random_minute $random_second)
      commit_datetime="$current_date $commit_time"
      echo "Commit time $i: $commit_datetime"

      # Make some changes to ensure there is something to commit
      echo "### Basics of Programming

$current_date $i" > README.md

      # Add changes to git
      git add README.md

      # Commit with GPG signing and the specific date
      GIT_AUTHOR_DATE="$current_date $commit_time" GIT_COMMITTER_DATE="$current_date $commit_time" git commit -S -m "Random commit $i for $current_date"
    done
  else
    echo "No commit for date: $(date --date="@$current_sec" +%Y-%m-%d)"
  fi

  # Increment the current date by one day (86400 seconds)
  current_sec=$((current_sec + 86400))
done
