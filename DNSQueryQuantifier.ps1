# Define the file paths for the log and output CSV files
$logPath = "C:\Path\To\Logs\YOUR-DNS-LOG-FILE.log"
$outputPath = "C:\Path\To\Logs\QueriedDomains.csv"

# Read the content of the log file
$logs = Get-Content -Path $logPath

# Filter the logs to retain entries containing "NOERROR"
$filteredLogs = $logs | Where-Object { $_ -match 'NOERROR' }

# Initialise a hashtable to accumulate the domain counts
$domainCount = @{}

# Process each log entry in the filtered logs
$filteredLogs | ForEach-Object {
    if ($_ -match '\((\d+)\)[a-zA-Z0-9-]+(.+)(\(\d+\))') {
        # Extract and format the domain name from the current log entry
        $domain = $matches[0] -replace '\(\d+\)', '.' -replace '^\.|\.+$'  # Remove (number) and leading/trailing dots
        $domain = $domain.ToLower()  # Convert domain name to lowercase
        $domain = $domain -replace '^www\.', ''  # Remove 'www.' prefix if present
        
        # Update the domain count in the hashtable
        if (-not $domainCount.ContainsKey($domain)) {
            $domainCount[$domain] = 1  # Initialise count for new domain
        } else {
            $domainCount[$domain] += 1  # Increment count for existing domain
        }
    }
}

# Sort the hashtable entries alphabetically by domain name
$sortedData = $domainCount.GetEnumerator() | Sort-Object Name

# Prepare and export the data to a CSV file
$sortedData | 
    Select-Object @{Name='Domain'; Expression={$_.Key}}, @{Name='Count'; Expression={$_.Value}} | 
    Export-Csv -Path $outputPath -NoTypeInformation

# Notify the user upon completion
Write-Host "Processing complete. Modified CSV saved to $outputPath"
