<#
    Credit Card Bruteforcer by Apoorv Verma [AP]
#>
param ($Dict = ".\Hashes.txt", $PinFile = ".\Pans.txt",[Parameter(ValueFromPipeline=$TRUE)]$Hashes)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.0] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkgewpwYXJhbShbYm9vbF0kZGVjaWRlciwgW3NjcmlwdGJsb2NrXSRpZnRydWUsIFtzY3JpcHRibG9ja10kaWZmYWxzZSkNCg0KICAgIGlmICgkZGVjaWRlcikgeyAmJGlmdHJ1ZX0gZWxzZSB7ICYkaWZmYWxzZSB9DQp9CgpmdW5jdGlvbiBQcm9jZXNzLVRyYW5zcGFyZW5jeSB7CnBhcmFtKFtBbGlhcygiVHJhbnNwYXJlbmN5IiwiSW52aXNpYmlsaXR5IiwiaSIsInQiKV1bVmFsaWRhdGVSYW5nZSgwLDEwMCldW2ludF0kVHJhbnM9MCwgW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXSRQcm9jZXNzKQ0KDQogICAgaWYgKCRQcm9jZXNzIC1tYXRjaCAiXC5leGUkIikgeyRQcm9jZXNzID0gJFByb2Nlc3MucmVwbGFjZSgiLmV4ZSIsIiIpfQ0KICAgIFRyeSB7DQogICAgICAgIGlmICgkUHJvY2Vzcy5uYW1lKSB7JFByb2MgPSAkUHJvY2Vzcy5uYW1lfSBlbHNlIHskUHJvYyA9IChHZXQtUHJvY2VzcyAkUHJvY2VzcyAtRXJyb3JBY3Rpb24gU3RvcClbMF0ubmFtZX0NCiAgICB9IGNhdGNoIHsNCiAgICAgICAgaWYgKFtJbnRdOjpUcnlQYXJzZSgkUHJvY2VzcywgW3JlZl0zKSkgeyRQcm9jID0gKChHZXQtUHJvY2VzcyB8ID8geyRfLklEIC1lcSAkUHJvY2Vzc30pWzBdKS5uYW1lfQ0KICAgIH0NCiAgICBpZiAoJFByb2MgLW5vdE1hdGNoICJcLmV4ZSQiKSB7JFByb2MgPSAiJFByb2MuZXhlIn0NCiAgICBuaXJjbWQgd2luIHRyYW5zIHByb2Nlc3MgIiRQcm9jIiAoKDEwMC0kVHJhbnMpKjI1NS8xMDApIHwgT3V0LU51bGwNCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsKcGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmddJFRleHQpDQoNCiAgICAkYWNjICA9IEAoKCcrJywnMicpLCgnLScsJzEyJyksKCchJywnMTQnKSwoJyonLCczJykpDQogICAgJHRiICAgPSAnJzskZnVuYyAgID0gJGZhbHNlDQogICAgd2hpbGUgKCRUZXh0LmNoYXJzKDApIC1lcSAneCcpIHskZnVuYyA9ICR0cnVlOyAkVGV4dCA9ICRUZXh0LnN1YnN0cmluZygxKS50cmltKCl9DQogICAgd2hpbGUgKCRUZXh0LmNoYXJzKDApIC1lcSAnPicpIHskdGIgKz0gIiAgICAiOyAkVGV4dCA9ICRUZXh0LnN1YnN0cmluZygxKS50cmltKCl9DQogICAgJFNpZ24gPSAkVGV4dC5jaGFycygwKQ0KICAgICRUZXh0ID0gJFRleHQuc3Vic3RyaW5nKDEpLnRyaW0oKS5yZXBsYWNlKCcveFwnLCcnKS5yZXBsYWNlKCdbLl0nLCdbQ3VycmVudCBEaXJlY3RvcnldJykNCiAgICAkdmVycyA9ICRmYWxzZQ0KICAgIGZvcmVhY2ggKCRhciBpbiAkYWNjKSB7aWYgKCRhclswXSAtZXEgJHNpZ24pIHskdmVycyA9ICR0cnVlOyAkY2xyID0gJGFyWzFdOyAkU2lnbiA9ICJbJHtTaWdufV0gIn19DQogICAgaWYgKCEkdmVycykge1Rocm93ICJJbmNvcnJlY3QgU2lnbiBbJFNpZ25dIFBhc3NlZCEifQ0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokZnVuYyAtZiAkY2xyICR0YiRTaWduJFRleHQNCn0KClNldC1BbGlhcyBpbnYgUHJvY2Vzcy1UcmFuc3BhcmVuY3kKU2V0LUFsaWFzID86IEludm9rZS1UZXJuYXJ5")))
# ========================================END=OF=COMPILER===========================================================|
$TMP      = ".\AP-Cracker"
$SyncHash = [hashtable]::Synchronized(@{})
$SyncPins = [hashtable]::Synchronized(@{})
$SyncRemH = [hashtable]::Synchronized(@{})
function Card-Type($CardNumber){
    switch ("$CardNumber"[0]) { 
        0 {"ISO/TC 68 Assigned Card"}
        1 {"Airline Card"} 
        2 {"Airline Card"} 
        3 {"Diners, AMEX, or JCB Card"} 
        4 {"Visa Card"} 
        5 {"MasterCard"} 
        6 {"Retailer, Discover, or Bank Card"} 
        7 {"Petroleum Card"}
        8 {"Healthcare, Telecom, or other industry Card"} 
        9 {"National Banking Card"}
        default {"Unknown"}
    }
}
function Is-Valid-Card ([Alias("CN","Number","num")][Parameter(Mandatory=$True)]$CNumber) {
    # Based on the Luhn Check By Apoorv Verma [AP]
    $CNumber = ($CNumber+"").ToCharArray() | ? {[Char]::IsDigit("$_")} | % {[int]("$_")}
    if ($Cnumber.count -lt 4*4) {return $false}
    [Array]::Reverse($Cnumber)
    for ($i = 0;$i -lt $Cnumber.count;$i++) {
        if ($i%2 -eq 0) {continue}
        $CNumber[$i] *= 2
        while ($CNumber[$i] -gt 9) {
            $CNumber[$i] = Invoke-Expression ("$($CNumber[$i])".toCharArray() -join("+"))
        }
    }
    $Sum = 0
    $CNumber | % {$Sum += $_}
    return ($Sum%10 -eq 0)
}
function Decrypt-String($Encrypted, $Passphrase, $salt="SaltCrypto", $init="IV_Password") { 
    # If the value in the Encrypted is a string, convert it to Base64 
    if($Encrypted -is [string]){ 
        $Encrypted = [Convert]::FromBase64String($Encrypted) 
    } 
 
    # Create a COM Object for RijndaelManaged Cryptography 
    $r = new-Object System.Security.Cryptography.RijndaelManaged 
    # Convert the Passphrase to UTF8 Bytes 
    $pass = [Text.Encoding]::UTF8.GetBytes($Passphrase) 
    # Convert the Salt to UTF Bytes 
    $salt = [Text.Encoding]::UTF8.GetBytes($salt) 
 
    # Create the Encryption Key using the passphrase, salt and SHA1 algorithm at 256 bits 
    $r.Key = (new-Object Security.Cryptography.PasswordDeriveBytes $pass, $salt, "SHA1", 5).GetBytes(32) #256/8 
    # Create the Intersecting Vector Cryptology Hash with the init 
    $r.IV = (new-Object Security.Cryptography.SHA1Managed).ComputeHash( [Text.Encoding]::UTF8.GetBytes($init) )[0..15] 
    # Create a new Decryptor 
    $d = $r.CreateDecryptor() 
    # Create a New memory stream with the encrypted value. 
    $ms = new-Object IO.MemoryStream @(,$Encrypted) 
    # Read the new memory stream and read it in the cryptology stream 
    $cs = new-Object Security.Cryptography.CryptoStream $ms,$d,"Read" 
    # Read the new decrypted stream 
    $sr = new-Object IO.StreamReader $cs 
    # Return from the function the stream 
    Write-Output $sr.ReadToEnd() 
    # Stops the stream     
    $sr.Close() 
    # Stops the crypology stream 
    $cs.Close() 
    # Stops the memory stream 
    $ms.Close() 
    # Clears the RijndaelManaged Cryptology IV and Key 
    $r.Clear() 
} 
function SHA1-test-hash($toTest){
    #Hash Result
    $res=""

    #Cracked?
    $cracked=0
    
    #Hash Function
    $SHA1_hasher = new-object System.Security.Cryptography.SHA1Managed
    $toHash = [System.Text.Encoding]::UTF8.GetBytes($toTest)
    $hashByteArray = $SHA1_hasher.ComputeHash($toHash)
    foreach($byte in $hashByteArray) {
        $res += "{0:X2}" -f $byte
    }

#    write-AP "!$totest --- $res"
    #Compare and write to file
    if ($checkHash -eq $res){
        #Echo out found CC Numbers to the screen
        Write-Host "`n`nFound SHA1:"$res"`nCardNumber: "$toTest
        $toWrite="CC_Number:"+$toTest+":Hash:"+$checkHash+""
        $toWrite | out-file -encoding ASCII -append $output_file
        $cracked=1
    }
    return $res
}
#-------------------------------------------
    #[System.Text.Encoding]::ASCII.GetString(
