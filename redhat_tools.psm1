function Convert-LinuxShadow {
  <#
  .SYNOPSIS
    This command takes a shadow file via pipeline and converts the contents into human readable form
  .DESCRIPTION
    This command takes a shadow file via pipeline and converts the contents into human readable form.
    A single line of the the shadow file can used as input via the parameter LinuxShadow
  .NOTES
    Created by: Brent Denny
    Created on: 09-Oct-2024
  .PARAMETER LinuxShadow
    This parameter can take an entire shadow file via the pipeline or a single line on the command line
  .EXAMPLE
    Convert-LinuxShadow -LinuxShadow 'juan:$1$.QKDPc5E$SWlkjRWexrXYgc98F.:12825:0:90:5:30:13096:'
    This example will take this shadow file entry and convert it into a PowerShell object in human readable form
  .EXAMPLE
    sudo cat /etc/shadow | Convert-LinuxShadow
    This example will take this entire shadow file entry and convert each line of the file into 
    separate PowerShell objects so that the information for each identity is human readable
  #>
  
  [CmdletBinding()]
  Param (
    [Parameter(ValueFromPipeline=$true)]
    [string]$LinuxShadow
  )
  BEGIN {$EpochDate = [datetime]'1-jan-1970'}
  PROCESS {
    foreach ($Line in $LinuxShadow) {
      if ($Line -match '^[a-zA-Z0-9]+:[a-zA-Z0-9!*]:(\d*:){6}]+') {
        $ShadowArray = $Line -split ':'
        $ShadowHash = [ordered]@{
          Name                   = $ShadowArray[0]
          PasswordHash           = [PSCustomObject][ordered]@{
                                     HashString   = $ShadowArray[1]
                                     Type         = ($ShadowArray[1] -split '\$')[1] | ForEach-Object {switch ($_) {1 {'MD5'}; 5 {'sha256'}; 6 {'sha512'}}}
                                     Salt         = ($ShadowArray[1] -split '\$')[2]
                                     PasswordHash = ($ShadowArray[1] -split '\$')[3]
                                   }
          PasswordLastChanged    = $ShadowArray[2]
          PasswordMinimumLife    = $ShadowArray[3]
          PasswordMaximumLife    = $ShadowArray[4]
          PasswordWarn           = $ShadowArray[5]
          PasswordAutoLock       = $ShadowArray[6]
          PasswordAccountExpires = $ShadowArray[7]
          PasswordChangedDate    = $EpochDate.AddDays($ShadowArray[2])
          ExpiryDate             = $EpochDate.AddDays($ShadowArray[7])
        }
        return [PSCustomObject]$ShadowHash
      }
      else {Write-Warning 'Shadow line does not confirm to shadow standards'}
    }
  }
  END {}
}
