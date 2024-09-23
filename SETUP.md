Overview:

This is a Bash script designed for macOS to monitor CPU temperature and fan speeds, as well as run stress tests to evaluate system performance under load. The script provides a summary of both idle and load temperatures, fan speeds, and stress test duration.

Prerequisites:

Before using this script, ensure the following tools are installed:

1. Homebrew (macOS package manager)


If you don't have Homebrew installed, you can install it by running the following command in your terminal:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. iStats (for monitoring CPU temperature and fan speeds)

Install via Gem:

```
sudo gem install iStats
``` 

3. stress (for CPU stress testing)

Install via Homebrew:

```
brew install stress
```
______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

Installation:

1.  Create a dedicated scripts folder in the terminal:

    ```
    mkdir scripts
    ```
2.  Clone the repository:

   Once you're in the scripts folder in the terminal, clone the repository using this command:
   ``` 
   git clone https://github.com/yourusername/macos-cpu-benchmark.git
   ```
3. Navigate to the project folder:

   After cloning the repository, navigate to the project directory:

   ```
   cd macos-cpu-benchmark
   ```

4. Make the script executable:

   Ensure that the script has execution permissions:

   ```
   chmod +x macos_cpu_benchmark.sh
   ```
______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

Usage

Run the script using the following command:

```
sudo ./macos_cpu_benchmark.sh
```

Script Workflow:

1. Idle Monitoring: Captures CPU temperature and fan speeds at idle.

2. Stress Test: Runs a 10-minute CPU stress test, using all available CPU cores.

3. Load Monitoring: Captures CPU temperature and fan speeds under load.

4. Summary Report: Displays the test results.

Example Output:

```

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
```
_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

Creating a Terminal Alias

If you plan to run this script frequently, you can create a terminal alias for quick access.

1. Open your terminal and edit your shell configuration file (~/.bash_profile or ~/.zshrc depending on your shell):

```
nano ~/.bash_profile   # for Bash
nano ~/.zshrc           # for Zsh
```

2. Add the following line to create an alias:

```
alias cpubenchmark="sudo ~/scripts/macos_cpu_benchmark.sh"
```

3. Save the file and exit.


4. Reload the terminal configuration:

```
source ~/.bash_profile   # for Bash
source ~/.zshrc           # for Zsh
```

5. Now you can run the script by simply typing:

```
cpubenchmark
```

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

FAQ

1. What is the purpose of this script?

This script helps you monitor the CPU temperature and fan speeds of your macOS system, and it performs a stress test to assess how your system handles heavy CPU loads.

2. Do I need sudo privileges?

Yes, the script requires access to system sensors, which requires sudo privileges.

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

Troubleshooting:

1. Issue: "iStats not found"

   Make sure iStats is installed using Gem:

```
sudo gem install iStats
```

2. Issue: "stress command not found"

   Ensure that stress is installed via Homebrew:

 ```
 brew install stress
 ```
_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

Contributing:

We welcome contributions! See the CONTRIBUTING.md file for detailed instructions on how to contribute.

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

License:

This project is licensed under the MIT License. See the LICENSE.md file for details.

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________




