% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preprocessing.R
\name{skipgrams}
\alias{skipgrams}
\title{Generates skipgram word pairs.}
\usage{
skipgrams(sequence, vocabulary_size, window_size = 4, negative_samples = 1,
  shuffle = TRUE, categorical = FALSE, sampling_table = NULL)
}
\arguments{
\item{sequence}{a word sequence (sentence), encoded as a list of word indices
(integers). If using a \code{sampling_table}, word indices are expected to match
the rank of the words in a reference dataset (e.g. 10 would encode the
10-th most frequently occuring token). Note that index 0 is expected to be
a non-word and will be skipped.}

\item{vocabulary_size}{int. maximum possible word index + 1}

\item{window_size}{int. actually half-window. The window of a word wi will be
\code{[i-window_size, i+window_size+1]}}

\item{negative_samples}{float >= 0. 0 for no negative (=random) samples. 1
for same number as positive samples. etc.}

\item{shuffle}{whether to shuffle the word couples before returning them.}

\item{categorical}{bool. if FALSE, labels will be integers (eg. \code{[0, 1, 1 .. ]}),
if TRUE labels will be categorical eg. \code{[[1,0],[0,1],[0,1] .. ]}

[[1,0]: R:[1,0
[0,1]: R:0,1
[0,1]: R:0,1}

\item{sampling_table}{1D array of size \code{vocabulary_size} where the entry i
encodes the probabibily to sample a word of rank i.}
}
\value{
List of \code{couples}, \code{labels} where:
\itemize{
\item \code{couples} is a list of 2-element integer vectors: \code{[word_index, other_word_index]}.
\item \code{labels} is an integer vector of 0 and 1, where 1 indicates that \code{other_word_index}
was found in the same window as \code{word_index}, and 0 indicates that \code{other_word_index}
was random.
\item if \code{categorical} is set to \code{TRUE}, the labels are categorical, ie. 1 becomes \code{[0,1]},
and 0 becomes \code{[1, 0]}.
}
}
\description{
Takes a sequence (list of indexes of words), returns list of \code{couples} (word_index,
other_word index) and \code{labels} (1s or 0s), where label = 1 if 'other_word'
belongs to the context of 'word', and label=0 if 'other_word' is randomly
sampled
}
\seealso{
Other text preprocessing: \code{\link{make_sampling_table}},
  \code{\link{pad_sequences}},
  \code{\link{text_hashing_trick}},
  \code{\link{text_one_hot}},
  \code{\link{text_to_word_sequence}}
}
