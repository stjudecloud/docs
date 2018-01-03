.. _dx-toolkit:

Command Line Interaction 
========================

In most normal cases, we recommend that you use the :ref:`desktop-application`
to upload or download your data. However, we've built St. Jude
Cloud to be easily accessible from the command line. Before you 
can begin uploading and downloading data to the platform, 
you'll need to understand a few fundamentals about how St. Jude Cloud
is built.

St. Jude Cloud is built on top of the genomics processing engine
provided by `DNAnexus <https://www.dnanexus.com/>`_. To understand
a bit better, navigate to https://platform.dnanexus.com
and log in with your St. Jude Cloud credentials (your DNAnexus account
and St. Jude Cloud account are the same). St. Jude internal employees should see [1]_. You should see a picture
similar to the screenshot below. 

.. image:: resources/platform-dnanexus.png

DNAnexus is organized by projects, and in St. Jude Cloud, each tool
has a its own project in DNAnexus. This project is created once you click
"Launch this Tool" on one of the tool description pages (example: `Rapid RNA-Seq description page <https://platform.stjude.cloud/tools/rapid_rna-seq>`_).
You should see a project for each of the tools that you have previously
launched, as well as some other ancillary projects.

.. note:: If you do not see any projects, you likely haven't tried to run
          any tools yet. Navigate to the
          `St. Jude Cloud tools page <https://platform.stjude.cloud/tools>`_,
          select "View" for a tool you want to run, click "Launch this Tool"
          on the left side-panel, and try again.

Installation
------------

Behind the scenes, open-source software provided by DNAnexus called the 
"dx-toolkit" is being used to interact with the DNAnexus genomics 
platform to create these projects, upload and download data, and many other operations.
Before you can interact with St. Jude Cloud on the command line, you'll
need to install that software on your computer by following 
`this guide <https://wiki.dnanexus.com/Downloads#DNAnexus-Platform-SDK>`_.

.. _selecting-a-project:

Selecting a project
-------------------

Before uploading or downloading data from a St. Jude Cloud tool,
you'll need to specify which tool you are wanting to either upload to
or download from. You can do this by issuing the following command

.. code-block:: bash

   dx select

This will present with a prompt similar to the below screenshot.
You should enter the number corresponding to the tool you are 
wanting to interact with. In the example below, the user has 
selected the Rapid RNA-Seq tool.

.. image:: resources/select-project.png

Uploading/Downloading data
--------------------------

Data upload and download is painless once you have selected the
correct project for your tool (see :ref:`selecting-a-project` for details).

To upload data to St. Jude Cloud, execute the following command

.. code-block:: bash

   dx upload <LOCAL_FILENAME>

Once data is uploaded to St. Jude Cloud, you can select it for processing
by following the specific tool's intructions.

To download results from St. Jude Cloud, you might find the following commands
useful.

.. code-block:: bash

   # list available files for the tool for the main folder
   dx ls

   # list all available files for the tool
   dx find .
   
   # download remote files to the local disk.
   dx download <FILENAME_IN_CLOUD>
  
.. [1] St. Jude employees should go to https://cloud.stjude.org instead and log in with LDAP credentials.