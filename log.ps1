param(
    [Parameter(Mandatory=$true)]
    [string]$logPath
)

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Vérification du fichier
if (-not (Test-Path $logPath)) {
    [System.Windows.Forms.MessageBox]::Show("Fichier log introuvable : $logPath", "Erreur", "OK", "Error")
    exit
}

# Création de la fenêtre sans icône
$form = New-Object System.Windows.Forms.Form
$form.Text = ""
$form.Size = New-Object System.Drawing.Size(800, 600)
$form.BackColor = [System.Drawing.Color]::FromArgb(36, 36, 36)
$form.ForeColor = [System.Drawing.Color]::White
$form.StartPosition = "CenterScreen"
$form.ShowIcon = $false  # Désactive l'icône
$form.Icon = $null       # Supprime l'icône par défaut

# Configuration de la zone de texte
$textBox = New-Object System.Windows.Forms.RichTextBox
$textBox.Location = New-Object System.Drawing.Point(10, 10)
$textBox.Size = New-Object System.Drawing.Size(760, 540)
$textBox.BackColor = [System.Drawing.Color]::FromArgb(36, 36, 36)
$textBox.ForeColor = [System.Drawing.Color]::White
$textBox.Font = New-Object System.Drawing.Font("Consolas", 10)
$textBox.ReadOnly = $true
$textBox.ScrollBars = "Vertical"
$textBox.WordWrap = $false
$form.Controls.Add($textBox)

# Variables d'état
$lastPosition = 0
$fileStream = $null
$streamReader = $null
$timer = $null

function Initialize-Reader {
    try {
        if ($streamReader) { $streamReader.Dispose() }
        if ($fileStream) { $fileStream.Dispose() }

        $script:fileStream = New-Object System.IO.FileStream(
            $logPath,
            [System.IO.FileMode]::Open,
            [System.IO.FileAccess]::Read,
            [System.IO.FileShare]::ReadWrite
        )
        $script:streamReader = New-Object System.IO.StreamReader($fileStream)
        $script:lastPosition = 0
    }
    catch {
        [System.Windows.Forms.MessageBox]::Show("Erreur d'accès au fichier : $_", "Erreur", "OK", "Error")
    }
}

function Update-Logs {
    try {
        if (-not $form.IsHandleCreated) { return }

        if ($streamReader -eq $null) { Initialize-Reader }

        $currentPosition = $fileStream.Position
        $fileStream.Seek($lastPosition, [System.IO.SeekOrigin]::Begin) | Out-Null

        $newLines = @()
        while (-not $streamReader.EndOfStream) {
            $line = $streamReader.ReadLine()
            if (-not [string]::IsNullOrEmpty($line)) {
                $newLines += $line  # Suppression de l'horodatage
            }
        }

        $script:lastPosition = $fileStream.Position

        if ($newLines.Count -gt 0) {
            $form.Invoke([Action]{
                $textBox.AppendText(($newLines -join "`r`n") + "`r`n")
                $textBox.ScrollToCaret()
            })
        }
    }
    catch [System.ObjectDisposedException] {
        # Ignorer si la fenêtre est en cours de fermeture
    }
    catch {
        Initialize-Reader
    }
}

# Initialisation différée
$form.Add_Shown({
    Initialize-Reader
    Update-Logs

    $script:timer = New-Object System.Windows.Forms.Timer
    $timer.Interval = 500
    $timer.Add_Tick({ Update-Logs })
    $timer.Start()
})

# Nettoyage
$form.Add_FormClosing({
    if ($timer) { $timer.Stop() }
    if ($streamReader) { $streamReader.Dispose() }
    if ($fileStream) { $fileStream.Dispose() }
})

[void]$form.ShowDialog()