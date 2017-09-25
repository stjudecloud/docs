.. _chipseq-faq:

Frequently Asked Questions
==========================

If you have any questions not covered here, feel free to reach out on
`our contact form <https://hospital.stjude.org/apps/forms/fb/st-jude-cloud-contact/>`_.


**Q: Should I choose narrow peak calling pipeline or broad peak calling pipeline?**
  
   We built two workflows: one for narrow peak calling and another broad peak calling.
   If your target protein is a transcription factor, please use
   narrow peak calling workflow. For histone marks H3K4me3, H3K4me2, H3K9-14ac,
   H3K27ac and H2A.Z, you could try narrow peak calling workflow. For histone
   marks H3K36me3, H3K79me2, H3K27me3, H3K9me3 and H3K9me1, you could try broad
   peak calling workflow. In some scenario, H3K4me1, H3K9me2 and H3K9me3 might
   behave between narrow and broad shape, you might need to look into each peak
   region and consult experts.

**Q. What to do if your fragment size is less than 50 base pairs?**

   We estimate fragment size from the data based on the cross correlation plot.
   Usually the fragment size is above 50bp. If the estimated fragment size lower
   than 50bp, the workflow will stop at the peak calling stage (MACS2/SICER)
   after BWA mapping finishes. You can rerun the analysis with a specified
   fragment length.



