function InstallIfNeeded-Choco {
    Set-ExecutionPolicy Bypass
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function InstallIfNeeded-Vagrant {
    choco install vagrant -y;
    refreshenv;
}

function EnableIfNeeded-HyperV {
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All;
}

function Create-InternalSwitch {
    $internalSwitches = Get-VMSwitch | Where-Object {$_.SwitchType -eq "Internal" -and $_.Name -eq "InternalNetworkVagrant"}
    if($internalSwitches) {
        Write-Host "Internal switch InternalNetworkVagrant is already exists, use it for virtual machines to enable vagrant powershell" -ForegroundColor Green
        return;
    }

   Write-Host "Creating an internal switch for vagrant powershell. Select it for new virtual machine";
   New-VMSwitch -Name "InternalNetworkVagrant" -SwitchType Internal;
}

$vms = "DC", "Node1", "Node2";
EnableIfNeeded-HyperV;
Create-InternalSwitch;
InstallIfNeeded-Choco;
InstallIfNeeded-Vagrant;

function Deploy-VM($VMName){
    Get-WindowsBox;
}