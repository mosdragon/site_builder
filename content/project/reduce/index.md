---
title: The REDUCE Project
summary: Real-time Ensemble Data for Understanding Suicide Epidemiology
tags:
- social computing
- natural language processing
- machine learning
- research
date: "2019-12-30T00:00:00Z"

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

One of the motivations for integrating social media data is the speed at which up-to-date social media can be obtained -- nearly instantly. In contrast, the CDC data we get will be a minimum of two years old because of all of the aggregation efforts needed by the CDC to publish this data.


## Approach
For my role in this project, I've primarily worked on extracting meaninful signals from the social media data. Most of my time has been spent on the Twitter data we have, which comprises of over 9 million tweets focused around a selected set of keyword phrases related to depression, anxiety, and suicide.

With the tweets, I have built various embeddings for each tweet. These embeddings are aggregated in various ways to produce a representation for a week's worth of tweets at a time, and that representation is then fed into various regressors. The best trained regressor will be used as one learner in our final ensemble approach, which will consist of learners for the other data sources we have, such as CDC suicide data, Google Health data, Reddit language model data, etc.


## Results
This project is ongoing, so we don't have much to report just yet. What we can say, however, is that the models built from the tweets seems to be very capable in our initial results. For one of our models, we found that the representation of tweets at a weekly granularity produced a model that performed nearly as well as the models built with just historical data (which is limited and is only available every 2 years).
