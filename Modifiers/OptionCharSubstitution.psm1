using module "..\Types\Modifier.psm1"
using module "..\Types\Token.psm1"

class OptionCharSubstitution : Modifier {
    [char[]]$OutputOptionChars;

    OptionCharSubstitution([Token[]]$InputCommandTokens, [string[]]$AppliesTo, [float]$Probability, [object]$OutputOptionChars) : base($InputCommandTokens, $AppliesTo, $Probability) {
        $this.OutputOptionChars = $OutputOptionChars;
    }

    [void]GenerateOutput() {
        foreach ($Token in $this.InputCommandTokens) {
            if ($this.AppliesTo.Contains($Token.Type) -and ($this.OutputOptionChars | ForEach-Object {$_ -eq $Token.TokenContent[0] }) -contains $true) {
                $Token.TokenContent[0] = [Modifier]::ChooseRandom($this.OutputOptionChars);
            }
        }
    }
}
