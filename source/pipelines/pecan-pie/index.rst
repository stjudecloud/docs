.. _pecan-pie:

PeCan PIE
=========

* **Authors**: Aman Patel, Michael Edmonson
* **Technical Support**: `Aman Patel <mailto:aman.patel@stjude.org>`_ (PIE portal), `Michael Edmonson <mailto:michael.edmonson@stjude.org>`_ (Medal Ceremony)
* **Publication**: `Zhang et al., NEJM 2015 <http://www.nejm.org/doi/full/10.1056/NEJMoa1508054#t=article>`_ (supplementary appendix pp. 7-10)
* **Input**: VCF file of SNVs and indels
* **Output**: gold, silver, and bronze classifications of potential clinical signficance
* **Supported Genome Builds**: GRCh37 (hg19)

.. TO DO: ASHG 2017 slides, internal links

  
Introduction
------------

The growing popularity of genome-wide germline genetic testing highlights a need for improved variant annotation, triage and pathogenicity classification. We developed "PeCan-PIE" (the **Pe**\ diatric **Can**\ cer Variant **P**\ athogenicity **I**\ nformation **E**\ xchange) – a web portal facilitating:


1. automated annotation, classification and triage with our "Medal Ceremony" pipeline
2. an interactive variant page for curation and committee review
3. a repository of expert-reviewed germline mutations that may predispose individuals to cancer


Medal Ceremony provides a 3-level ranking - Gold, Silver or Bronze - of putative pathogenicity for mutations within cancer-related genes. Medal assignment is based on matches to 22 mutation databases, mutation type, population frequency, tumor suppressor status and predicted functional impact. The evidence used for medal assignment is imported into an interactive variant review page where an analyst can enter additional curated information such as primary diagnosis, presence of subsequent neoplasm, family history and literature. ACMG/AMP classification tags can be manually assigned to curated data enabling automated calculation of pathogenicity rating based on ACMG/AMP 2015 guidelines.

Contents
--------

.. toctree::
   :maxdepth: 2 

   overview
   operation
   results
   faq
