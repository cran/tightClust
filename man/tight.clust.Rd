\name{tight.clust}
\alias{tight.clust}

\title{Tight Clustering}
\description{
  This function could perform the tight clustering algorithm.
}
\usage{
tight.clust(x, target, k.min, alpha = 0.1, beta = 0.6, top.can = 7, seq.num = 2, resamp.num = 10, samp.p = 0.7, nstart = 1, remain.p = 0.1, k.stop = 5, standardize.gene=TRUE, random.seed=NULL)
}

\arguments{
  \item{x}{Input data, should be \code{matrix}.  Each row represents a gene (object) to be clustered. Gene (object) names are usually represented in the row names and sample (feature) names are in the column names of the matrix.}
  \item{target}{The total number of clusters that the user aims to find.}
  \item{k.min}{The starting point of k0.  See 'Details' for more information.}
  \item{alpha}{The threshold of comembership index. Default value is suggested to be used.}
  \item{beta}{The threshold of clusters stably found in consecutive k0. Default value is suggested to be used.}
  \item{top.can}{The number of top (size) candidate clusters for a specific k0. Default value is suggested to be used.}
  \item{seq.num}{The number of subsequent k0 that finds the tight cluster. Default value is suggested to be used.}
  \item{resamp.num}{Total number of resampling to obtain comembership matrix. Default value is suggested to be used.}
  \item{samp.p}{Percentage of subsamples selected. Default value is suggested to be used.}
  \item{nstart}{Number of different random inital for K-means. Default value is suggested to be used.}
  \item{remain.p}{Stop searching when the percentage of remaining points <= \code{remain.p}. Default value is suggested to be used.}
  \item{k.stop}{Stop decreasing \code{k0} when \code{k0}<=\code{k.stop}. Default value is suggested to be used.}
  \item{standardize.gene}{It specifies whether to standardize each gene vector to mean 0 and sd 1. Default value is suggested to be used.}
  \item{random.seed}{If \code{random.seed} is \code{NULL} no random seed will be set.  If \code{random.seed} is a number, it will be used as the random seed.  This parameters should be used to get the same result for different runs.}
}
\details{
  Tight clustering method is a resampling-evaluated clustering method that aims to directly identify tight clusters in a high-dimensional complex data set and allow a set of scattered objects without being clustered. The method was originally developed for gene cluster analysis in microarray data but can be applied in any complex data. The most important parameter is \code{k.min}. A large \code{k.min} results in smaller and tighter clusters. Normally \code{k.min}>=\code{target}+5 is suggested. All other parameters do not affect the quality of final clustering results too much and are suggested to remain unchanged. 
}
\value{
  Returned value is a "tight.clust" object (list). The first element is the original data matrix. The second element is a vector representing the cluster identity (-1: scattered gene set; 1: the first cluster; 2: the second cluster; ...). The third element is a vector of the size of each tight cluster.
}
\references{George C. Tseng and Wing H. Wong. (2005) Tight Clustering: A Resampling-based Approach for Identifying Stable and Tight Patterns in Data.  Biometrics.61:10-16.}
\author{Chi Song <chs108@pitt.edu>}

\examples{
## load the test dataset
data(tclust.test.data)
## find 10 tight clusters
ptm<-proc.time()
## k.min=25, tighter clusters will be found
## target=1 is used to save time, target=10 is recommended
tclust1<-tight.clust(tclust.test.data$Data, target=1, k.min=25, random.seed=12345)
proc.time()-ptm
## plot the heat map of cluster result
plot(tclust1)
## write the cluster result
write.tight.clust(tclust1)
ptm<-proc.time()
## k.min=10, looser clusters will be found
## target=1 is used to save time, target=5 is recommended
tclust2<-tight.clust(tclust.test.data$Data, target=1, k.min=10, random.seed=12345)
proc.time()-ptm
## plot the heat map of cluster result
plot(tclust2)
## write the cluster result
write.tight.clust(tclust2)
}

\keyword{ cluster	}

