Frequently Asked Questions
==========================

If you have any questions not covered here, feel free to reach out on
`our contact form <https://hospital.stjude.org/apps/forms/fb/st-jude-cloud-contact/>`_.


Q: Which files are supported? 
++++++++++++++++++++++++++++++++++++++++++++++++++
  
  PIE supports VCF files that are under 20MB in size. Uploaded VCFs must be compliant with the `VCF specification <https://samtools.github.io/hts-specs/>`_.  Common formatting problems include the lack of a header line and sorting issues.  To verify compatibility of your VCF you can try one of these methods:

  1. Compressing and indexing your VCF with `tabix <http://www.htslib.org/doc/tabix.html>`_ from the `HTSlib <http://www.htslib.org/>`_ package (some systems may refer to the earlier, pre-HTSlib "tabix" package).  This process will only work for compliant VCF files.

  2. Using the "vcf-validator" program from the `vcftools <https://vcftools.github.io/>`_ package

  Uncompressed VCFs are safest to upload.  tabix-compressed file support is pending, which will support bgzip-compressed files.  Files compressed with ordinary gzip or any other compressor will not be compatible.

  .. TO DO: status of bgzip-compressed files?

Q. Why is the classification column blank in my results?
++++++++++++++++++++++++++++++++++++++++++++++++++

  This column displays the classification assigned by the St. Jude Germline Committee reviewers. If a variant was not classified by this committee before, this field will be blank.

  PeCan PIE provides classifications from the Medal Ceremony pipeline, which may assign variants gold, silver, or bronze medals.  An "Unknown" medal may be assigned for non-disease-predisposition genes or variants with NHLBI allele frequency > 0.1%.
  
 
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
  2. PIE reports the primary allele frequencies in the ExAC database, specifically the AC, AN, and AF fields from the VCF distribution.  The ExAC portal appears to use the "adjusted" frequencies which may be different.
     
.. Q: why do we use the TCGA-subtracted ExAC?
.. TO DO?  indel equivalence is another reason

Q. Is it free?
++++++++++++++++++++++++++++++++++++++++++++++++++
  Pecan PIE is free for non-commercial use; VCF files must be under 4GB. St. Jude covers the cost of running the pipeline and hosting. DNANexus accounts are required to keep track of your jobs in the cloud so that you can retrieve and manage from multiple locations. Accounts also make it possible to alert you of job completion via email.
 
.. TO DO: lift size restrictions?
   
   
