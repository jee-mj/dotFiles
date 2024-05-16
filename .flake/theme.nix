{
  config,
  pkgs,
  ...
}: {
  home.file = {
    solarizedColors = {
      target = ".local/share/color-schemes/SolarizedDark.colors";
      text = ''
        [ColorEffects:Disabled]
        Color=88,110,117
        ColorAmount=0
        ColorEffect=3
        ContrastAmount=0.55
        ContrastEffect=1
        IntensityAmount=-1
        IntensityEffect=0

        [ColorEffects:Inactive]
        Color=112,111,110
        ColorAmount=0
        ColorEffect=0
        ContrastAmount=0
        ContrastEffect=0
        Enable=false
        IntensityAmount=-1
        IntensityEffect=0

        [Colors:Button]
        BackgroundAlternate=0,43,54
        BackgroundNormal=0,43,54
        DecorationFocus=147,161,161
        DecorationHover=238,232,213
        ForegroundActive=133,153,0
        ForegroundInactive=88,110,117
        ForegroundLink=38,139,210
        ForegroundNegative=211,54,130
        ForegroundNeutral=88,110,117
        ForegroundNormal=147,161,161
        ForegroundPositive=42,161,152
        ForegroundVisited=108,113,196

        [Colors:Selection]
        BackgroundAlternate=131,148,150
        BackgroundNormal=147,161,161
        DecorationFocus=147,161,161
        DecorationHover=238,232,213
        ForegroundActive=133,153,0
        ForegroundInactive=7,54,66
        ForegroundLink=38,139,210
        ForegroundNegative=211,54,130
        ForegroundNeutral=88,110,117
        ForegroundNormal=7,54,66
        ForegroundPositive=42,161,152
        ForegroundVisited=108,113,196

        [Colors:Tooltip]
        BackgroundAlternate=0,43,54
        BackgroundNormal=0,43,54
        DecorationFocus=147,161,161
        DecorationHover=238,232,213
        ForegroundActive=133,153,0
        ForegroundInactive=88,110,117
        ForegroundLink=38,139,210
        ForegroundNegative=211,54,130
        ForegroundNeutral=88,110,117
        ForegroundNormal=147,161,161
        ForegroundPositive=42,161,152
        ForegroundVisited=108,113,196

        [Colors:View]
        BackgroundAlternate=7,54,66
        BackgroundNormal=0,43,54
        DecorationFocus=147,161,161
        DecorationHover=238,232,213
        ForegroundActive=133,153,0
        ForegroundInactive=88,110,117
        ForegroundLink=38,139,210
        ForegroundNegative=211,54,130
        ForegroundNeutral=88,110,117
        ForegroundNormal=147,161,161
        ForegroundPositive=42,161,152
        ForegroundVisited=108,113,196

        [Colors:Window]
        BackgroundAlternate=7,54,66
        BackgroundNormal=7,54,66
        DecorationFocus=147,161,161
        DecorationHover=238,232,213
        ForegroundActive=133,153,0
        ForegroundInactive=88,110,117
        ForegroundLink=38,139,210
        ForegroundNegative=211,54,130
        ForegroundNeutral=88,110,117
        ForegroundNormal=147,161,161
        ForegroundPositive=42,161,152
        ForegroundVisited=108,113,196

        [General]
        ColorScheme=Solarized Dark
        Name=Solarized Dark
        shadeSortColumn=true

        [KDE]
        contrast=5

        [WM]
        activeBackground=7,54,66
        activeBlend=88,110,117
        activeForeground=147,161,161
        inactiveBackground=0,43,54
        inactiveBlend=101,123,131
        inactiveForeground=88,110,117
      '';
    };
    gruvboxIcons = {
      recursive = true;
      source = ./local/share/icons/Gruvbox;
      target = ".local/share/icons/Gruvbox";
    };
    kdeglobals = {
      target = ".config/kdeglobals";
      text = ''
        [ColorEffects:Disabled]
        ChangeSelectionColor=
        Color=88,110,117
        ColorAmount=0
        ColorEffect=3
        ContrastAmount=0.55
        ContrastEffect=1
        Enable=
        IntensityAmount=-1
        IntensityEffect=0

        [ColorEffects:Inactive]
        ChangeSelectionColor=
        Color=112,111,110
        ColorAmount=0
        ColorEffect=0
        ContrastAmount=0
        ContrastEffect=0
        Enable=false
        IntensityAmount=-1
        IntensityEffect=0

        [Colors:Button]
        BackgroundAlternate=0,43,54
        BackgroundNormal=0,43,54
        DecorationFocus=147,161,161
        DecorationHover=238,232,213
        ForegroundActive=133,153,0
        ForegroundInactive=88,110,117
        ForegroundLink=38,139,210
        ForegroundNegative=211,54,130
        ForegroundNeutral=88,110,117
        ForegroundNormal=147,161,161
        ForegroundPositive=42,161,152
        ForegroundVisited=108,113,196

        [Colors:Selection]
        BackgroundAlternate=131,148,150
        BackgroundNormal=147,161,161
        DecorationFocus=147,161,161
        DecorationHover=238,232,213
        ForegroundActive=133,153,0
        ForegroundInactive=7,54,66
        ForegroundLink=38,139,210
        ForegroundNegative=211,54,130
        ForegroundNeutral=88,110,117
        ForegroundNormal=7,54,66
        ForegroundPositive=42,161,152
        ForegroundVisited=108,113,196

        [Colors:Tooltip]
        BackgroundAlternate=0,43,54
        BackgroundNormal=0,43,54
        DecorationFocus=147,161,161
        DecorationHover=238,232,213
        ForegroundActive=133,153,0
        ForegroundInactive=88,110,117
        ForegroundLink=38,139,210
        ForegroundNegative=211,54,130
        ForegroundNeutral=88,110,117
        ForegroundNormal=147,161,161
        ForegroundPositive=42,161,152
        ForegroundVisited=108,113,196

        [Colors:View]
        BackgroundAlternate=7,54,66
        BackgroundNormal=0,43,54
        DecorationFocus=147,161,161
        DecorationHover=238,232,213
        ForegroundActive=133,153,0
        ForegroundInactive=88,110,117
        ForegroundLink=38,139,210
        ForegroundNegative=211,54,130
        ForegroundNeutral=88,110,117
        ForegroundNormal=147,161,161
        ForegroundPositive=42,161,152
        ForegroundVisited=108,113,196

        [Colors:Window]
        BackgroundAlternate=7,54,66
        BackgroundNormal=7,54,66
        DecorationFocus=147,161,161
        DecorationHover=238,232,213
        ForegroundActive=133,153,0
        ForegroundInactive=88,110,117
        ForegroundLink=38,139,210
        ForegroundNegative=211,54,130
        ForegroundNeutral=88,110,117
        ForegroundNormal=147,161,161
        ForegroundPositive=42,161,152
        ForegroundVisited=108,113,196

        [General]
        BrowserApplication=firefox.desktop
        ColorSchemeHash=f01c109dba6fc46c5a5fd0b176564d387298c0b0
        LastUsedCustomAccentColor=232,203,45
        XftHintStyle=hintslight
        XftSubPixel=none
        fixed=RobotoMono Nerd Font Propo [GOOG],11,-1,5,50,0,0,0,0,0
        font=Noto Sans Devanagari,11,-1,5,50,0,0,0,0,0
        menuFont=Noto Serif,11,-1,5,25,0,0,0,0,0,Light
        smallestReadableFont=Noto Sans Devanagari,9,-1,5,25,0,0,0,0,0,Light
        toolBarFont=Noto Serif,11,-1,5,25,0,0,0,0,0,Light

        [Icons]
        Theme=Gruvbox

        [KDE]
        AnimationDurationFactor=0.25
        LookAndFeelPackage=org.kde.breezedark.desktop
        widgetStyle=Lightly

        [KFileDialog Settings]
        Allow Expansion=false
        Automatically select filename extension=true
        Breadcrumb Navigation=true
        Decoration position=2
        LocationCombo Completionmode=5
        PathCombo Completionmode=5
        Show Bookmarks=false
        Show Full Path=false
        Show Inline Previews=true
        Show Preview=false
        Show Speedbar=true
        Show hidden files=false
        Sort by=Date
        Sort directories first=true
        Sort hidden files last=false
        Sort reversed=true
        Speedbar Width=166
        View Style=DetailTree

        [WM]
        activeBackground=7,54,66
        activeBlend=88,110,117
        activeFont=Noto Serif,11,-1,5,25,0,0,0,0,0,Light
        activeForeground=147,161,161
        inactiveBackground=0,43,54
        inactiveBlend=101,123,131
        inactiveForeground=88,110,117
      '';
    };
    plasmarc = {
      target = ".config/plasmarc";
      text = ''
        [Theme]
        name=gruvbox
      '';
    };
  };
}
