.. _chipseq-index:

ChIP-Seq Peak Calling
=========================

|HG19| |HG38| |MM9| |MM10| |DM3|

* **Authors**: Xing Tang, Yong Cheng
* **Publication**: N/A (not published)
* **Technical Support**: `Contact Us <https://stjude.cloud/contact>`_

.. raw:: html

   <h2>Introduction</h2>

The ChIP-Seq Peak Caller pipeline is designed for ChIP-Seq peak calling
data analysis. The pipeline accepts one FastQ file from an IP experiment
and one FastQ file from a control experiment. First, the reads of the FastQ
file(s) are aligned to the specified reference genome. The aligned reads are then
post-processed based on best-practice QC techniques (removing multiple mapped reads,
removing duplicated reads, etc). Last, peaks are called by SICER (broad 
peak analysis) or MACS2 (narrow peak analysis). Qualified peaks will be output 
BED (.bed) and big BED (.bb) files. The coverage information is also included also
a bigWig (.bw) file with an accompanying visualization by ProteinPaint. A
cross correlation plot and general metrics file are generated to help check the
quality of experiment.

.. raw:: html

   <h2>Contents</h2>

.. toctree::
   :maxdepth: 2 

   overview
   operation
   monitoring
   navigate
   results
   faq

.. include:: ../../../partials/genome-shields.rst