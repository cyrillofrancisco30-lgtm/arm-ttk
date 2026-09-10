@{
    name = "Update TTK Cache"
    uses = "Azure/powershell@v1"
    with = @{
        "inlineScript" = @'
Get-ChildItem -Recurse -Filter arm-ttk.psd1 | Import-Module -Name { $_.FullName} -Force -PassThru | Out-String
Update-TTKCache
'@
        "azPSVersion" = "3.1.0"
    }
}
<#
name: Azure PowerShell Action
        uses: Azure/powershell@v1
        with:
          inlineScript: Get-AzVM -ResourceGroupName "< YOUR RESOURCE GROUP >"
          azPSVersion: 3.1.0
#>

FROZEN — TRUST DERIVATION PRINCIPLE

EVIDENCE ≠ DECISION
DECISION ≠ TRUST
TRUST ≠ INHERITANCE

IDENTITY ≠ EXECUTION
EXECUTION ≠ RESULT
RESULT ≠ VERIFICATION

INTEGRITY ≠ TRUTH
PROVENANCE ≠ EXECUTION
EXECUTION_EVIDENCE ≠ VERIFIED

VERIFIED SHALL BE DERIVED ONLY BY:
    CLAIM
    +
CLAIM-SCOPED EVIDENCE
    +
VALID BINDINGS
    +
APPLICABLE CLAIM CONTRACT
    +
DETERMINISTIC VERIFICATION
    +
TRUST POLICY

NO AUTOMATIC STATE PROMOTION.
NO GLOBAL STATE INHERITANCE.
NO IMPLICIT TRUST PROPAGATION.
