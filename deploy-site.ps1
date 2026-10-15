<#
.SYNOPSIS
    Automatización de Despliegue Global - PROJECTAI (Dínamo Sites)
.DESCRIPTION
    Comprime y despliega el sitio web generado a Netlify mediante su API REST oficial.
    Soporta Netlify Personal Access Token para publicación instantánea con SSL.
#>

param (
    [string]$NetlifyToken = $env:NETLIFY_AUTH_TOKEN,
    [string]$SiteId = $env:NETLIFY_SITE_ID,
    [switch]$OpenBrowser = $true
)

$ErrorActionPreference = "Stop"
$WorkingDir = "c:\Users\Nicolas\Downloads\CEREBRO\AGENTE_DIMANO_SITE"
$DistDir = Join-Path $WorkingDir "hero-ia-personalizada"
$ZipPath = Join-Path $WorkingDir "deploy_package.zip"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " PROJECTAI - PIPELINE DE DESPLIEGUE CONTINUO (DÍNAMO SITES)" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Empaquetado
Write-Host "[1/3] Empaquetando sitio web..." -ForegroundColor Yellow
if (Test-Path $ZipPath) { Remove-Item $ZipPath -Force }

Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($DistDir, $ZipPath)
$sizeKb = [Math]::Round((Get-Item $ZipPath).Length / 1KB, 2)
Write-Host "      Paquete generado con exito ($sizeKb KB)." -ForegroundColor Green

# 2. Despliegue
Write-Host "[2/3] Verificando credenciales de despliegue..." -ForegroundColor Yellow

if (-not $NetlifyToken) {
    Write-Host ""
    Write-Host "AVISO: No se detecto NETLIFY_AUTH_TOKEN configurado." -ForegroundColor Yellow
    Write-Host "Para desplegar gratis sin limites:" -ForegroundColor Gray
    Write-Host "1. Abre https://app.netlify.com/user/applications#personal-access-tokens" -ForegroundColor Gray
    Write-Host "2. Crea un token y ejecutalo asi:" -ForegroundColor Gray
    Write-Host "   .\deploy-site.ps1 -NetlifyToken 'TU_TOKEN_AQUI'" -ForegroundColor White
    Write-Host ""
    Write-Host "Alternativa Instantanea (Sin Token):" -ForegroundColor Cyan
    Write-Host "Se ha generado tu archivo ZIP listo para arrastrar y soltar en:" -ForegroundColor White
    Write-Host "-> $ZipPath" -ForegroundColor Green
    Write-Host "Abriendo Netlify Drop en tu navegador..." -ForegroundColor Yellow
    Start-Process "https://app.netlify.com/drop"
    Start-Process $WorkingDir
    exit 0
}

# 3. Publicación vía API
Write-Host "[3/3] Publicando en los servidores globales de Netlify..." -ForegroundColor Yellow
$headers = @{
    "Authorization" = "Bearer $NetlifyToken"
    "Content-Type"  = "application/zip"
}

try {
    if ($SiteId) {
        $uri = "https://api.netlify.com/api/v1/sites/$SiteId/deploys"
    } else {
        $uri = "https://api.netlify.com/api/v1/sites"
    }

    $response = Invoke-RestMethod -Uri $uri -Method Post -InFile $ZipPath -Headers $headers
    $liveUrl = $response.ssl_url
    if (-not $liveUrl) { $liveUrl = $response.url }

    Write-Host ""
    Write-Host "==========================================================" -ForegroundColor Green
    Write-Host " SITIO PUBLICADO EXITOSAMENTE CON SSL GLOBAL" -ForegroundColor Green
    Write-Host "==========================================================" -ForegroundColor Green
    Write-Host " URL EN VIVO: $liveUrl" -ForegroundColor Yellow
    Write-Host " ADMIN URL:   $($response.admin_url)" -ForegroundColor Gray
    Write-Host " SITE ID:     $($response.id)" -ForegroundColor Gray

    if ($OpenBrowser) {
        Start-Process $liveUrl
    }
} catch {
    Write-Host "Error en el despliegue: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    if (Test-Path $ZipPath) { Remove-Item $ZipPath -Force }
}
