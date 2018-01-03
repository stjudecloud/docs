.. _pecan-pie-index:

PeCan PIE
=========

|HG19|

* **Authors**: Michael Edmonson, Aman Patel
* **Publication**: `Zhang et al., NEJM 2015 <http://www.nejm.org/doi/full/10.1056/NEJMoa1508054#t=article>`_, supplementary appendix pp. 7-10
* **Technical Support**: `Contact Us <https://stjude.cloud/contact>`_
  
Introduction
------------

PeCan PIE (the **Pe**\ diatric **Can**\ cer Variant **P**\ athogenicity **I**\ nformation **E**\ xchange) is a cloud-based variant classification and interpretation service.  It annotates and ranks variants by putative pathogenicity, then displays them in an interactive web interface for formal review and classification following ACMG guidelines. The portal also contains a repository of expert-reviewed germline mutations that may predispose individuals to cancer.  It is free for non-commercial use.

Pecan PIE utilizes St. Jude Medal Ceremony, the same pipeline that powers our clinical and research genomics projects.  Medal Ceremony provides a 3-level ranking of putative pathogenity - Gold, Silver or Bronze - for mutations within cancer-related genes. Medal assignment is based on matches to 22 mutation databases, mutation type, population frequency, tumor suppressor status and predicted functional impact. The evidence used for medal assignment is imported into an interactive variant review page where an analyst can enter additional curated information such as primary diagnosis, presence of subsequent neoplasm, family history and related literature. Classification tags can be manually assigned to curated data enabling automated calculation of pathogenicity rating based on ACMG/AMP 2015 guidelines.

See :download:`PowerPoint slides <resources/pecanpie_ASHG_2017.pptx>` presented at the ASHG 2017 annual meeting.

Go to https://pecan.stjude.org/pie to get started!


Contents
--------

.. toctree::
   :maxdepth: 2 

   overview
   operation
   results
   faq

.. include:: ../../../partials/genome-shields.rst