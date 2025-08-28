# Update all HTML files with new header structure (controls before Kadro)
$pages = @(
    "kadro.html",
    "etkinlikler.html", 
    "ekip1.html",
    "ekip2.html", 
    "ekip3.html",
    "kulube-katil.html",
    "iletisim.html"
)

# New header template with controls first
$headerTemplate = @'
  <header class="top-panel" role="banner">
    <a class="brand" href="index.html" aria-label="Foundry — Science & Art Club">
      <img class="logo" src="logo.png" alt="Foundry logo" />
      <div class="title" aria-hidden="false">
        <span class="title-line foundry">FOUNDRY</span>
        <span class="title-line subtitle">Science &amp; Art Club</span>
      </div>
    </a>
    <button class="mobile-menu-toggle" id="mobileMenuToggle" aria-label="Menüyü aç/kapat">
      <i class="fa-solid fa-bars"></i>
    </button>
    <nav class="nav-actions" aria-label="Birincil menü">
      <div class="nav-controls">
        <button class="control-btn theme-toggle" id="themeToggle" aria-label="Temayı değiştir">
          <i class="fa-solid fa-sun theme-icon"></i>
        </button>
        <div class="lang-selector">
          <button class="control-btn lang-toggle" id="langToggle" aria-haspopup="true" aria-expanded="false">
            <i class="fa-solid fa-globe"></i>
            <span class="lang-text">TR</span>
            <i class="fa-solid fa-chevron-down lang-caret"></i>
          </button>
          <div class="lang-menu" id="langMenu">
            <a href="#" class="lang-option" data-lang="tr">🇹🇷 Türkçe</a>
            <a href="#" class="lang-option" data-lang="en">🇺🇸 English</a>
            <a href="#" class="lang-option" data-lang="de">🇩🇪 Deutsch</a>
            <a href="#" class="lang-option" data-lang="fr">🇫🇷 Français</a>
          </div>
        </div>
      </div>
      <a class="nav-link" href="kadro.html" data-tr="Kadro" data-en="Staff" data-de="Personal" data-fr="Personnel">Kadro</a>
      <a class="nav-link" href="etkinlikler.html" data-tr="Etkinlikler" data-en="Events" data-de="Veranstaltungen" data-fr="Événements">Etkinlikler</a>
      <div class="dropdown">
        <button class="dropdown-toggle nav-link" aria-haspopup="true" aria-expanded="false" aria-controls="teams-menu">
          <span data-tr="Ekipler" data-en="Teams" data-de="Teams" data-fr="Équipes">Ekipler</span>
          <span class="caret" aria-hidden="true">▾</span>
        </button>
        <div id="teams-menu" class="dropdown-menu" role="menu" aria-label="Ekipler">
          <a role="menuitem" tabindex="-1" class="dropdown-item" href="ekip1.html">Lorem ipsum 1</a>
          <a role="menuitem" tabindex="-1" class="dropdown-item" href="ekip2.html">Lorem ipsum 2</a>
          <a role="menuitem" tabindex="-1" class="dropdown-item" href="ekip3.html">Lorem ipsum 3</a>
        </div>
      </div>
      <a class="nav-link" href="iletisim.html" data-tr="İletişim" data-en="Contact" data-de="Kontakt" data-fr="Contact">İletişim</a>
      <a class="nav-link cta" href="kulube-katil.html" data-tr="Kulübe Katıl" data-en="Join Club" data-de="Club Beitreten" data-fr="Rejoindre le Club">Kulübe Katıl</a>
    </nav>
  </header>
'@

foreach ($page in $pages) {
    if (Test-Path $page) {
        Write-Host "Updating header in $page..." -ForegroundColor Green
        
        $content = Get-Content $page -Raw
        
        # Replace header section
        $content = $content -replace '(?s)<header class="top-panel".*?</header>', $headerTemplate
        
        Set-Content $page $content -Encoding UTF8
        Write-Host "✓ Updated $page" -ForegroundColor Green
    } else {
        Write-Host "⚠ File not found: $page" -ForegroundColor Yellow
    }
}

Write-Host "`n✅ All headers updated with new structure!" -ForegroundColor Green
Write-Host "🎯 Controls now positioned before Kadro" -ForegroundColor Cyan
Write-Host "📱 Mobile dropdown properly configured" -ForegroundColor Cyan
Write-Host "🔧 Dropdown menus will show team links" -ForegroundColor Cyan
