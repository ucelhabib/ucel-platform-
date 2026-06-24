# ÜÇEL Steel Construction — Ortak Klasör Açma Helper (v3 — log + debug)
param([string]$Url)

$logPath = Join-Path $env:TEMP "UCEL_KlasorAc.log"
function Log($msg) {
  $stamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
  "$stamp $msg" | Out-File -Append -Encoding utf8 $logPath
}

try {
  Log "Gelen URL: $Url"
  if ([string]::IsNullOrWhiteSpace($Url)) {
    Log "URL boş — çıkılıyor"
    exit 0
  }

  # 1) ucelopen:// prefix sil
  $p = $Url -replace '^ucelopen:[/]*', ''
  Log "Prefix sonrası: $p"

  # 2) URL decode (System.Web GEREKMEZ)
  $p = [System.Uri]::UnescapeDataString($p)
  Log "Decode sonrası: $p"

  # 3) / → \
  $p = $p -replace '/', '\'
  Log "Slash sonrası: $p"

  # 4) UNC tamamla
  if ($p -notmatch '^\\\\' -and $p -notmatch '^[A-Za-z]:\\' -and $p -match '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+') {
    $p = '\\' + $p
    Log "UNC olarak düzeltildi: $p"
  }

  Log "Açılıyor: $p"
  Start-Process explorer.exe -ArgumentList ('"' + $p + '"')
  Log "Explorer komutu gönderildi"
} catch {
  Log ("HATA: " + $_.Exception.Message)
  # Hata varsa pencereyi açık tut ki kullanıcı görsün
  Write-Host ""
  Write-Host "================================================" -ForegroundColor Red
  Write-Host "  KLASÖR AÇMA HATASI" -ForegroundColor Red
  Write-Host "================================================" -ForegroundColor Red
  Write-Host "URL: $Url"
  Write-Host "Hata: $($_.Exception.Message)"
  Write-Host ""
  Write-Host "Log dosyası: $logPath"
  Write-Host ""
  Write-Host "Devam etmek için Enter'a bas..."
  Read-Host
}
