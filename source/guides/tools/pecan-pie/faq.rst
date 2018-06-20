Frequently Asked Questions (FAQ)
================================

If you have any questions not covered here, feel free to reach out on
`our contact form <https://hospital.stjude.org/apps/forms/fb/st-jude-cloud-contact/>`_.


Q: Which files are supported? 
++++++++++++++++++++++++++++++++++++++++++++++++++
  
  PIE works with variants in VCF format:

  - uploaded files must be compliant with the `VCF specification <https://samtools.github.io/hts-specs/>`_.
  - VCF files may be either uncompressed, or compressed with bgzip **only**.  bgzip is part of the htslib/tabix packages (see below).

  Improperly formatted VCF files will not work with PIE.  Some common problems include:

  - missing header line
  - missing required columns
  - files compressed by any method other than bgzip (gzip, zip, or any other program)
    
  To verify compatibility of your VCF you can try one of these methods:

  1. Compressing your VCF with `bgzip <http://www.htslib.org/doc/bgzip.html>`_ and indexing it with `tabix <http://www.htslib.org/doc/tabix.html>`_, both programs from the `HTSlib <http://www.htslib.org/>`_ package (some systems also use the earlier, pre-HTSlib "tabix" package).  This process will only succeed for compliant VCF files, and can help diagnose failures.

  2. Running "vcf-validator" program from the `vcftools <https://vcftools.github.io/>`_ package.

  While the VCF specification also requires that variants be sorted by chromosome name and position, PIE is now often able to automatically correct sorting issues in uploaded files.  PIE requires sorted data in order to query data for targeted genes.


Q: Are there limits on the size of VCF files?
++++++++++++++++++++++++++++++++++++++++++++++++++

  Uploaded files must not exceed 4 gigabytes.  If an uploaded file is larger than 1 megabyte, reviewable-gene filtering will be automatically enabled unless you are using a custom gene list.  This reduces the processing burden on the system by removing variants outside of targeted genes.
  

Q: Is there an example/demo VCF I can try with PIE?
++++++++++++++++++++++++++++++++++++++++++++++++++++

  You can use `this VCF <ftp://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/release/NA12878_HG001/NISTv3.3.2/GRCh37/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz>`_ from the Genome in a Bottle project.  This ~133 megabyte bgzip-compressed VCF was used during testing of PeCanPIE and is known to work.  These variants are mapped to GRCh37.

Q. What genome versions are supported?
++++++++++++++++++++++++++++++++++++++++++++++++++

  PIE will accept variants mapped to either GRCh37-lite/hg19 or GRCh38.  GRCh38 variants are automatically lifted over to 37, as the system uses 37 internally; the liftover process is able to compensate for strand and reference/variant allele swaps which can occur.  A native hg38 version is in development, but is not yet available.

  PIE only works for human data.

Q. What genes are on the curated gene list?
++++++++++++++++++++++++++++++++++++++++++++++++++

  The list consists of disease-related genes, both cancer and non-cancer, see the :download:`Excel spreadsheet <resources/table_S1_gene_list_5_categories_v2.xlsx>` for details.  Filtering the source variants to a target list of genes reduces the processing burden on the system.

  When browsing the results the view may be filtered to disease sub-categories of interest.

  You can also specify your own custom list of genes to process when submitting your VCF file (see the advanced options panel).


Q. Why is the classification column blank in my results?
++++++++++++++++++++++++++++++++++++++++++++++++++

  This column displays the classification assigned by the St. Jude Germline Committee reviewers. If a variant was not classified by this committee before, this field will be blank.

  PeCan PIE provides classifications from the Medal Ceremony pipeline, which may assign variants gold, silver, or bronze medals.  An "Unknown" medal may be assigned for non-disease-predisposition genes, variants present in the ExAC (ex-TCGA) database at an allele frequency > 0.1%, or variants without functional annotations (which includes most silent variants).
  
 
Q. What do the medals mean?
++++++++++++++++++++++++++++++++++++++++++++++++++

  The medal column is a rough indicator of the likelihood of the variant being clinically significant as predicted by the medal ceremony software.  Variants with gold medals are most likely to be significant, and those with no medal are least likely.  More details can be found in the :doc:`Analysis of Results <results>` section.

Q. Why are some of my variants missing?
++++++++++++++++++++++++++++++++++++++++++++++++++

  Currently only coding and splice-related variants in disease-related genes make it to the medaling process.  Intergenic, intronic, and UTR variants are excluded, as are those in non-coding transcripts.

Q. Why does the ExAC allele frequency shown differ from the ExAC portal?
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  The reported ExAC frequency may differ for several reasons:

  1. PIE uses the TCGA-subtracted distribution of ExAC rather than the main distribution.
  2. PIE reports the primary allele frequencies in the ExAC database, specifically the AC, AN, and AF fields from the VCF distribution.  The `ExAC portal <http://exac.broadinstitute.org/>`_ appears to use the "adjusted" frequencies which may be different.
     
.. Q: why do we use the TCGA-subtracted ExAC?
.. TO DO?  indel equivalence is another reason

Q. Is PeCan PIE free?
++++++++++++++++++++++++++++++++++++++++++++++++++
  Pecan PIE is free for non-commercial use. St. Jude covers the cost of running the pipeline and hosting. DNANexus accounts are required to keep track of your jobs in the cloud so that you can retrieve and manage from multiple locations. Accounts also make it possible to alert you of job completion via email.
 
.. TO DO: lift size restrictions?
   
   
