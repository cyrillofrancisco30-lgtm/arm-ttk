name: XA-TRUST - ARM-TTK Validation

on:
  push:
    branches: ["main"]
  pull_request:
  workflow_dispatch:

permissions:
  contents: read

concurrency:
  group: xa-arm-ttk-${{ github.ref }}
  cancel-in-progress: false

jobs:
  arm-ttk-tests:
    name: ARM-TTK Unit Tests
    runs-on: windows-latest

    steps:
      - name: Checkout source
        uses: actions/checkout@v4
        with:
          persist-credentials: false

      # Inserir aqui as etapas de evidência,
      # validação de caminhos, testes e publicação.


name: XA-TRUST - ARM-TTK Validation

on:
  push:
    branches: ["main"]
  pull_request:
  workflow_dispatch:

permissions:
  contents: read

concurrency:
  group: xa-arm-ttk-${{ github.ref }}
  cancel-in-progress: false

jobs:
  arm-ttk-tests:
    name: ARM-TTK Unit Tests
    runs-on: windows-latest

    steps:
      - name: Checkout source
        uses: actions/checkout@v4
        with:
          persist-credentials: false

      - name: Record execution context
        shell: pwsh
        run: |
          $ErrorActionPreference = "Stop"

          New-Item -ItemType Directory `
            -Path evidence -Force | Out-Null

          @{
            schema_version = "1.0.0"
            evidence_scope = "ARM_TTK_UNIT_TESTS"
            repository = "${{ github.repository }}"
            commit_sha = "${{ github.sha }}"
            ref = "${{ github.ref }}"
            run_id = "${{ github.run_id }}"
            run_attempt = "${{ github.run_attempt }}"
            workflow = "${{ github.workflow }}"
            runner_os = [System.Runtime.InteropServices.RuntimeInformation]::OSDescription
            powershell_version = $PSVersionTable.PSVersion.ToString()
            started_at_utc = [DateTime]::UtcNow.ToString("o")
          } | ConvertTo-Json -Depth 5 |
            Set-Content evidence/execution-context.json -Encoding utf8

      - name: Verify ARM-TTK paths
        shell: pwsh
        run: |
          $ErrorActionPreference = "Stop"

          $module = Join-Path $env:GITHUB_WORKSPACE `
            "arm-ttk/arm-ttk/arm-ttk.psd1"

          $tests = Join-Path $env:GITHUB_WORKSPACE `
            "arm-ttk/unit-tests/arm-ttk.tests.ps1"

          if (!(Test-Path $module)) {
            throw "ARM-TTK module not found: $module"
          }

          if (!(Test-Path $tests)) {
            throw "ARM-TTK test script not found: $tests"
          }

      - name: Run ARM-TTK unit tests
        id: tests
        shell: pwsh
        continue-on-error: true
        run: |
          $ErrorActionPreference = "Stop"

          $testDir = Join-Path $env:GITHUB_WORKSPACE `
            "arm-ttk/unit-tests"

          $module = Join-Path $env:GITHUB_WORKSPACE `
            "arm-ttk/arm-ttk/arm-ttk.psd1"

          $log = Join-Path $env:GITHUB_WORKSPACE `
            "evidence/arm-ttk-tests.log"

          $global:LASTEXITCODE = 0
          $testExitCode = 0

          try {
            Set-Location $testDir

            Import-Module $module -Force -ErrorAction Stop

            Start-Transcript -Path $log -Force

            try {
              .\arm-ttk.tests.ps1
              if ($LASTEXITCODE -ne 0) {
                $testExitCode = $LASTEXITCODE
              }
            }
            catch {
              $_ | Out-String | Add-Content $log
              $testExitCode = 1
            }
            finally {
              Stop-Transcript
            }
          }
          catch {
            $_ | Out-String | Add-Content $log
            $testExitCode = 1
          }

          @{
            test_scope = "ARM_TTK_UNIT_TESTS"
            exit_code = $testExitCode
            outcome = if ($testExitCode -eq 0) {
              "PASS"
            } else {
              "FAIL"
            }
            completed_at_utc = [DateTime]::UtcNow.ToString("o")
          } | ConvertTo-Json |
            Set-Content evidence/test-result.json -Encoding utf8

          "exit_code=$testExitCode" |
            Add-Content $env:GITHUB_OUTPUT

      - name: Generate evidence manifest
        if: always()
        shell: pwsh
        run: |
          $ErrorActionPreference = "Stop"

          $root = Join-Path $env:GITHUB_WORKSPACE "evidence"
          New-Item -ItemType Directory -Path $root -Force |
            Out-Null

          $manifest = Get-ChildItem $root -File |
            Where-Object { $_.Name -ne "sha256-manifest.txt" } |
            Sort-Object Name |
            ForEach-Object {
              $hash = Get-FileHash $_.FullName -Algorithm SHA256
              "$($hash.Hash.ToLowerInvariant())  $($_.Name)"
            }

          $manifest |
            Set-Content (Join-Path $root "sha256-manifest.txt") `
              -Encoding utf8

      - name: Upload evidence
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: xa-arm-ttk-evidence-${{ github.run_id }}-${{ github.run_attempt }}
          path: evidence/
          if-no-files-found: warn
          retention-days: 90

      - name: Enforce test result
        if: always()
        shell: pwsh
        env:
          TEST_EXIT_CODE: ${{ steps.tests.outputs.exit_code }}
        run: |
          if ($TEST_EXIT_CODE -ne "0") {
            throw "ARM-TTK validation failed or did not complete successfully."
          }



# Azure Resource Manager Template Toolkit (arm-ttk)

The code in this repository can be used for analyzing and testing [Azure Resource Manager Templates](https://docs.microsoft.com/azure/templates/).  The tests will check a template or set of templates for coding best practices.  There are some checks for simple syntactical errors but the intent is not to re-implement tests or checks that are provided by the platform (e.g. the /validate api).  

>**Note:**
>Starting  with the 0.10 release, [Bicep](https://github.com/Azure/bicep) now contains all of the deploymentTemplate test cases included in the TTK.  We will begin moving the investment in new tests to the Bicep linter.  The TTK will remain available to support available JSON and createUiDefinition scenarios.

## Using the TTK

For detailed instruction on how to use the arm-ttk, see this [readme](/arm-ttk/README.md).  More information can be found in the [documentation](http://docs.microsoft.com/azure/azure-resource-manager/templates/test-toolkit).

For a guided tutorial on the arm-ttk, check out this [MS LEARN module](https://docs.microsoft.com/learn/modules/arm-template-test/).

## Philosophy

A little bit about the tests...  These are the tests that are used to validate templates for the [Azure QuickStart Repo](https://github.com/Azure/azure-quickstart-templates) and the [Azure Marketplace](https://azuremarketplace.microsoft.com/marketplace/).  The purpose is to ensure a standard or consistent set of coding practices to make it easier to develop expertise using the template language (easy to read, write, debug).

As for the type, number and  nature of the tests a test should check for something in the following categories (add more as you think of them :))

- Validating the author's intent (unused parameters or variables)
- Security practices for the language (outputting secrets in plain text)
- Using the appropriate language construct for the task at hand (using environmental functions instead of hard-coding values)

Not everything is appropriate for a universal set of tests and not every test will apply to every scenario, so the framework allows for easy expansion and individual selection of tests.

## Running Unit Tests locally before request a PR

Tests can be run directly in PowerShell, or run from the command line using a wrapper script.

You can run all of the unit tests by using **.\arm-ttk.tests.ps1**.

This will run the full suite of unit tests against the tests json files.

use:

    # set your location in the project directory:
    Set-Location -Path "$(YourGithubProjectFolder)\arm-ttk\unit-tests"
    
    # import the module from the current branch, use -Force to make sure you have imported any code changes
    Import-Module ..\arm-ttk\arm-ttk.psd1 -Force

    # These are the same tests that run in the pipeline when doing a commit or a pull request (PR). 
    .\arm-ttk.tests.ps1

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repositories using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).

For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
