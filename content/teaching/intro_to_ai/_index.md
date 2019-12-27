---
# Course title, summary, and position.
linktitle: Introduction to Artificial Intelligence
summary: I served as the Head Teaching Assistant for CS3600 at Georgia Tech in Fall 2019. I was also a TA for the course in Fall 2016 and Spring 2019.
weight: 1

# Page metadata.
title: Introduction to Artificial Intelligence
date: "2019-12-27T00:00:00Z"
lastmod: "2019-12-27T00:00:00Z"
draft: false
toc: true  # Show table of contents? true/false
type: docs  # Do not modify.

# Add menu entry to sidebar.
# - name: Declare this menu item as a parent with ID `name`.
# - weight: Position of link in menu.
menu:
  intro_to_ai:
    name: Introduction to Artificial Intelligence
    weight: 1
---

## Background
I first took _CS3600: Introduction to Artificial Intelligence_ in Fall 2015. In
Fall 2016, I decided I wanted to TA for the course, and that was my first term
as a TA. Being a new TA, I was still getting the hang of the material, being
able to explain content in my own words, and help student debug all sorts of
issues.

In Spring 2019, during my Master's program, I decided to TA for the course
again. This time, I had graduate-level experience in some of these topics such
as Machine Learning, so I went in with much more confidence ready to help
students grasp the material.

Finally, in Fall 2019, I was chosen to be the Head TA for the course, which now
had two sections with a total of 450+ students and 18 TAs. 

## Mass Autograder System
During my term as a Head TA, one of the biggest challenges I faced was the issue
of grading projects. With the number of students we had and the pace of the
course, we simply couldn't expect that all TAs would be able to grade a large
block of students manually with only a few days notice, nor could we expect
students to wait 3+ weeks to get feedback on their submissions.

Although the projects we used for the course already came
with test cases for students to validate their implementations, as TAs we still
had to run our own tests to ensure that students didn't trivialize the
assignment by using functions or libraries we explicitly forbid. Additionally,
we also wanted to run plagiarism detectors to ensure students didn't use code
they found off of the internet.

The previous solution we had for doing this in bits in pieces had a number of
major issues:

- __Brittle__: it was unable to handle submissions that weren't in the _exact_
  submission file hierarchy the assignment requested, even if all of the
  necessary source files were submitted.
- __Unreliable__: Sometimes the library would just not be able to handle
  common compression formats like _gzip_s, and these faulty submissions would
  have to be identified and regraded manually.
- __Lacking key features__: Graded submissions would be output in raw text files, meaning
  a TA would have to manually go in an enter those grades in the gradebook, all
  450+ of them.

I decided it would be worth the time to create a new solution that would remedy
all of these issues and would be easy enough for future Head TAs to run without
any issues. Here are some of the key highlights of the implementation I completed the
first three weeks into the semester:

- Automatic exporting of grades to the full gradebook
- Support for submissions with variations on the file hierarchies
- Easy extensible for future projects to be added to the course
- Improved plagiarism detection
- Extensive logging to ensure TAs can catch issues early on


## Project Review Sessions
Although this course doesn't have formal recitations, the TAs for this course
have typically taken it upon themselves to lead several review sessions
throughout the semester for students to hear the material delivered at a slower
pace by their peers as well as ask any questions they may have on course
concepts. These sessions were mainly geared towards preparing students for the
upcoming projects since they were such a large portion of the students' grades.

In previous semesters, the TAs had typically explained concepts verbally, with a
bit of psuedocode given for common algorithms such as Djikstra's Algorithm or the
Bellman Update Equation, however I had always felt as though students were able
to implement these in the projects and get by in the course without having a
firm understanding of why they worked. Many students struggled heavily on the
exams in those same concepts that they glossed over since they could implement
the projects without that understanding.

To remedy this, I decided to create extensive review guides for the review
sessions that could be used long after I had left Georgia Tech. With a handful
of other TAs, we managed to produce well over 30 pages total of explanations of
core concepts for the course.

Here are the review guides we created:

- [Graph Search Algorithms](project1.pdf)
- [Reinforcement Learning](project2.pdf)
- [Probabilitic Inference](project3.pdf)
- [Neural Networks](project4b.pdf)
- [Decision Trees](project4a.pdf)

In addition, these TAs and I led the hour-long review sessions for the projects
where we presented this material to our students. Sessions typically had 30-40
students, and we addressed questions with illustrations, equations, or any other
means of getting the students to understand the material.

## Reflections
It was a true honor and privilege to be the Head TA for this course. Not only
did having so many students push me to refine my own understanding of even the
subtle edge cases, but it also gave me the opportunity to bring what I have
always felt were some very necessary changes to the course. I'm hopeful that the
students were able to reap all of the benefits of these changes and that it
truly inspires them to pursue research and careers in Artificial Intelligence.
