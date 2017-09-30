HLA Typing and Neoepitope Prediction
=========================

* **Authors**: Ti-Cheng Chang
* **Technical Support**: `Ti-Cheng Chang <mailto:ti-cheng.chang@stjude.org>`_
* **Publication**: "The Neoepitope Landscape in Pediatric Cancers" (in revision)
* **Input**: Single-end/paired-end WGS FASTQ files or an aligned WGS BAM file
* **Output**: HLA alleles of the sample, predicted epitope affinities of peptides
* **Supported Genome Builds**: HG19 (GRCh37)

.. raw:: html

   <h2>Introduction</h2>

Cancers are caused by somatically acquired alterations including
single nucleotide variations (SNVs), small insertion/deletions (indels),
translocations, and other types of rearrangements. The genes affected by these
mutations may produce altered proteins, some of which may lead to the emergence
of tumor-specific immunogenic epitopes. We developed an analytical workflow for
identification of putative neoepitopes based on somatic missense mutations and
gene fusions using whole genome sequencing data. The workflow has been used to
characterize neoepitope landscape of 23 subtypes of pediatric cancer in the
Pediatric Cancer Genome Project (PCGP)[1].


.. raw:: html

   <h2>Content</h2>

.. toctree::
   :maxdepth: 2 

   overview
   operation
   monitoring
   navigate
   results
   faq

**References**

1. Chang T-C, Carter R, Li YJ, Li YX, Wang H, Edmonson M, Chen X, Arnold P, Geiger T, Wu G, Peng JM, Dyer M, Downing J, Green D, Thomas P, Zhang JH: The Neoepitope Landscape in Pediatric Cancers. Genome Medicine. 2017. 9.1: 78.
