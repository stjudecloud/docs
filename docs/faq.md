# Frequently Asked Questions

**Account Questions**  
[Where can I find the Terms of Service or the Privacy Policy?](#where-can-i-find-the-terms-of-service-or-the-privacy-policy)  
[How can I sign up for updates when new data or features are added to the cloud?](#how-can-i-sign-up-for-updates-when-new-data-or-features-are-added-to-the-cloud)  
[How can I delete my account?](#how-can-i-delete-my-account)  


**Billing Questions**  
[Will I be charged for using St. Jude Cloud?](#will-i-be-charged-for-using-st-jude-cloud)   
[How can I set up billing for my lab?](#how-can-i-set-up-billing-for-my-lab)

**Data Request Questions**  
[Why do I need to sign the Data Access Agreement (DAA)?](#why-do-i-need-to-sign-the-data-access-agreement-daa)  
[Can I get access to a word version of the DAA?](#can-i-get-access-to-a-word-version-of-the-daa)  
[Where can I find the latest version of the Data Access Agreement (DAA)?](#where-can-i-find-the-latest-version-of-the-data-access-agreement-daa)  
[Where do I submit the Data Access Agreement (DAA)?](#where-do-i-submit-the-data-access-agreement-daa)  
[What if I did not fill out the Data Download Permission section of the original DAA, but now I want to download data?](#what-if-i-did-not-fill-out-the-data-download-permission-section-of-the-original-daa-but-now-i-want-to-download-data)  
[What clinical information is available about samples in St. Jude Cloud?](#what-clinical-information-is-available-about-samples-in-st-jude-cloud)  
[Can I get a copy of IRB consent forms?](#can-i-get-a-copy-of-irb-consent-forms)  
[Can I request FASTQ files on St. Jude Cloud?](#can-i-request-fastq-files-on-st-jude-cloud)  

**Publication Questions**  
[How do I cite St. Jude Cloud?](#how-do-i-cite-st-jude-cloud)  
[When can I publish my findings using St. Jude Cloud data?](#when-can-i-publish-my-findings-using-st-jude-cloud-data)  
[Where can I find the Embargo Date?](#where-can-i-find-the-embargo-date)

**Miscellaneous**   
[Will St. Jude Cloud host my institution's data in the data browser or on PeCan?](#will-st-jude-cloud-host-my-institutions-data-in-the-data-browser-or-on-pecan)  

### Where can I find the Terms of Service or the Privacy Policy?

You can find the Terms of Service
[here](https://stjude.cloud/terms-of-use.html) and the Privacy Policy
[here](https://platform.stjude.cloud/privacy).


[msgen]: https://azure.microsoft.com/en-us/services/genomics/
[gvcf-spec]: https://gatkforums.broadinstitute.org/gatk/discussion/11004/gvcf-genomic-variant-call-format
[gvcf-diff-from-vcf]: https://gatkforums.broadinstitute.org/gatk/discussion/4017/what-is-a-gvcf-and-how-is-it-different-from-a-regular-vcf

### How can I sign up for updates when new data or features are added to the cloud?
We are always adding data to St. Jude Cloud, and if you would like to sign up for updates [subscribe here](https://hospital.stjude.org/apps/forms/fb/st-jude-cloud-subscribe/).



### How can I delete my account?

If you'd like to delete your account, please email DNAnexus support at
<support@dnanexus.com> with the following email.

    Hi DNAnexus,

      Would you please assist me in deleting my St. Jude Cloud account? My username is _____.

    Thank you!


### Will I be charged for using St. Jude Cloud?

Any copy of the St. Jude data you receive is considered "sponsored",
  so you do not have to pay a fee to store this data in St. Jude
  Cloud. Although you may be prompted to enter billing information, you will not
be charged for anything with the exception of the following actions:

*  You will be charged for any *derivative* files stored on the St. Jude Cloud, such as results files obtained through running analyses workflows.
* There is a small monthly storage fee associated for any of your own data you upload to the cloud.
* If you elect to *download* any data from St. Jude Cloud, you will be
  charged an egress fee by DNAnexus. This fee is usually negligible
  unless you are downloading entire cohorts. We are actively
  investigating ways to minimize or eliminate these costs.
* If you run any of our analysis workflows (such as Rapid RNA-Seq, WARDEN, etc) or your own workflows that you have uploaded and packaged into the cloud, you will be charged for the
  compute resources used in producing the results. Soon we hope to be able to sponsor all compute costs associated with running our St. Jude Cloud workflows.

### How can I set up billing for my lab?
Billing set up is different based on whether you are an interval user (you work at St. Jude) or an external user. Refer to the appropriate section of the [Create an Account page](create-an-account.md) for billing set up instructions.


### Why do I need to sign the Data Access Agreement (DAA)?
Although the [DAA](glossary.md#data-access-agreement) serves many purposes, the terms included in the data access
agreement are ultimately in place to protect our patients. We take
patient security very seriously, and we require that requesters are
committed to protecting that privacy to the fullest extent.

### Can I get access to a word version of the DAA?
No. If we provide an editable format, we cannot ensure that the legal document has not been changed. Since we do not accept different versions of this agreement, we unfortunately cannot provide the document in Word format.

### Where can I find the latest version of the Data Access Agreement (DAA)?
We keep [our site](../data/data-request/#submit-your-data-request) up to date with the latest version on the Data Access Agreement for you to download, or you can download a copy
[here](https://platform.stjude.cloud/access_form).

### Where do I submit the Data Access Agreement (DAA)?
You can submit your Data Access Agreement in the drag and drop box on the [last step of the data request process](./guides/data/data-request.md#requesting-data).

### What if I did not fill out the Data Download Permission section of the original DAA, but now I want to download data?
Since this would be a change in terms from the original agreement, you would need to fill out a new DAA (including the [Data Download Permission section](./guides/forms/how-to-fill-out-DAA.md#data-download-permission) for any datasets you want to download.


### What clinical information is available about samples in St. Jude Cloud?
Currently the only [clinical information](./guides/data/metadata.md#clinical-and-phenotypic-information) we provide is age at diagnosis, diagnosis, ethnicity, and sex. Unfortunately, even if we do collect other information, such as other supportive oncology data, it is not available on the cloud at this time. We are working towards being able to provide additional clinical annotations in the future.

### Can I get a copy of IRB consent forms?
Unfortunately, we will not be able to share blank consent forms at the current time. We have chosen to remain consistent with the requirements of the other major genomic data repositories in that (1) there is an internal vetting process by the St. Jude IRB to ensure samples may be shared with the research community, but (2) we do not share the informed consents with data requestors. It is important to remember that St. Jude Cloud is the platform upon which all St. Jude data is shared. This means that there are more than 100 consent forms + revisions fro the various studies across St. Jude. Thus, there is an additional logistical barrier in that we simply don't have the bandwidth to pull together a packet containing all of this information for each requestor.

### Can I request FASTQ files on St. Jude Cloud?
We do not share FASTQ formats, but several tools exists that you can leverage to revert BAM to FASTQ files. (We recommend using Picard SamToFastq to revert BAM files.) You can efficiently revert BAMS to FASTQ in the cloud by wrapping the conversion tool of your choice into a [Cloud App](./guides/data/creatings-a-cloud-app.md)

### How do I cite St. Jude Cloud?
We are currently in progress of preparing a paper for St. Jude Cloud. In the meantime, please refer to the [citation table](overview.md#citing-st-jude-cloud) on the Welcome page.

### When can I publish my findings using St. Jude Cloud data?
Once the [embargo date](glossary.md#embargo-date) for the St. Jude datasets that you've used in your reserach has passed, you are legally permitted to publish results based on that data.

### Where can I find the Embargo Date?

All of our samples are marked with an [embargo date](glossary.md#embargo-date).
You can find this by looking at the tags for each file or in the
`SAMPLE_INFO.txt` file that is included with each data request.
Select a sample and click info to see more.

![](../images/guides/data/embargo-date-1.png)
![](../images/guides/data/embargo-date-2.png)

### Will St. Jude Cloud host my institution's data in the data browser or on PeCan?
If you are interested in submitting data to St. Jude Cloud, please contact us at support@stjude.cloud.
