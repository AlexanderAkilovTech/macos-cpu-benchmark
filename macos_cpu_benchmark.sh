#!/bin/bash
#macos_cpu_benchmark.sh
# MIT License
# Copyright (c) 2024 Alexander Akilov
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# OS Check
if [[ "$(uname)" != "Darwin" ]]; then
 echo "This script is for macOS only."
 exit 1
fi

# Function to get CPU temperature in Celsius from istats using "deg" instead of the degree symbol
function get_temp_celsius() {
    # Capture the full output of istats for CPU temp
    local temp_output=$(sudo istats cpu temp)

    # Extract the temperature value, ignoring any degree symbol and extra characters
    local temp_c=$(echo $temp_output | grep -o '[0-9]\+\.[0-9]\+')

    # Check if the value was successfully extracted
    if [ -z "$temp_c" ]; then
        echo "Temperature not found!"
    else
        # Output the temperature with "deg" instead of the degree symbol
        echo "$temp_c deg. C"
    fi
}

# Function to get fan speed in RPM from istats
function get_fan_speed_rpm() {
    local fan_speed=$(sudo istats fan speed --value-only | head -n 1 | xargs)  # Use xargs to trim any extra spaces
    echo "$fan_speed RPM"
}

# Get idle temperature and fan speed
idle_temp=$(get_temp_celsius)
fan_speed_idle=$(get_fan_speed_rpm)
echo "Idle CPU Temperature: $idle_temp"
echo "Idle Fan Speed: $fan_speed_idle"

# Start time with adjusted date formatting (e.g., "Sat Sep 7 14:38:26 PDT 2024")
start_time=$(date "+%a %b %-d %T %Z %Y")
echo "Benchmark started at: $start_time"

# Get the number of CPU cores (logical processors)
num_cpus=$(sysctl -n hw.ncpu)

# Run CPU stress test using all logical processors for 10 minutes (600 seconds)
echo "Running CPU stress test with $num_cpus logical processors..."
stress --cpu $num_cpus --timeout 600 &> /dev/null

# Get load temperature and fan speed
load_temp=$(get_temp_celsius)
fan_speed_load=$(get_fan_speed_rpm)
echo "CPU Temperature under load: $load_temp"
echo "Fan Speed under load: $fan_speed_load"

# End time with adjusted date formatting
end_time=$(date "+%a %b %-d %T %Z %Y")
echo "Benchmark completed at: $end_time"

# Output results
echo "===================================="
echo "Summary:"
echo "Idle CPU Temp: $idle_temp"
echo "Load CPU Temp: $load_temp"
echo "Idle Fan Speed: $fan_speed_idle"
echo "Load Fan Speed: $fan_speed_load"
echo "Benchmark started at: $start_time"
echo "Benchmark completed at: $end_time"

