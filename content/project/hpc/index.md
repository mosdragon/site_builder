---
title: Betweenness Centrality for Streaming Graphs
summary: Computing Betweenness Centrality on Streaming Graphs
tags:
- hpc
- research
date: "2019-09-01T00:00:00Z"

# Optional external URL for project (replaces project detail page).
external_link: ""

image:
  caption: Betweeness Centrality on Streaming Graphs
  focal_point: Smart

links:
url_code: "https://github.com/cuStinger/cuStinger"
url_pdf: "/files/bc_paper.pdf"
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

## Background:
[Graph Theory](https://en.wikipedia.org/wiki/Graph_theory) was among my favorite topics during my undergraduate studies, and in Fall 2016, I managed to find research that would build on my interests in that area as well as leverage the Systems background I had (from one of concentration areas: _Devices_).

I joined [Dr. Oded Green](https://www.cc.gatech.edu/~ogreen/) that term, and we began work immediately on [Streaming Graphs](https://en.wikipedia.org/wiki/Dynamic_connectivity) (also known as Dynamic Graphs). These are graphs where the Nodes $V$ and Edges $E$ change over time.


## Problem: Betweenness Centrality on Streaming Graphs
[Betweenness Centrality](https://en.wikipedia.org/wiki/Betweenness_centrality)(BC) is a measure of a node's centrality in a graph based on it's presence in shortest paths.

Think of it as the _hub_ that connects many different transportation lines. The more dependent other transportation lines are on a given _hub_, the more central that _hub_ is to the network.

On a static graph, we can compute the BC values for each node pretty easily (in terms of time complexity). However, real-world graphs like Facebook's Social Network Graph contain hundreds of millions of nodes and billions of edges. If we wanted up-to-date BC values for graphs of this scale, re-computing BC each time a node/edge is _inserted_ or _delete_ becomes infeasible.

So that's our task: Given a graph and then a sequence of insertions/deletions, can we accurately compute the BC values without recomputing on the entire graph?

## Approach:
We created a framework called [cuStinger](https://github.com/cuStinger/cuStinger) (a _portmanteau_ of _Cuda_ and _Stinger_), which served as the backbone of our adventure in getting Streaming BC going.

Using this framework (which saved us largely from writing repetitive Cuda code), we implemented the algorithm as described [here](https://scholar.google.com/citations?user=C_7l2roAAAAJ&hl=en#d=gs_md_cita-d&p=&u=%2Fcitations%3Fview_op%3Dview_citation%26hl%3Den%26user%3DC_7l2roAAAAJ%26citation_for_view%3DC_7l2roAAAAJ%3A9yKSN-GCB0IC%26tzom%3D300).


## Challenges:
Since we were using Nvidia GPUs and Cuda under the hood, we had various challenges with race conditions, mutex locks, and validating results.


## Results:
By the end of that year, we managed to have a running version that handled _most_ edge cases of streaming graphs. There were some we hadn't implemented yet when I left the lab.

A few weeks later, the lab moved onto a new framework (developed in-house with Oded and his lab), [Hornet](https://github.com/hornet-gt/hornet).

## Lessons Learned

- Parallel Computation comes with some challenges, be ready
- Advances in GPU programming are opening doors to many new areas ripe for exploration
- ALWAYS write tests to validate results (we compared our Streaming BC results to our Static BC at each insertion/deletion)

## Tools Used
- C/C++
- Cuda
- cuStinger framework

