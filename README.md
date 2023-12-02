# License Approval

A [Github Action](https://github.com/features/actions) that helps you track and approve licenses your project uses.

How it works:
* You add a new dependency to your project and send it out for review in a pull request
* License Approval detects the new dependency and finds the license
  * For completeness License Approval checks transitive dependencies as well
* If License Approval finds any license that isn't on the permitted list, it will block the pull request
* Your team can review the license or consult with your legal team to determine if the license is acceptable
* Finally you can add the license to the permitted list or restricted list as needed.

This project relies heavily on [pivotal/LicenseFinder](https://github.com/pivotal/LicenseFinder). Be sure to review their docs as well.

## Status

BETA. Working with Ruby/Bundle examples only at the moment.

## Setup

First install [license_finder](https://github.com/pivotal/LicenseFinder) locally:

    $ gem install license_finder

Run the tool:

    $ license_finder

You'll probably see a failure on the first run, with output like:

```
LicenseFinder::Bundler: is active

Dependencies that need approval:
bundler, 1.17.2, MIT
license_finder, 5.10.2, MIT
parslet, 1.8.2, MIT
rubyzip, 2.0.0, "Simplified BSD"
thor, 0.20.3, MIT
toml, 0.2.0, MIT
with_env, 1.1.0, MIT
xml-simple, 1.1.5, ruby
```

This indicates that the tool doesn't know if the `MIT`, `Simplified BSD`, and `ruby` licenses are acceptable for your project.

You can mark the MIT license as acceptable by running:

    license_finder permitted_licenses add MIT

Now any `MIT` licensed dependencies will automatically be approved.

If you don't want to fully approve a license you can approve packages individually as well:

    license_finder approvals add xml-simple

Once you've approved everything you need, you can turn on the workflow by adding a file under `.github/workflows`. See examples: https://github.com/ralexander-phi/license_approval_testing/blob/master/.github/workflows/

Tweak your workflow if needed, then start a pull request with the changes. If everything is working, you should see a new check in the pull request and it should be passing. If so, congratulations, you're done.

Now your team will be able to keep track of software licensing approvals right in your pull request workflow.

Feel free to open an issue if you run into any issues or have suggestions for improvements.

