filename=$1

if [ -z "$filename" ]; then
  echo "Usage: $0 <json_file>"
  exit 1
fi
# Get the headers from the keys of the first object
headers=$(jq -r '.[0] | keys_unsorted | @csv' $filename | head -n 1)

# Extract the data rows as CSV
data=$(jq -r '.[] | [.[]] | map(tostring) |@csv' $filename)

outputfilename=$(sed 's/\.json$/.csv/' <<< "$filename")
# Combine headers and data
echo "$headers" > "$outputfilename"
echo "$data" >> "$outputfilename"
