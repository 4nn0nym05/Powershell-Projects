function Copy-Files {
    [CmdletBinding()]
    param (
        [string]$Source,
        [string]$Destination,
        [switch]$LargeFiles,
        [string]$LogFile
        )
    
    begin {
        
    }
    
    process {
        if ($LargeFiles.IsPresent){
            robocopy $Source $Destination /MIR /copy:DAT /v /tee /r:0 /w:0 /mt:16 /j  #/log+:$LogFile 
        }else{
            robocopy $Source $Destination /MIR /copy:DAT /v /tee /r:0 /w:0 /mt:16  #/log+:$LogFile
        }
    }
    
    end {
        
    }
}