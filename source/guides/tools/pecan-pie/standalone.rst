.. _pecan-pie-overview:

Standalone DNAnexus cloud pipeline usage
========================================

Preamble
---------------
This section is intended only for users who want to invoke PeCanPIE's underlying analysis pipelines independently on the `DNAnexus <https://www.dnanexus.com>`_ platform.  If you just want to use the PeCanPIE website you can safely ignore this section of the documentation.

Introduction
---------------

This document assumes familiarity with the DNAnexus platform; DNAnexus' `Quickstart guide <https://wiki.dnanexus.com/Command-Line-Client/Quickstart>`_ is a great place to start if you new to it.

Two DNAnexus cloud application pipelines were created during the development of PeCanPIE:

==============  =========================  =============
name            dnanexus app name          description
==============  =========================  =============
VEP+            app-stjude_vep_plus        a cloud installation of `VEP <https://www.ensembl.org/vep>`_ with improved logic for splice variant calls.  Converts an input VCF of variants to annotated, tab-delimited format.
Medal Ceremony  app-stjude_medal_ceremony  additional annotation and automated variant classification.  Requires a special input format which is produced by VEP+.
==============  =========================  =============

Permissions
---------------

In order to run the cloud pipelines independently your DNAnexus account needs to be granted permissions to access them.  These permissions should be granted automatically when you log into PeCanPIE the first time.  A single login is required even if you just want to use the standalone pipelines rather than the PeCanPIE portal.  `Contact us <https://stjude.cloud/contact>`_ if you encounter problems accessing the pipelines.


Access methods
--------------
There are two methods of running pipelines on DNAnexus:

1. GUI.  DNAnexus provides a standardized graphical user interface for configurating, launching, and monitoring jobs on the cloud.  Our pipelines can be run like any other DNAnexus pipeline.

2. command line.  Jobs may also be invoked via the "dx" command line client.  Command-line use allows submitting cloud jobs without interacting with a GUI, and so supports scripting and easier integration with local workflows.

The following examples demonstrate command-line usage.

Workflow
--------

All input files must be uploaded onto the DNAnexus platform.  When specifying files for input you can use either the DNAnexus fie IDs (e.g. "file-FBgvp680gz1bGQ5p8yZKz69g"), or the filenames if they are unique.

step 1: VEP+
^^^^^^^^^^^^

example dx command line for VEP+:

::

  dx run app-stjude_vep_plus -iinput_file=my_vcf.vcf -igenome_string=GRCh37-lite -igermline_reviewable_only=true

Notes:

  *  "genome_string" must be either GRCh37-lite or GRCh38.  If GRCh38 is specified, variants will be lifted over to GRCh37 in output, i.e. the output will always be GRCh37 (Medal Ceremony is still currently 37 only).
  *  The input VCF specified by "input_file" may be either uncompressed, or compressed with bgzip **only** (htslib/tabix packages).
  *  The "germline_reviewable_only" parameter is optional, but strongly recommended.  If specified, only variants in disease-gene related intervals will be annotated, which is appropriate for Medal Ceremony.  If this option is not specified all variants will be annotated, which depending on the size of your VCF might take a lot longer, and many of the resulting variants won't be usable by Medal Ceremony.  If you want to do this anyway and have a large number of variants, consider submitting your job to an instance with more CPU cores (e.g. mem1_ssd1_x16 or mem1_ssd1_x32) as the code will take advantage of additional the cores.  If you are using a custom gene list (below) that takes precedence and this parameter is not needed.
  *  The optional parameter "custom_genes_file" specifies a plain text file of HUGO gene symbols to analyze (whitespace separated, or one per line).  If specified, analysis will be restricted to these genes only.
  *  This pipeline produces two output files, "output_file" contains annotations for all variants, while "medal_prep_output_file" is the specially-filtered and formatted file required as input to Medal Ceremony below.  


step 2: Medal Ceremony
^^^^^^^^^^^^^^^^^^^^^^

example dx command line for Medal Ceremony:

::

  dx run app-stjude_medal_ceremony -iinfile=medal_prep_output_file

Notes:

  * the optional parameter "custom_genes_file" operates in the same way as in the VEP+ pipeline above.  For custom gene lists to work properly this parameter must be specified when running both the VEP+ and Medal Ceremony pipelines.
  * the optional parameter "max_population_frequency" may be specified, a fractional value representing the maximum population frequency allowed for a variant in the ExAC (ex-TCGA) database to receive a medal.  The default is 0.001, a.k.a. ".1%".
    

    
