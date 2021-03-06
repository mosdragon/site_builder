---
title: Cross-Domain Context Prediction
summary: Cross Domain Context Prediction for Sketch-Based Image Retrieval
tags:
- machine learning
- self-supervised learning
- unsupervised learning
- computer vision
- research
date: "2019-11-30T12:00:00Z"

# Optional external URL for project (replaces project detail page).
external_link: ""

image:
  caption: "Cross-domain context prediction for sketch-based image retrieval"
  focal_point: "Smart"


# url_pdf: "/files/crossdom.pdf"

links:
# url_pdf: "/files/crossdom.pdf"
url_slides: "/files/crossdom.pdf"
url_video: "https://youtu.be/jxWmfB7XU1c"

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
# slides: "/files/crossdom.pdf"
---

## Problem Statement
- Given a hand-drawn sketch, retrieve the image instance that this sketch was drawn for
![](probstatement.png)

## Related Work
- [Unsupervised Visual Representation Learning by Context Prediction](https://arxiv.org/abs/1505.05192)
- [The Sketchy Database: Learning to Retrieve Badly Drawn Bunnies](http://sketchy.eye.gatech.edu/paper.pdf)
- [Cross-modal Subspace Learning for fine-grained sketch-based image retrieval](https://www.sciencedirect.com/science/article/abs/pii/S0925231217314364#!)

## Approach

### Assumptions
- Aligned, paired images available. For this, we compute canny edges of the images in the PASCAL VOC dataset.
- Clustering image and sketch embeddings from a well-trained network will result in well-formed discrete clusters that are domain agnostic.
- The model that performs well on cross domain context prediction will perform well on the cross-domain image retrieval task.

### Pre-text Task
- We divide the image into 4 regions, with uneven spacing and jitter
- We then extract two patches, one from each domain, i.e. images from Pascal, and their Canny edges
- We finally compute the relative positioning of the patches using the context encoder

![Spatial relation between patches](spatial.png)
![AlexNet-inspired classification architecture](classification.png)


### Image Retrieval
- We first compute embeddings for the query sketch using AlexNet trained on the pretext
- We then perform a nearest neighbour search on the embeddings from the dataset of images
- We retrieve the nearest 5 and 10 images for top-5 and top-10 similarity scores

![Computing embeddings and finding nearest neighbors](neighbors.png)


## Results

### Visual Results
![Good Results](visual1.png)

- Here is one of our "bad" results -- we can see that the correct instance image is present in the retrieved images
- We can also see that the other bird result also captures similar pose as the sketch

![Bad Results](visual2.png)

- Here is one of our "bad" results -- we see that the correct instance wasn't retrieved
- Additionally, the correct class wasn't retrieved either
- Note how despite the incorrect class/instance retrieval, we do see similarities in the pose and shape between the sketches and the retrieved images


### Comparison to Baselines
![Results table. Our methodology beats out feature pyramids without any supervision.](results_table.png)

- Although our approach didn't beat out our main baseline, the Sketchy database approach, we were able to beat out the feature pyramid approach with no supervision


## Future Work
- Study the effects of further training on pretext task
- Use context-encoder as pretraining for supervised image retreival models
- Use more sophisticated feature extractors (like GoogLeNet or VGG) that more recent Sketch-Based Image Retrieval methods use
