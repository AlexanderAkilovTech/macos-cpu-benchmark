# macOS CPU Benchmark

## Overview
`macOS CPU Benchmark` is a simple Bash script designed for macOS systems to monitor CPU temperature, fan speeds, and run stress tests. It provides a summary of system performance under load, allowing users to assess their system's thermal behavior.

## Features
- Monitors CPU temperature in degrees Celsius.
- Reports fan speeds (in RPM) at idle and under load.
- Runs a CPU stress test utilizing all available logical processors.
- Provides a summary of idle and load temperatures, fan speeds, and test duration.

## How It Works
1. **Idle Monitoring**: The script first captures the system's idle CPU temperature and fan speed.
2. **Stress Test**: The script runs a stress test on all logical processors for a specified period (typically 10 minutes).
3. **Load Monitoring**: After the stress test, it records the CPU temperature and fan speeds under load.
4. **Summary Report**: Finally, the script outputs a summary with idle and load data.

## Example Output
Idle CPU Temp: 42.81 deg. C  

Idle Fan Speed: 1700 RPM  

Benchmark started at: Sun Sep 8 11:49:40 PDT 2024

Running CPU stress test with 16 logical processors... 

CPU Temperature under load: 68.75 deg. C

Fan Speed under load: 5450 RPM

Benchmark completed at: Sun Sep 8 11:59:51 PDT 2024

Summary:

Idle CPU Temp: 42.81 deg. C 

Load CPU Temp: 68.75 deg. C 

Idle Fan Speed: 1700 RPM 

Load Fan Speed: 5450 RPM 

Benchmark started at: Sun Sep 8 11:49:40 PDT 2024 

Benchmark completed at: Sun Sep 8 11:59:51 PDT 2024

## Future Improvements
The following features are planned for future versions:
- GPU temperature monitoring for Intel-based Macs.
- More advanced fan control.
- Monitoring for battery temperature and health (for MacBooks).
- Warnings for Tj-Max and thermal throttling events.

## License
This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for more details.

## Disclaimer
This script is provided "as is" without any warranties. It is intended for informational purposes only, and the author is not responsible for any damage caused by the use of this software.
