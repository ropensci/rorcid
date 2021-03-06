rorcid
======



<!-- badges: start -->
[![R build status](https://github.com/ropensci/rorcid/workflows/R-CMD-check/badge.svg)](https://github.com/ropensci/rorcid/actions)
[![cran checks](https://cranchecks.info/badges/worst/rorcid)](https://cranchecks.info/pkgs/rorcid)
[![codecov.io](https://codecov.io/github/ropensci/rorcid/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rorcid?branch=master)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/rorcid?color=2ED968)](https://github.com/r-hub/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/rorcid)](https://cran.r-project.org/package=rorcid)
<!-- badges: end -->

`rorcid` is an R programmatic interface to the Orcid public API. `rorcid` is not a product developed or distributed by ORCID®.

rorcid docs: <https://docs.ropensci.org/rorcid/>

Orcid API docs:

* Public API docs: <https://members.orcid.org/api>
* Swagger docs: https://pub.orcid.org/v3.0/#/Development_Public_API_v3.0

The package now works with the `v3.0` ORCID API. It's too complicated to allow users to work with different versions of the API, so it's hard-coded to `v3.0`.

## Authentication

There are three ways to authenticate with `rorcid`:

- Interactively login with OAuth. This doesn't require any input on
your part. We use a client id and client secret key to ping ORCID.org;
at which point you log in with your username/password; then we get back
a token (same as the above option). We don't know your username or
password, only the token that we get back. We cache that token locally
in a hidden file in whatever working directory you're in. If you delete
that file, or run the code from a new working directory, then we
re-authorize.
- Use a `client_id` and `client_secret` to do 2-legged OAuth. 
ORCID docs at https://members.orcid.org/api/oauth/2legged-oauth and
https://members.orcid.org/api/post-oauthtoken-reading-public-data
This requires you to register a "client application". See 
https://orcid.org/content/register-client-application-2 for instructions
- Use a token as a result of either of the two above approaches. The token
is a alphanumeric UUID, e.g. `dc0a6b6b-b4d4-4276-bc89-78c1e9ede56e`. You
can get this token by running `orcid_auth()`, then storing that key
(the uuid alone, not the "Bearer " part) either as en environment
variable in your `.Renviron` file in your home directory (with the name
`ORCID_TOKEN`), or as an R option in your `.Rprofile` file (with the name
`orcid_token`). See [Startup] for more information.
Either an environment variable or R option work. If we don't find
either we do the next option.

We recommend the 3rd option if possible, specifically, storing the token
as an environment variable permanently.

If authentication fails, you can still use `rorcid`. ORCID does not require
authentication at this point, but may in the future - this prepares you
for when that happens.

See <https://info.orcid.org/documentation/integration-guide/getting-started-with-your-orcid-integration/#easy-faq-2569> for more about ORCID 
OAuth Scopes.

## Computing environments without browsers

One pitfall is when you are using `rorcid` on a server, and you're ssh'ed
in, so that there's no way to open a browser to do the OAuth browser
flow. Similarly for any other situation in which a browser can not be
opened. In this case, run `orcid_auth()` on another machine in which you do
have the ability to open a browser, then collect the info that's ouptput
from `orcid_auth()` and store it as an environment variable (see above).

## Installation

Stable version


```r
install.packages("rorcid")
```

Development version


```r
remotes::install_github("ropensci/rorcid")
```


```r
library('rorcid')
```

## Docs

Get started with rorcid at <https://docs.ropensci.org/rorcid/>

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rorcid/issues)
* License: MIT
* Get citation information for `rorcid` in R doing `citation(package = 'rorcid')`
* Please note that this package is released with a [Contributor Code of Conduct](https://ropensci.org/code-of-conduct/). By contributing to this project, you agree to abide by its terms.
