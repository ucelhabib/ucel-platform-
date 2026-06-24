# ÜÇEL Steel Construction — Ortak Klasör Açma Helper (v2)
# ucelopen:// linklerini Dosya Gezgini'nde açar.
# System.Web bağımlılığı YOK — sadece .NET Core BCL kullanıyor.
param([string]$Url)

try {
  if ([string]::IsNullOrWhiteSpace($Url)) { exit 0 }

  # 1) ucelopen:// (slash sayısı değişebilir) prefix'ini sil
  $p = $Url -replace '^ucelopen:[/]*', ''

  # 2) URL decode — %20 → boşluk, %C4%B0 → İ vb. (System.Web GEREKMEZ)
  $p = [System.Uri]::UnescapeDataString($p)

  # 3) İleri slash'ları geri slash'a çevir (UNC ve yerel yollar için)
  $p = $p -replace '/', '\'

  # 4) Eğer UNC görünüyor ama \\ ile başlamıyorsa, başına ekle (ör: encodeURIComponent ham bıraktıysa)
  if ($p -notmatch '^\\\\' -and $p -notmatch '^[A-Za-z]:\\' -and $p -match '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+') {
    $p = '\\' + $p
  }

  # 5) Explorer'ı argümanla aç
  Start-Process explorer.exe -ArgumentList ('"' + $p + '"')
} catch {
  # Hatayı yakalayıp PowerShell penceresinde göster (debug için)
  Write-Host "HATA:" $_.Exception.Message
  Write-Host "URL:" $Url
  Start-Sleep -Seconds 5
}
