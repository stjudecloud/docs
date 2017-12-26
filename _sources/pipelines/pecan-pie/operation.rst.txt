Pipeline Operation
==================

.. caution::
   This pipeline assumes GRCh37/HG19 coordinates.

   
Logging in
----------

Start by logging into the portal with a dnanexus account, creating an account if you need one.  PIE uses dnanexus as a secure cloud backend; logging in is required for private storage of your data and so that we can send you e-mail notifications when your analysis jobs are complete.  PIE is free for non-commercial use; St. Jude pays the (small) cloud computing costs, your dnanexus account will not be billed.


Uploading Data
--------------

PeCan PIE takes standard VCF files as input.  The files must comply
with the VCF specification, see the :doc:`FAQ <faq>` for information about how
to verify your files are compatible.

Click on the upload button and select a VCF file from your computer, or drag-and-drop your VCF file to upload it.

.. TO DO: tabix gz format?
.. TO DO: custom NHLBI/gnomad filtering thresholds??

Progress page
--------------------

After uploading is complete you will be taken to a status screen showing
the progress of your job through the system.  Analysis typically
takes 10-15 minutes depending on file size and system availability.

It isn't necessary to keep your browser open on this page until your
results are ready: the system will e-mail you with a link to return
to your results.  Optional browser notifications are also available.

.. TO DO: screenshots
