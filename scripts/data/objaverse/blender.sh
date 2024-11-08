#!/bin/bash

# Record the start time and convert to date and time
start_time=$(date +%s)
start_date=$(date)

DIRECTORY="/home/gonfrazao/InstantMesh/data/objs2"     # data absolute path
for glb_file in $DIRECTORY/*.obj; do
  echo "Processing $glb_file"
  /blender-4.2.3-linux-x64/blender -b -noaudio  -P blender_script.py -- --object_path $glb_file --output_dir /home/gonfrazao/InstantMesh/data/test --resolution 512 --num_images 12
done

# Record the end time and convert to date and time
end_time=$(date +%s)
end_date=$(date)

# Calculate the total duration
elapsed=$((end_time - start_time))

# Convert the total duration to hours, minutes, and seconds
hours=$((elapsed / 3600))
minutes=$(( (elapsed % 3600) / 60))
seconds=$((elapsed % 60))

# Print the execution results
echo "Start time: $start_date"
echo "End time: $end_date"
echo -n "Total time elapsed: "

# Print only if hours, minutes, or seconds are not zero
if [ $hours -gt 0 ]; then
  echo -n "$hours hours "
fi

if [ $minutes -gt 0 ] || [ $hours -gt 0 ]; then # Display minutes if there are hours
  echo -n "$minutes minutes "
fi

if [ $seconds -gt 0 ] || [ $minutes -gt 0 ] || [ $hours -gt 0 ]; then # Display seconds if there are minutes
  echo "$seconds seconds"
fi

echo ""
