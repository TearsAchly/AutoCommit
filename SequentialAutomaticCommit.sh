#!/bin/bash

# Set the start date
start_date="2023-12-01"
# Set the end date
end_date="2023-12-30"

# Convert dates to seconds since 1970-01-01 00:00:00 UTC 
start_sec=$(date --date="$start_date" +%s)
end_sec=$(date --date="$end_date" +%s)

# Loop from start date to end date
current_sec=$start_sec
while [ $current_sec -le $end_sec ]
do
  # Convert current seconds back to date format
  current_date=$(date --date="@$current_sec" +%Y-%m-%d)
  echo "Committing for date: $current_date"
  
  # Generate a random hour (0 to 23)
  random_hour=$(shuf -i 0-23 -n 1)
  
  # Format the random hour as HH:00:00
  commit_time=$(printf "%02d:00:00" $random_hour)
  commit_datetime="$current_date $commit_time"
  echo "Commit time: $commit_datetime"

  # Make some changes to ensure there is something to commit
  echo "$current_date" > README.md

  # Add changes to git
  git add README.md

  # Generate a meaningful commit message
  commit_message="Commit changes for $current_date at $commit_time"
  
  # Commit with GPG signing and the specific date
  GIT_AUTHOR_DATE="$commit_datetime" GIT_COMMITTER_DATE="$commit_datetime" git commit -S -m "$commit_message"

  # Increment the current date by one day (86400 seconds)
  current_sec=$((current_sec + 86400))
done
