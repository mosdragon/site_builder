---
title: The REDUCE Project
summary: Real-time Ensemble Data for Understanding Suicide Epidemiology
tags:
- social computing
- natural language processing
- machine learning
- research
date: "2020-01-10T00:00:00Z"

# Optional external URL for project (replaces project detail page).
external_link: ""

image:
  caption: Betweeness Centrality on Streaming Graphs
  focal_point: Smart

links:
url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---


## Background
The [REDUCE](https://socweb.cc.gatech.edu/projects/) project seeks to improve real-time estimation of suicide rates to better enable suicide prevention activities. We've partnered with the CDC to use historical trends with social media data to forecast future trends week-to-week.

One of the motivations for integrating social media data is the speed at which up-to-date social media can be obtained -- instantly. In contrast, the ground-truth suicide trend data takes nearly two years for the CDC to aggregate and publish, which presents problems for real-time estimation of suicide trends.

For my role in this project, I've primarily worked on extracting meaninful signals from social media data we've collected. Most of my time has been spent on the Twitter dataset, which comprises of over 9 million tweets focused around a selected set of keyword phrases related to depression, anxiety, and suicide collected for a 3 year timespan.

I worked on creating embeddings of these tweets that would then be aggregated on a weekly basis. These aggregations would then represent the mass of tweets for that week and could then be used as the features `X` with the target variable `y` being the true number of suicide attempts that week (provided by the CDC). With the right embedding, we could train regression models to predict this `y` fairly accurately. This regression model would then serve as one learner in a final ensemble approach which uses models built separately on data from other sources such as CDC suicide data, Google Health data, Reddit language model data, etc.

## Approaches

### Lexicographical Inquiry and Word Count + Bag of Words
For each tweet, we wanted to create a high dimensional tensor that would represent the contents of this tweet entirely. We decided to use both a Bag-of-Words embedding along with the LIWC scores as the embedding for each tweet.

With the Bag of Words model, we tried several "flavors" to see what would work best to create our vocabulary and embeddings:

- `vanilla` - Using the top 10k words in the corpus
- `deslang` - Using the top 10k words in the corpus after internet slang words were expanded.
  - Ex: In our tweets, the phrase `iykyk` would be expanded into the five words `if you know you know`
- `stopwords` - Removal of the top english stopwords before keeping the top 10 words
- `deslang_stopwords` - A combination of the approaches for `deslang` and `stopwords`


### Document Embeddings
This is a new direction we are currently exploring. One crucial limitation of the Bag of Words approach is that the model doesn't take into consideration any sentence structure. This could be problematic especially with our task since certain ways of phrasing a set of words could be perceived as either cause for alarm or simply sarcasm.

To see if this limitation has any effect on the final models used to help predict suicide trends, we are looking into embeddings that are designed to capture document-level patterns. These embeddings can capture much more complex semantic relationships which could be invaluable in our task. Some of the models we're looking at right now include *doc2vec* and *SBERT*.


## Results
This project is ongoing, so we don't have concrete numbers to publish here at this time. However, we have found that the regression models built off of some of the Bag-of-Words embeddings, particularly the `stopwords` and `deslang_stopwords` flavors, have shown promising results already, comparable to those we're seeing from ground-truth suicide trend data.
