# ÜÇEL Steel Construction — Ortak Klasör Açma Helper
# Bu script ucelopen:// linklerini alır, çözer ve Dosya Gezgini'nde açar.
param([string]$Url)

try {
  if ([string]::IsNullOrWhiteSpace($Url)) { exit 0 }

  # ucelopen:// prefix'ini kaldır (slash sayısı değişebilir)
  $p = $Url -replace '^ucelopen:[/]+', ''

  # URL encoding'i çöz: %20 → boşluk, %C4%B0 → İ vb.
  Add-Type -AssemblyName System.Web -ErrorAction SilentlyContinue
  try { $p = [System.Web.HttpUtility]::UrlDecode($p) } catch { $p = [Uri]::UnescapeDataString($p) }

  # / → \ (UNC ve yerel yollar için)
  $p = $p -replace '/', '\'

  # UNC yolu için başına \\ ekle (eğer JS slashları tek tek çevirdi ise)
  if ($p -match '^\\\\' -or $p -match '^[A-Za-z]:\\') {
    # Hazır UNC veya yerel yol
  } elseif ($p -match '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+') {
    $p = '\\' + $p
  }

  Start-Process explorer.exe -ArgumentList ('"' + $p + '"')
} catch {
  # Sessiz fail
}
