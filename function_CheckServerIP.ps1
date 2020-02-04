function Test-ServerIP {
param ([Parameter(Mandatory=$True)]
        [string]
        $File,
        [Parameter()]
        [string]
        $Export = ".\results.csv")
    $Result = @()
    $Servers = Get-Content ".\$File"

    foreach ($Server in $Servers) {
        try {
            $Test = Test-Connection -ComputerName $Server -Count 1 -ErrorAction Stop
            $IP = $Test.IPV4Address.IPAddressToString
            $Status = Write-Output "On"}
        catch {
             $Status = Write-Output "Off"
             $IP = $null
        }
        $Result += New-Object PsObject -Property @{Name=$Server;Status=$Status;IPv4=$IP}
    }
    $Result | Export-Csv $Export -NoTypeInformation
}