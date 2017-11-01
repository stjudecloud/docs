Frequently Asked Questions
==========================

If you have any questions not covered here, feel free to reach out on
`our contact form <https://hospital.stjude.org/apps/forms/fb/st-jude-cloud-contact/>`_.


Q: Which files are supported? 
++++++++++++++++++++++++++++++++++++++++++++++++++
  
  PIE supports VCF files that are under 20MB in size. Uploaded VCFs must be compliant with the `VCF specification <https://samtools.github.io/hts-specs/>`_.  Common formatting problems include the lack of a header line and variants not being sorted by chromosome and position.  To verify compatibility of your VCF you can try one of these methods:

  1. Compressing and indexing your VCF with `tabix <http://www.htslib.org/doc/tabix.html>`_ from the `HTSlib <http://www.htslib.org/>`_ package (some systems may refer to the earlier, pre-HTSlib "tabix" package).  This process will only work for compliant VCF files.

  2. Using the "vcf-validator" program from the `vcftools <https://vcftools.github.io/>`_ package

  Uncompressed VCFs are safest to upload.  tabix-compressed file support is pending, which will support bgzip-compressed files.  Files compressed with ordinary gzip or any other compressor will not be compatible.

Q. Why is the classification column blank in my results?
++++++++++++++++++++++++++++++++++++++++++++++++++

   This column displays the classification assigned by the St. Jude Germline Committee reviewers. If a variant was not classified by this committee before, this field will be blank.
 
Q. What do the medals mean?
++++++++++++++++++++++++++++++++++++++++++++++++++

  The medal column is a rough indicator of the likelihood of the variant being clinically significant as predicted by the medal ceremony software.  Variants with gold medals are most likely to be significant, and those with no medal are least likely.  More details can be found in the "analysis of results" section.

Q. Why are my variants missing?
++++++++++++++++++++++++++++++++++++++++++++++++++
 Currently the only variants that make it to the medaling process are coding and splice-related variants. Putting it another way, intergenic, intronic, UTR variants are excluded, as are those in non-coding transcripts.

Q. Is it Free?
++++++++++++++++++++++++++++++++++++++++++++++++++
 Pecan PIE is free to use for VCF files under 20MB. St. Jude covers the cost of running the pipeline and hosting. DNANexus accounts are required to keep track of your jobs in the cloud so that you can retrieve and manage from multiple locations. Accounts also make it possible to alert you of job completion via email.