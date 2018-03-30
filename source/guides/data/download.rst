.. _data-download:

Downloading Data from Requests
==============================

.. warning::

   To download data from St. Jude Cloud, you must have indicated that you
   wished to download the data in your Data Access Agreement (DAA) during your data request. 
   Any downloading of St. Jude data without completing this step is PROHIBITED.

Prerequisites
-------------

Read the :ref:`commandline` guide to install the necessary software and 
get an overview of how to interact with the St. Jude Cloud Platform from
the command line.

Process
-------

You can use the following steps to download data from the St. Jude Cloud Platform:

1. Complete a data request using the St. Jude Cloud Platform. 
   In this example, we've created a request with the name "Retinoblastoma Data".

   .. image:: resources/retinoblastoma-request-name.png

2. Open up your terminal application and select the cloud workspace relevant to
   your data request as specified in :ref:`selecting-a-project`. For instance,
   in this case we would type :code:`dx select "Retinoblastoma Data"`.

   .. image:: resources/select-retinoblastoma.png

3. You can use typical commands like :code:`dx ls`, :code:`dx pwd`, and :code:`dx cd`
   to navigate around your cloud folder as you would a local folder. Your project
   may look different based on what data types you requested and if you needed to be 
   approved or not.

   .. image:: resources/navigate-data-request.png

4. In the root of every data request is a file called :code:`manifest.txt`. This should
   contain all of the information about the samples you checked out as well as the 
   associated metadata we provide.

5. To download data from the cloud to local storage, use the :code:`dx download` command
   as specified in :ref:`upload-download-data`. For instance, if I wanted to download 
   all of the BAM files to my local computer, I would type
   :code:`dx download immediate/bam/*`.

   .. image:: resources/download-bams.png