# build_all.ps1
$apps = @("launcher", "retro-core", "prboom-go", "gnuboy-go")  # add/remove apps as needed

foreach ($app in $apps) {
    Write-Host "=== Building $app ===" -ForegroundColor Cyan
    Set-Location "C:\Espressif\projects\retro-go-debug\$app"
    
    # Clean old CMake cache
    idf.py fullclean
    
    # Build app
    $result = idf.py build
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Build failed for $app" -ForegroundColor Red
        break
    } else {
        Write-Host "✅ Build success for $app" -ForegroundColor Green
    }
}
