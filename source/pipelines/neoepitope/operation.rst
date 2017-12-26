Pipeline Operation
==================

.. caution::
   This pipeline assumes HG19 coordinates in the mutation file. If the coordinates is based on HG38, 
   the coordinates will lifted over to HG19 to perform epitope affinity prediction. 

.. _neoepitope-upload:

Uploading Data
--------------

The HLA Typing and Neoepitope Prediction pipeline takes either a Gzipped FastQ 
file or a BAM file aligned to HG19 or HG38 (WGS, WES or RNAseq). You can upload the files
you would like to run using the :ref:`desktop-application` or by uploading data
manually using the :ref:`dx-toolkit`.

.. note:: You should click "Launch this tool" before attempting to upload data
          to the tool (the tool's workspace is only created once you do this). After you
          are redirected, you can safely close the tab that was just opened.

Input File Configuration
----------------------------
Users need to provide a mutation file for SNV or gene fusion. The format of the mutation file is shown in the following example. The file can be prepared in Excel and saved as a tab-delimited text file to use as input.

The HLA alleles for testing will be derived from the HLA typing module using the workflow. The peptide size and affinity cutoff can be modified by users. The neoepitope step can be used as an independent app alternatively, allowing users to predict epitopes in multiple samples.

Mutation file format
#######################
+-------------------+----------+----------+--------------+----------+----------+----------+-----------------+--------------+
| GeneName          | Sample   |   Chr    | Postion_hg19 | Class    | AAChange | mRNA_acc | ReferenceAllele | MutantAllele |
+===================+==========+==========+==============+==========+==========+==========+=================+==============+
| Gene1             | SampleA  |   chr10  |   106150600  | missense |   R663H  | NM_00101 |      A          |      T       |
+-------------------+----------+----------+--------------+----------+----------+----------+-----------------+--------------+
| Gene2             | SampleA  |   chr2   |   32330151   | missense |   N329N  | NM_00102 |      T          |      G       |   
+-------------------+----------+----------+--------------+----------+----------+----------+-----------------+--------------+

.. note:: The mutation file required a format as shown in the example above. 
          
          * The chromosome requires a 'chr' prefix. 
          * The position requires a suffix of HG19/HG38 to indicate the human genome assembly version. 
          * Only the missense mutations/gene fusion is supported currently and the other types of mutations will not be processed. 

Mutation file example
######################
.. image:: resources/mutation_file_example.png


Parameter Configuration
-----------------------

Click “Launch this tool” on the `tool’s landing page <https://platform.stjude.cloud/tools/4>`_.
You will be redirected to the tool’s workspace, and the workflow screen should
automatically pop up. 

Select input files
++++++++++++++++++++++++++

The required inputs appear on the left side of the
screen. You should see an image similar to the picture below.

   .. image:: resources/epitope_input.png
   .. image:: resources/epitope_input2.png

#. Option1 : Click on the :code:`BAM alignment file` and :code:`BAM index file` field.

   .. image:: resources/Bam_select.png

   Option2 : Click on the :code:`Forward read fastq` and :code:`Reverse read fastq` field. A similar window for file selection will show up.
 
#. In the file dialog that pops up, select the FastQ/BAM files that will be included in the analysis. 

#. Click on the :code:`Mutation file` field.

   .. image:: resources/mutation_file_select.png

#. In the file dialog that pops up, select the mutation files (for details of mutation file, see `Input File Configuration`_) that will be used in the analysis. 

#. After all the required input selected, green 'runnable' messages will show up.  
   
   .. image:: resources/ready_run.png

#. Click the green "Run as Analysis" button at the top right to run the analysis

Running the Pipeline
--------------------

You will see the workflow running, similar to the screenshot below.

   .. image:: resources/running_progress.png

You can continue on to the next section for details on monitoring job progress.
