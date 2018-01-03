Known Issues
============

Adapter contamination
---------------------

This pipeline does not, at present, remove adapter sequences. If the sequencing
library is contaminated with adapters, CICERO runtimes can increase
exponentially. We recommend running FastQ files through a QC pipeline such as
FastQC and trimming adapters with tools such as Trimmomatic if adapters are
found.

High coverage regions
---------------------

Certain cell types show very high transcription of certain loci, for example,
the immunoglobulin heavy chain locus in plasma cells. The presence of very
highly covered regions (typically 100,000-1,000,000+ X) has an adverse effect on
CICERO runtimes. Presently, we have no good solution to this problem as
strategies such as down-sampling may reduce sensitivity over important regions
of the genome.

Interactive Visualizations Exon vs Intron Nomenclature
------------------------------------------------------

When a codon is split over a fusion gene junction, the annotation software marks
the event as intronic when really, the event should be exonic. We are working to
fix this bug. In the mean time, if a fusion is predicted to be in frame but the
interactive plot shows "intronic", we suggest the user blat the contig shown
just below to clarify if the true junction is either in the intron or exon.