#-------------------------------------------
[io.file]::ReadAllLines($PinFile) | ? {![String]::IsNullOrEmpty($_)} | % {
    $SyncPin += @{$_ = SHA1-test-hash $_}
}
[io.file]::ReadAllLines($Dict) | ? {![String]::IsNullOrEmpty($_)} | % {
    $str = ([System.Convert]::FromBase64String("$_"))
    $str = ($str | % {$a = [Convert]::ToString([byte]$_, 16); ?:($a.length -eq 1){"0$a"}{$a}}) -join("")
    $SyncHash += @{$str.toUpper() = -1}
}   
#seq 0000000000 1 9999999999 | % {"0"*(10-$_.length)+"$_"} | % {$SyncRemH += @{$_ = $false}}
#-------------------------------------------
$ScriptBlock = {
    Param ($Param)
    [int]$ID = $Param[0]
    $Start = $Param[1]
    $Stop = $Param[2]
    $Sync = @{}
    seq $Start 1 $Stop | % {"0"*(10-$_.length)+"$_"} | % {$Sync += @{$_ = $false}}
    $RunResult = New-Object PSObject -Property @{
        ID   = $ID
        Sync = $Sync
    }
    Return $RunResult
}
$MaxNum = 9999999999
$MaxThr = 100
$RunspacePool = [RunspaceFactory]::CreateRunspacePool(1, 10)
$RunspacePool.Open()
$Jobs = @()
1..$MaxThr | % {
   #Start-Sleep -Seconds 1
   $StaN = ($MaxNum+1)*($_-1)/$MaxThr-1
   $EndN = ($MaxNum+1)*$_/$MaxThr-1
   if ($StaN -lt 0) {$StaN=0}
   $Job = [powershell]::Create().AddScript($ScriptBlock).AddArgument(@($_,$StaN,$EndN))
   $Job.RunspacePool = $RunspacePool
   $Jobs += New-Object PSObject -Property @{
      RunNum = $_
      Pipe = $Job
      Result = $Job.BeginInvoke()
   }
}
Do {
   Write-Host "." -NoNewline
   Start-Sleep -Seconds 1
} While ( $Jobs.Result.IsCompleted -contains $false)
Write-Host "All jobs completed!"
 
$Results = @()
ForEach ($Job in $Jobs)
{   $Results += $Job.Pipe.EndInvoke($Job.Result)
}
 
$Results 
#-------------------------------------------
if (!(test-path $TMP -type container)) {md $TMP}
Write-AP "*Finding IINs ..."
$IIN = ($SyncPin.Keys | % {$_.substring(0,6)} | sort -Unique)
Write-AP "*Running BruteForcer ..."
ForEach ($Hash in $SyncHash.Keys.GetEnumerator()) {
    
    $Hash
}
#.\CC_Checker.ps1 "$TMP\Process.txt" "$TMP\Solved.txt" 1
