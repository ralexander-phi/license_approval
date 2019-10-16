# License Approval

A [Github Action](https://github.com/features/actions) that helps you track and approve licenses your project uses.

How it works:
* You add a new dependency to your project and send it out for review in a pull request
* License Approval detects the new dependency and finds the license
  * For completeness License Approval checks transitive dependencies as well
* If License Approval finds any license that isn't on the whitelist, it will block the pull request
* Your team can review the license or consult with your legal team to determine if the license is acceptable
* Finally you can add the license to the whitelist or blacklist as needed

## Setup





