.. _rapid-rnaseq-monitoring-jobs:

Monitoring Run Progress 
=======================

.. note:: Monitoring the progress of your runs is the
          same for all pipelines. This guide will feature
          the :ref:`rapid-rnaseq` pipeline, but you can follow
          along for any tool.

Monitoring the status of your pipelines in the St. Jude Cloud is
simple. First, navigate to your tool's description page (for instance,
Rapid RNA-Seq's description page is `here <https://platform.stjude.cloud/tools/rapid_rna-seq>`_).
You should see a screen similar to the one in the screenshot below.
In the left hand pane, select "View Running Jobs".

.. image:: ../../../resources/running-jobs.png
   :alt: Click "View Running Jobs"

Here, you will see a list of all of your previous runs for a tool, as
well as the job status (successful, failed, terminated by user) and 
cost. You can click on the "+" icon to the left of each tool run to see
all of the different tools that were run.

.. figure:: ../../../resources/jobs-basic.png
   :alt: Click the "+" beside a run to view more information

   Click the "+" beside a run to view more information.

Other information, such as time, cost of individual job, and even job
logs are available by clicking on the sub-items.

.. figure:: ../../../resources/jobs-advanced.png
   :alt: Advanced job information

   Click on individual items in the list to explore detailed information
   on each analysis that was run.


.. note::
   
   Advanced users can view the
   `DNAnexus Job Monitoring Tutorial <https://wiki.dnanexus.com/UI/Jobs>`_
   and the
   `DNAnexus Command Line Tutorial for Job Monitoring <https://wiki.dnanexus.com/Command-Line-Client/Monitoring-and-Listing-Jobs>`_
   for more information.
