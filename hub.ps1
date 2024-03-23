# Set window size
$consoleWidth = 60
$consoleHeight = 15
[Console]::SetWindowSize($consoleWidth, $consoleHeight)

# Define the menu options
$menuOptions = @(
    @{ Key = '1'; Value = "WinUtil" };
    @{ Key = '2'; Value = "Windows Activator" };
    @{ Key = '3'; Value = "Defender Remover" };
    @{ Key = 'q'; Value = "Quit" }
)

# Function to execute Script 1
function ExecuteScript1 {
    Write-Host "Launching WinUtil..."
    irm christitus.com/win | iex
}

# Function to execute Script 2
function ExecuteScript2 {
    Write-Host "Launching MAS..."
    irm https://massgrave.dev/get | iex
}

# Function to execute Script 3
function ExecuteScript3 {
    Write-Host "Downloading Defender Remover...Check Browser!"
    Start-Process 'https://github.com/ionuttbara/windows-defender-remover/releases/download/release_def_12_7_2/DefenderRemover.exe'
}

# Function to display the menu
function ShowMenu {
    Clear-Host
    Write-Host "=== Script Hub ==="
    Write-Host
    
    foreach ($option in $menuOptions) {
        Write-Host "$($option['Key']) - $($option['Value'])"
    }
    
    Write-Host
    Write-Host "Enter your choice:"
}

# Main script logic
while ($true) {
    ShowMenu
    
    $choice = Read-Host
    
    if ($choice -eq 'q') {
        break
    }

    $selectedOption = $menuOptions | Where-Object { $_['Key'] -eq $choice }

    if ($selectedOption) {
        switch ($selectedOption['Key']) {
            '1' { ExecuteScript1 }
            '2' { ExecuteScript2 }
            '3' { ExecuteScript3 }
            default { Write-Host "Invalid choice. Please try again." }
        }
    }
    else {
        Write-Host "Invalid choice. Please try again."
    }
    
    Write-Host
    Write-Host "Press Enter to continue..."
    $null = Read-Host
}
