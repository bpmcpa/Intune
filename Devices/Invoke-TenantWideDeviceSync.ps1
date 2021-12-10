Connect-MSGraph

# $Devices = Get-IntuneManagedDevice -Filter "contains(operatingsystem, 'iOS')"

# $Devices = Get-IntuneManagedDevice -Filter "contains(operatingsystem, 'Android')"

$Devices = Get-IntuneManagedDevice -Filter "contains(operatingsystem, 'Windows')"
 
 
# If we have more than 1000 objects returned we need to use the Get-MSGraphAllPages function
if($Devices.Count -ge 1000){
    $Devices = Get-IntuneManagedDevice -Filter "contains(operatingsystem, 'Windows')" | Get-MSGraphAllPages
}

foreach($Device in $Devices){
    Write-Output "Sending Sync request to Device with DeviceID $($Device.managedDeviceId)"
    Invoke-IntuneManagedDeviceSyncDevice -managedDeviceId $Device.managedDeviceId
}

Write-Output "COMPLETE"