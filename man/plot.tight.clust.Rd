\name{plot.tight.clust}
\alias{plot.tight.clust}

\title{Plot tight cluster result}
\description{
  A function to plot the heatmap of the tight cluster result.
}
\usage{
\method{plot}{tight.clust}(x, standardize.gene = TRUE, order.sample = FALSE, plot.noise=TRUE, ...)
}

\arguments{
  \item{x}{Return value of the \code{tight.clust} function}
  \item{standardize.gene}{If standardize each gene vector to mean 0 and sd 1.}
  \item{order.sample}{It specifies whether to order samples (features) using the hierachical clustering method.}
  \item{plot.noise}{It specifies whether to plot the remaining noise genes (objects).}
  \item{\dots}{Arguments to \code{image}.}
}

\references{George C. Tseng and Wing H. Wong. (2005) Tight Clustering: A Resampling-based Approach for Identifying Stable and Tight Patterns in Data.  Biometrics.61:10-16.}
\author{Chi Song <chs108@pitt.edu>}

\keyword{ cluster	}