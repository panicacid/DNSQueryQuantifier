# DNSQueryQuantifier

Ey up! Welcome to DNSQueryQuantifier, a handy little tool for parsing through Windows Server DNS Log Files. This nifty gadget will sift through your logs, pick out domain queries and tally up how many have had a valid response. It'll neatly tuck all this information into a CSV file, ready for your perusal.

Built this as we were wanting to retire our old public DNS servers (which are Windows based) and needed to know which domains were still using our name servers so we could inform the owners of said domains to sling their hook. DNS Debugging must be enabled, to make life easier only log valid responses and ensure that recursion is turned off.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

- A Windows machine
- PowerShell
- Windows Server DNS Logs in need of parsing

## Usage

Running DNSQueryQuantifier is as easy as pie. Follow these steps, and you'll have your DNS queries sorted out in no time.

1. Update the `$logPath` and `$outputPath` variables in the script to point to your DNS log file and desired output CSV file respectively.
   ```powershell
   $logPath = "C:\Path\To\Logs\YOUR-DNS-LOG-FILE.log"
   $outputPath = "C:\Path\To\Logs\QueriedDomains.csv"
   ```

2. Once the script's done its job, you'll find a CSV file at the `$outputPath` you specified. This file will list all the domains queried against your Windows DNS Server with a valid response, alongside the count of queries for each domain.

## Contributing

Fancy contributing to QueryQuantifier? We'd love to have you on board! Feel free to fork the repository, make your changes, and submit a pull request. 

