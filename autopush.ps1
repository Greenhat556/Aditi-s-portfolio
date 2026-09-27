Set-Location "C:\Users\mukhe\OneDrive\Documents\New Project\portfolio-site"
$target = "git@github.com:Greenhat556/portfolio.git"
Write-Host "Waiting for repository to be created at $target..."

$found = $false
for ($i = 0; $i -lt 120; $i++) {
    git ls-remote $target 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        $found = $true
        break
    }
    Start-Sleep -Seconds 2
}

if ($found) {
    Write-Host "Repository found! Pushing code..."
    git push -u origin main
    Write-Host "Successfully pushed to GitHub!"
} else {
    Write-Host "Timed out waiting for repository creation."
}
