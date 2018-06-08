Pipeline Operation
==================

Logging in
----------

Start by logging into the portal with a DNAnexus account, creating an account if you need one.  PIE uses DNAnexus as a secure cloud backend; logging in is required for private storage of your data and so that we can send you e-mail notifications when your analysis jobs are complete.  PIE is free for non-commercial use; St. Jude pays the (small) cloud computing costs, your DNAnexus account will not be billed.


Uploading Data
--------------

PeCan PIE takes standard VCF files as input, which may be either uncompressed or compressed with bgzip.

1. click the "Securely upload a VCF file" button.
2. choose the genome your variants were mapped to, which may be either GRCh37-lite or GRCh38.

See the :doc:`FAQ <faq>` for more details and troubleshooting information.

advanced options
~~~~~~~~~~~~~~~~
The "Advanced option" panel lets you customize the behavior of the pipeline:

* Curated germline genes only: if checked, this filters your variants to disease-related genes only; this option will be turned on automatically if your uploaded file is 1 megabyte or larger and you are not using a custom gene list.  See the :doc:`FAQ <faq>` for more information.  This option reduces the variant processing burden on PIE by removing variants that will not be assigned a medal in any case because they are not on the reviewable gene list.

* Specify custom gene list: here you can override the disease-related gene list used by PeCanPIE with your own list.
  
* Max Population frequency: PIE by default will not call medals for variants present in the ExAC (ex-TCGA) database at an allele frequency greater than 0.001.  This option lets you override the filtering threshold to whatever frequency you prefer.  To disable filtering altogether, specify a value of 1.

.. TO DO: link to gene list
.. TO DO: improve custom gene list: APPEND rather than replace 
   

Progress page
--------------------

After uploading is complete you will be taken to a status screen showing
the progress of your job through the system.  Analysis typically
takes 10-15 minutes depending on file size and system availability.

It isn't necessary to keep your browser open on this page until your
results are ready: the system will e-mail you with a link to return
to your results.  Optional browser notifications are also available.

.. TO DO: screenshots!
  
