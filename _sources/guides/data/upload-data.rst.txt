.. _data-upload:

Uploading Data to St. Jude Cloud
================================

.. .. note::
        In most cases, we recommend that you use the :ref:`desktop-application`
        to upload or download your data to/from St. Jude Cloud. 
        However, we've built St. Jude Cloud to be easily accessible from the 
        command line for power users. 



Prerequisites
-------------

Read the :ref:`commandline` guide to install the necessary software and 
get an overview of how to interact with the St. Jude Cloud Platform from
the command line.

Uploading data to St. Jude Cloud Platform tools
-----------------------------------------------

You can use the following process to upload data to be used by St. Jude Cloud Platform
tools:

1. First, click "View" on the tool you'd like to run from `this page <https://stjude.cloud/tools.html>`_.
   In this example, we will choose the Rapid RNA-Seq tool.
2. If you have not already, click "Start" on the tool you'd like to run.

   .. image:: resources/rapid-rnaseq-start.png

3. Open up your terminal application and select the cloud workspace with the same
   name as the tool you are trying to run (see :ref:`selecting-a-project`).

   .. image:: resources/select-rapid-rnaseq.png

4. Last, navigate to the local files you'd like to upload to the cloud and use
   the :code:`dx upload` command as specified in :ref:`upload-download-data`
   to upload your data to St. Jude Cloud.
   
   .. image:: resources/rapid-rnaseq-upload-data.png

