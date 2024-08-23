# Determine the directory where the PowerShell script is located
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Define the path to the configuration file relative to the script directory
$configFilePath = Join-Path -Path $scriptDirectory -ChildPath "config.txt"

# Read the configuration file and parse key-value pairs
$config = @{}
Get-Content $configFilePath | ForEach-Object {
    $line = $_.Trim()
    if ($line -match "^(.*?)=(.*)$") {
        $config[$matches[1].Trim()] = $matches[2].Trim()
    }
}

# Extract the batch file directory and batch file name from the configuration
$batchFileDirectory = $config['batchFileDirectory']
$batchFileName = $config['batchFileName']

# Construct the full path to the batch file
$batchFilePath = Join-Path -Path $batchFileDirectory -ChildPath $batchFileName

# Ensure the batch file path is absolute and exists
if (-not $batchFileDirectory -or -not $batchFileName -or -not (Test-Path $batchFilePath)) {
    Write-Output "The batch file specified in config.txt does not exist or is not specified: $batchFilePath"
    exit
}

# Add a blank line for readability
Write-Output ""

# Prompt the user to choose the log file option
$logChoice = Read-Host "Do you want to (1) create a new log file or (2) append to an existing log file? (Enter 1 or 2)"

Write-Output "" # Add a blank line for readability

switch ($logChoice) {
    "1" {
        # Create a new log file
        $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
        $logFilePath = Join-Path -Path $batchFileDirectory -ChildPath "logfile_$timestamp.txt"
        
        Write-Output "Creating new log file at: $logFilePath"
    }
    "2" {
        # Append to an existing log file
        $logFilePath = Read-Host "Enter the path of the existing log file"
        
        Write-Output "Appending to log file at: $logFilePath"
        
        # Check if the file exists
        if (-not (Test-Path $logFilePath)) {
            Write-Output "File does not exist. Please check the path or create a new log file."
            exit
        }
    }
    default {
        Write-Output "Invalid choice. Please enter 1 or 2."
        exit
    }
}

# Ensure the directory for the log file exists
$logDirectory = [System.IO.Path]::GetDirectoryName($logFilePath)
if (-not (Test-Path $logDirectory)) {
    Write-Output "Log directory does not exist. Creating directory: $logDirectory"
    New-Item -Path $logDirectory -ItemType Directory | Out-Null
}

# Add a blank line before running the batch file
Write-Output ""

# Run the batch file and capture stdout and stderr
& $batchFilePath *>&1 | Tee-Object -FilePath $logFilePath

# Add a blank line after the operation
Write-Output ""
Write-Output "Batch file execution complete. Log file updated at: $logFilePath"
