Analysis of Results
===================

Results browser
---------------

When your job is complete you will be taken to an overview page
where you can browse your results and examine a detailed results
page for each variant.

.. TO DO: filtering that has been performed by this point
.. TO DO: return to this via Pie/Your jobs

The variants in the results can be filtered by:

.. csv-table::
   :header: "Filter", "Meaning"	        
   :widths: auto

   Class, "Predicted effect of variant on protein coding, e.g. missense, nonsense, etc."
   Somatic medal, "Medal assigned to the variant by the somatic classifier."
   Germline medal, "Medal assigned to the variant by the germline classifier."
   Committee Classification, "If the variant has been reviewed by the St. Jude germline variant review committee, the result will appear in this column, otherwise it will be blank."

The "search" box lets you filter the results by gene and/or amino acid change.  The view is dynamically filtered to matching variants as you type.

.. TO DO: what exactly does the search box cover?

Gold, Silver, and Bronze medals
-------------------------------

Medals are only assigned for coding and splice-related variants in disease predisposition genes.  Germline medals are only assigned for novel variants or those present in the NHLBI ESP database with a MAF of less than 0.1%.

Gold medals are assigned to truncations in tumor suppressor genes, hotspots derived from the COSMIC database, as well as perfect matches to variants in the IARC TP53, PCGP, ASU TERT, ARUP RET, and BIC databases.

.. TO DO: links
.. TO DO: redistribution permissions!

Silver medals are assigned to in-frame indels, truncations in non-tumor suppressor genes, variants predicted deleterious by damage-prediction algorithms, variants receiving a gold medal from the somatic classifier, and perfect matches to variants in the following databases: ClinVar (predicted pathogenic or likely pathogenic), RB1, LOVD, and UMD.

Bronze medals are assigned to variants predicted tolerated by damage-prediction algorithms.  Variants having an imperfect match to a database (i.e. different variants at the same genomic position or codon) typically receive a lesser medal.

A summary graphic can be found in slide 4 of the :download:`ASHG 2017 presentation <resources/pecanpie_ASHG_2017.pptx>`.  For additional details see `Zhang et al., NEJM 2015 <http://www.nejm.org/doi/full/10.1056/NEJMoa1508054#t=article>`_ (supplementary appendix pp. 7-10).



Variant page
------------

Each variant links to a detailed variant page, which integrates data from a variety of sources.  If either you or the St. Jude germline variant review committee have annotated a variant, that information will be pre-populated.

Summary info
^^^^^^^^^^^^^
The top of the page shows a summary of the variant, including its genomic and HGVS annotations, predicted effect on the protein, and somatic and germline medals.  A description of the gene from Entrez follows, and a custom description or selection rationale may also be entered.

Protein Paint
^^^^^^^^^^^^^
An embedded version of Protein Paint (`Zhou et al., Nat. Genet. 2016 <https://www.nature.com/articles/ng.3466>`_) appears next, showing the variant in the context of a number of pediatric datasets including PCGP. A link is provided to the main Protein Paint application which provides visualizations for additional datasets, including COSMIC and ClinVar.

.. TO DO: protein paint: exactly which pediatric datasets?  How is this view different from the link-out PP?

ASHG pathogenicity classification
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Formal variant pathogenicity classification is supported by an interface
implementing ACMG guidelines (`Richards et al., Genet Med. 2015 <https://www.nature.com/gim/journal/v17/n5/full/gim201530a.html>`_).  The analyst reviews a series of curated category tags, assigning applicable tags to the variant and optionally supplying additional information for each such as PubMed IDs and supporting evidence.  The system will then compute an appropriate pathogencity score based on the user-flagged categories.  Additional free-form custom evidence can also be entered.  This structured approach both helps eliminate arbitrary decision-making from the pathogenicity classification process and also constructs a concise summary of the logic and evidence supporting the final call.

.. TO DO: what about later versions of the guidelines, e.g. for cancer?

ClinVar and allele frequency
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Matches of the variant in ClinVar are also provided, along with predicted clinical significance and review status.

.. TO DO: Q: does PIE do its own clinvar lookup?  Or does it depend on medal ceremony's filtered LP/P only version?

Allele frequencies for the variant in the PCGP (somatic and germline),NHLBI ESP 6500, and ExAC databases are presented both as fractional values and on a log10 plot.  Detailed allele population breakdowns are provided for ExAC.

.. TO DO: indel equivalence?
.. TO DO: Q: why do we use the TCGA-subtracted version of ExAC?
.. TO DO: GNOMAD
   

Damage prediction algorithms
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Precomputed damage-prediction algorithm calls for nonsynonymous coding
SNVs are presented, taken from dbNSFP.  Available algorithms are
PolyPhen2 (HVAR), SIFT, FATHMM, MutationAssessor, and LRT.  The calls
are presented in a circular diagram with entries color-coded based on
the predicted severity of the result.

.. TO DO: dbNSFP update, REVEL scores

Medal ceremony and linkouts
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Additional output from medal ceremony classification can also be
reviewed.  This is only loosely structured, additional fields 
here may eventually be integrated into PeCan PIE.

.. TO DO: CLEANUP: hide entries that are already extracted and used by PIE?
.. TO DO: integrate more of this info?
   
Links are provided to relevant dbSNP entries and other information sources.

.. TO DO: PubMed IDs from medal ceremony Evidence fields

Final classification
^^^^^^^^^^^^^^^^^^^^

The final 5-tier ACMG classification can be selected after which the
decision will be marked as reviewed.  A checkbox is also available to
indicate this variant is a potential candidate for functional review.

   
