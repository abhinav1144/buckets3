$Env:AWS_ACCESS_KEY_ID="$($env:access)" 
$Env:AWS_SECRET_ACCESS_KEY="$($env:key)" 

$inital = Initialize-AWSDefaultConfiguration -AccessKey AWS_ACCESS_KEY_ID -SecretKey AWS_SECRET_ACCESS_KEY -Region us-east-1

$path2 = /home/osiuser/bucket

$path = Get-ChildItem -path  $path2/* -Recurse -Include *.txt

$latestfile = $path | Sort-Object -Descending -Property LastWriteTime | select -First 3

$latestfile.Name

foreach ($copy in $latestfile.Name)
{
    aws s3 cp /home/osiuser/bucket/$copy  s3://sample97/test/ 
}
