% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auth.R
\name{orcid_auth}
\alias{orcid_auth}
\alias{rorcid-auth}
\title{ORCID authorization}
\usage{
orcid_auth(
  scope = "/authenticate",
  reauth = FALSE,
  redirect_uri = getOption("rorcid.redirect_uri"),
  client_id = NULL,
  client_secret = NULL
)
}
\arguments{
\item{scope}{(character) one or more scopes. default: \code{"/authenticate"}.
see "ORCID OAuth Scopes" section below for other scope options}

\item{reauth}{(logical) Force re-authorization? default: \code{FALSE}}

\item{redirect_uri}{(character) a redirect URI. optional. set by passing
to this parameter or using the R option \code{rorcid.redirect_uri}}

\item{client_id}{(character) a client id. optional}

\item{client_secret}{(character) a client secret. optional}
}
\value{
a character string with the access token prefixed with "Bearer "
}
\description{
ORCID authorization
}
\details{
There are three ways to authorise with \pkg{rorcid}:
\itemize{
\item Interactively login with OAuth. This doesn't require any input on
your part. We use a client id and client secret key to ping ORCID.org;
at which point you log in with your username/password; then we get back
a token (same as the above option). We don't know your username or
password, only the token that we get back. We cache that token locally
in a hidden file in whatever working directory you're in. If you delete
that file, or run the code from a new working directory, then we
re-authorize.
\item Use a \code{client_id} and \code{client_secret} to do 2-legged OAuth.
ORCID docs at https://members.orcid.org/api/oauth/2legged-oauth and
https://members.orcid.org/api/post-oauthtoken-reading-public-data
This requires you to register a "client application". See
https://orcid.org/content/register-client-application-2 for instructions
\item Use a token as a result of either of the two above approaches. The token
is a alphanumeric UUID, e.g. \verb{dc0a6b6b-b4d4-4276-bc89-78c1e9ede56e}. You
can get this token by running \code{orcid_auth()}, then storing that key
(the uuid alone, not the "Bearer " part) either as en environment
variable in your \code{.Renviron} file in your home directory (with the name
\code{ORCID_TOKEN}), or as an R option in your \code{.Rprofile} file (with the name
\code{orcid_token}). See \link{Startup} for more information.
Either an environment variable or R option work. If we don't find
either we do the next option.
}

We recommend the 3rd option if possible, specifically, storing the token
as an environment variable permanently.

If authentication fails, you can still use \pkg{rorcid}. ORCID does not require
authentication at this point, but may in the future - this prepares you
for when that happens :)
}
\note{
This function is used within \pkg{rorcid} to get/do authentication.
}
\section{ORCID OAuth Scopes}{

https://info.orcid.org/faq/what-is-an-oauth-scope-and-which-scopes-does-orcid-support/
}

\section{Computing environments without browsers}{

One pitfall is when you are using rorcid on a server, and you're ssh'ed
in, so that there's no way to open a browser to do the OAuth browser
flow. Similarly for any other situation in which a browser can not be
opened. In this case, run \code{orcid_auth()} on another machine in which you do
have the ability to open a browser, then collect the info that's ouptput
from \code{orcid_auth()} and store it as an environment variable (see above).
}

\examples{
\dontrun{
x <- orcid_auth()
orcid_auth(reauth = TRUE)
# orcid_auth(scope = "/read-public", reauth = TRUE)

# supply client_id AND client_secret to avoid 3 legged, interactive OAuth
# orcid_auth(client_id = "---", client_secret = "---")
}
}
