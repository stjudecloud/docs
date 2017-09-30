.. _rapid-rnaseq:

Rapid RNA-Seq
=========================

* **Authors**: Scott Newman, Clay McLeod, Yongjin Li
* **Technical Support**: `Scott Newman <mailto:scott.newman@stjude.org>`_, `Clay McLeod <mailto:clay.mcleod@stjude.org>`_
* **Publication**: N/A (not published)
* **Input**: Paired RNA-Seq FASTQs, aligned RNA-Seq BAM
* **Output**: Predicted gene fusions, coverage bigWig, splice junction read counts, interactive fusion gene visualization
* **Supported Genome Builds**: HG19 (GRCh37)

.. raw:: html

   <h2>Introduction</h2>

Fusion genes are important for cancer diagnosis, subtype definition and targeted
therapy. RNASeq is useful for detecting fusion transcripts. Computational
methods face challenges to identify fusion transcripts arising from internal
tandem duplication (ITD), multiple genes, low expression or non-templated
insertions. Here we present an end-to-end clinically validated pipeline "Rapid
RNA-Seq" that detects gene fusions and ITDs from human transcriptome data.

.. raw:: html

   <h2>Contents</h2>

.. toctree::
   :maxdepth: 2 

   overview
   operation
   monitoring
   navigate
   results
   known-issues
   faq
