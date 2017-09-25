Analysis of Results
===================

HLA typing
~~~~~~~~~~
The output of this app contain the prediction of the HLA class I alleles from OptiType. 

* A folder stamped with the time will present in the output folder (optitype), which contains the raw output.

.. image:: resources/hlatype_result.png 

* The file contains the predicted HLA alleles of the sample.
  
.. image:: resources/hlatype_result2.png


Neoepitope prediction
~~~~~~~~~~~~~~~~~~~~~

The output contains one summary HTML, one folder with raw output and one folder with outputs in Excel formats:

.. image:: resources/epitope_result.png

Epitope_affinity_prediction.html:
  * This file provides a summary of the epitope prediction that can be visualized directly from web browser. 
  * The peptides with affinity lower than user-defined cutoff will be highlighted in green in the webpage.

.. image:: resources/epitope_result2.png

Raw_output: this folder contains the raw output of the affinity prediction.

.. image:: resources/epitope_result3.png

There will two major types files present here:

.. image:: resources/epitope_result4.png

* affinity.out: these files are the prediction results from the netMHCcons for each peptide. 

.. image:: resources/epitope_result5.png

The following columns will be shown in the output:  

  #. :code:`Gene name`: the name of the genes  
  #. :code:`Sample`: the name of the samples  
  #. :code:`Chromosome (chr)`: the chromosome location of the variation
  #. :code:`Position`: the chromosomal position of the variation. Currently, the position will be lifted over to Hg19 to ensure correct translation of peptide sequences based on the internal annotation database of the pipeline. Therefore, the position will be labeled as hg19
  #. :code:`Class`: class of the varitaion
  #. :code:`Reference allele`: reference allele at the position
  #. :code:`Mutant allele`: mutated allele at the position
  #. :code:`mRNA_acc`: NCBI accession number of the mRNA
  #. :code:`Allele`: HLA allele tested
  #. :code:`Peptide`: the neoepitope sequences tested
  #. :code:`Gene_variant`: the gene and variant residues
  #. :code:`1-log50k`:	Prediction score from netMHCcons
  #. :code:`nM`: Affinity as IC50 values in nM
  #. :code:`%Rank`: % Rank of prediction score to a set of 200.000 random natural 9mer peptides
  #. :code:`HLAtype`: All of the hla alleles predicted in the specific sample

* flanking.seq: these files contain the sequences used for the prediction.

.. image:: resources/epitope_result6.png

XLSX: this folder contains the raw output of the affinity prediction as described above in Excel files. The files can be downloaded and opened with Excel for downstram filtering and analyses 

.. image:: resources/epitope_result7.png

