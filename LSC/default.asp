<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<title>LSC -  error correction tool for long reads</title>
<!-- #include file ="asp\header.inc" -->
<!-- #include file ="asp\all_track.inc" -->
</head>


<body>

 <!-- #include file="asp\redbar.inc" -->

<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->
  <div id="page_title_area">
    <!-- STANDARD PAGE TITLE; NO DECORATIVE GRAPHIC -->
    <!-- <div id="page_title_leftcontent"> -->
    <div id="page_title_leftcontent">
      <h1>LSC</h1>
      <ul>
        <li>LSC is a long read error correction tool. <br>
        It offers fast correction with high sensitivity <br>
        and good accuracy. <br>

      </ul>
    </div>
    
    <div id="page_title_rightcontent">
	<ul>


	    <li>&nbsp;</li>

		<li><img src="images/LSC.png" width="300" >&nbsp;&nbsp;&nbsp;&nbsp;</li>
		
	</ul>
    </div>

<p class="page_title_area_lower">Latest News:  Major update version 2.0 ... <a href="LSC.html#news">read more</a></p>
    
    
  </div>


  <!-- PAGE TITLE LEFT CONTENT WITH OPTIONAL QUAD LAMP DECORATION; UN-COMMENT TO USE -->


  <!-- END PAGE TITLE AREA AND BOX -->
  <div id="content">
    <h2>Getting Started</h2>
    <p>These simple steps will help you integrate LSC into your transcriptomics analysis pipeline. </p>
    <ul>
        <li>Read the <a href="LSC_requirements.asp">LSC_requirements</a> for running LSC. </li>
        <li><a href="LSC_download.asp">Download</a> and set-up the LSC package. </li>
        <li>Follow the <a href="LSC_tutorial.asp">tutorial</a> to see how LSC works on some example data. </li>
        <li>Read the <a href="LSC_manual.asp">manual</a> if anything is unclear. </li>
        <li>You're ready, Happy LSCing!</li>

    </ul>
    <h2>Latest publication</h2>
    Kin Fai Au, Jason Underwood, Lawrence Lee and Wing Hung Wong <br>
    <b> Improving PacBio Long Read Accuracy by Short Read Alignment </b> [<a href="http://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0046679">Manuscript</a>] 
	<br><i>PLoS ONE</i> 2012. 7(10): e46679. doi:10.1371/journal.pone.0046679</br>
	<br>
    <i></i>  
	
	
    <div id="news">
    <h2>Latest News</h2>
    </div>

	
    <div id="version 2.0">
   <h3><img src="images/dna.png"> 04-11-2016: Major update version 2.0</h3>
    </div>
	<p>
	<i><u>Updates:</u></i> 
	</p>     
    <ul>
      <li>Added Command line argument support.</li>
      <li>Multi-stage execution modes.</li>
      <li>Support for parallelization.  Now execution proceeds in batches of long reads the size of which can be set by --long_read_batch_size N.</li>
      <li>Better compressed intermediate files.</li>
      <li>Added utilities folder.</li>
      <li>Added support for multiple short read files.</li>
      <li>Removed use of configuration file.</li>
      <li>Removed support for BWA, RazerS3, and Novoalign. We are happy to support these if there is interest so please contact us if you prefer them over bowtie2.  Bowtie2 is the prefered supported aligner in this release.</li>
      <li>Removed the requirement for long reads to be in PacBio format.</li>
    </ul>

    <div id="1.beta">
   <h3><img src="images/dna.png"> 02-02-2015: Minor updates and bug fixes LSC 1.beta</h3>
    </div>
	<p>
	<i><u> Feature Updates:</u></i> 
	</p>     
    <ul>
    <li>
	Updating aligners default command options to gain better performance. 
	<ul>
    <li> Updated Novoalign command options (tested with >= novocraftV3.02.04 version) </li>
	<li> Updated RazerS3 command options to be compatible with latest version (razers3 3.1.1) </li>
	</ul>
	</li>
    <li>
	Added extra clean_up option value to remove all generated intermiediate files in case of issues w/ disk space
	</ul>
	

	<p>
	<i><u> Bug Fixes:</u></i> 
	</p> 
	<ul>
	<li>
	Fix a bug in generating full_LR.fa sequences causing some full read sequences to miss couple of bases
	</li>
    </ul>


    <div id="1.alpha">
   <h3><img src="images/dna.png"> 12-01-2013: Faster and much less memory-required LSC 1.alpha is released</h3>
    </div>
	<p>
	In the LSC 0.3.0 or 0.3.1, we optimized the setting of bowtie2 and BWA to get much more short read alignment, which improve the the accuracy of error correction a lot/
	However, the increase of alignments also requires much more running time (on both alignment and the following error correction step) and memory usage. 
	Therefore, a few users met difficulty of running LSC 0.3.0 or 0.3.1.
	</p>
	<p>
	In LSC 1.alpha, we apply probabilistic algorithm ("SCD" option) to select ""enough" short read alignment for error correction.
	LSC 1.alpha does NOT sacrifice the error correction performace (sensitivity and specificity). Please see <a href="http://www.healthcare.uiowa.edu/labs/au/LSC/LSC_manual.html#aligner">http://www.healthcare.uiowa.edu/labs/au/LSC/LSC_manual.html#aligner</a>
	Thus, we save running time and memory usage significantly.
	<b>The running time is 30-50% of LSC 0.3.1. The peak memory usage decreases to ~10G regardless of the data size.</b>
	</p>

	<p>
	<i><u> New features:</u></i> 
	</p>     
    <ul>
    <li>
	<b>Added probabilistic algorithm ("SCD" option) to pre-select SR alignments results based on LR-SR alignment coverage depth (Significant improvement in running time and memory usage)</b>
    </li>
	<li>
	Removed requirement for loading SR dataset in memory to generate LR-SR mapping file (Significant improvement in <b>memory usage</b>)
	</li>
	<li>
	Added option "sort_max_mem" in run.cfg to control maximum memory used by unix sort command to avoid unexpected Mem crash 
	</li>
    </ul>
	
	<p>
	<i><u>Miscellaneous changes:</u></i> 
	</p> 
	<ul>
	
	<li>Fixed a bug in generating FASTQ file (it affected some of QualityValue computation results)
	</li>
	
    </ul>
	<p>
	If you want to see the manual and tutorial of the old LSC (before 1.alpha), we keep the links of its the <a href="LSC_manual_0.3.1.asp"> Old manual</a> and <a href="LSC_tutorial_0.3.1.asp">Old tutorial</a> in the right side bar.
	</p>
	
    <div id="0.3.1">
   <h3><img src="images/dna.png"> 09-30-2013: More robust and faster LSC 0.3.1</h3>
    </div>
	<p>
	In LSC 0.3.1, we don't have pseudo chromosome, the alignment time reduced to ~10% (in Bowtie2 mode). And you can re-run some crashed jobs easily now.
	</p>
	<p>
	<i><u> New features:</u></i> 
	</p>     
    <ul>
    <li>
	Remove pseudo-chr processing
    </li>
	<li>
	Accept compressed SR as input (should be named SR.fa.cps/SR.fa.cps.idx in any folder)

	</li>
	<li>
	Added "runLSC -cleanup" option to remove redundant files (per thread split, remaining _tmp files) if the run was successful at the end. 
	</li>
	
	<li>Changed convertNav to sort reads and then generate LR_SR.map (memory optimization instead of loading all alignments in memory)
    </ul>

	
	<p>
	<i><u>Miscellaneous changes:</u></i> 
	</p> 
	<ul>
	<li>
	Changed "print" to system.echo (messages were not printed out in qsub output files)
	</li>
	<li>
	Changed a little bit "cleanup" option to keep per thread data (*.aa, *.ab, ..). It was useful when one thread was crashed and we wanted to just re-run that at the end
	</li>
    </ul>



    <div id="0.3">
	<p>
   <h3><img src="images/dna.png"> 08-07-2013: Big changes in LSC 0.3</h3>
	<p>
	In LSC 0.3, we have a few updates. They are very IMPORTANT updates, new features and small fixes
	</p>
	<p>
	<i><u> Very IMPORTANT updates:</u></i> 
	</p>     
    <ul>
    <li>
	Support for Bowtie2 and RazerS3 as initial aligners. Now, BWA, Bowtie2, RazerS3 and Novoalign work in LSC. <b>Please see the comparison details of aligners in the <a href="LSC_manual.html#aligner">"Short read - Long read aligner#manual"</b></a>. 
    </li>
	<li>
	Added SR length coverage percentage on LR (SR-covered length/full length of corrected LR) to corrected_LR output file. Here is an example, where the last number 0.82 is the SR length coverage percentage on LR:  
    <ul><FONT FACE="arial"><i>
	>m111006_202713_42141_c100202382555500000315044810141104_s1_p0/18941/365_1361|<b>0.82</b></i>
	</FONT> 
    </ul>
	</li>
	<li>
	Added support for three modes for step-wise runs:
	</li>
	<ul><font face="Comic sans MS" size="2"><ul><b>mode 0</b>: end-to-end</ul> <ul><b>mode 1</b>: generating LR_SR.map file</ul> <ul><b>mode 2</b>: correction step</ul></b></font>
	</ul>
	
	<li>Generating FASTQ output format based on correction probability given short read coverage. Please refer to <a href="LSC.pdf">LSC paper</a> and 
	<a href="LSC_manual.html">manual</a> page for more details.
	You can select well-corrected reads for downstream analyses by using the quality in FASTQ output or SR length coverage percentage above. <b> Please the the filtering in the <a href="LSC_manual.html#output">"Output#manual"</b></a>. 
   </li>	
	</ul>
	
	<p>
	<i><u>New features</u></i> 
	</p> 
	<ul>
	<li>
	Used the python path in the cfg file instead of default user/bin path
	</li>
	<li>
	Added option (-clean_up) to remove intermediate files or not (Note:  important/useful ones will still be there in temp folder)
	</li>
	<li>
	Support for input fastq format for LR (long reads) and/or SR (short reads)
	</li>
	<li>
	Updated default BWA and novoalign commands options 
	</li>
	<li>
	Printing out original LR names in the output file
	</li>
	<li> 
	Support for printing out version number using -v/-version option
    </li>
	</ul>
	
	<p>
	<i><u> Small bug fixed</u></i> 
	</p> 
	<ul>
	
    <li>
	Fixed in removing XZ pattern printed out at the end of some uncorrected_LR sequences
	</li> 
	<li>
	Fixed samParser bug (which was ignoring some valid alignments in BWA output)
    </li>
	</ul>

	
	
	<p>
   <h3><img src="images/dna.png"> 06-09-2013: BWA is accepted in LSC 0.2.4</h3>
    <p>
    We use a short read aligner in the first step of LSC. By default, Novoaligner is used. You can use BWA to run this process as well, which could be much faster. 
	Please find the new aligner options in the webpage <a href="LSC_cfg.html"> ".cfg file format"</a>	
    </p>
    <p>
	The default settings of Novoalign options are:
    <pre>
	-r All -F FA  -n 300 -o sam -o FullNW 
    </pre>

	The default settings of BWA options are:
    <pre>
	-n 0.08 -o 10 -e 3 -d 0 -i 0 -M 1 -O 1 -E  1 -N 
    </pre>
	You can change these aligner setting. The details of these options can be found in the aligners' home page.
    </p>
	<p>
	In addition, a bug is fixed: 
	</p>
	<p>
	some uncertain corrections may exist at the right ends of the long reads in the old LSC. LSC 0.2.4 settles this problem and likely improves the accuracy further.
	</p>
	
	<p>
   <h3><img src="images/dna.png"> 02-06-2013: a bin path bug is fixed in LSC 0.2.2</h3>
   If you run LSC at the bin folder (the bin folder is the work directory) or set the bin as the default path, then you may meet this bug. LSC 0.2.3 fixes this bug of finding the correct bin folder. You can download the <a href="LSC_download.asp">LSC 0.2.3</a> <br>
    </p>
	
	<p>
   <h3><img src="images/dna.png"> 10-17-2012: LSC 0.2.2 Released and a RemoveBothTail bug is fixed</h3>

   LSC 0.2.2 fixes the bug of the option "I_RemoveBothTails". LSC 0.2.1 ran this option even if you set "N". It may halt the process in LSC 0.2.1 because the read name does not allow "RemoveBothTails". Now you can choose to use this option or not. <br>
    </p>	
	
	<p>
   <h3><img src="images/dna.png"> 10-13-2012: The manual and a tutorial are released </h3>

   The <a href="LSC_manual.html">manual</a> is released and you can also learn LSC by running the example in the <a href="LSC_tutorial.html">tutorial</a>. <br>
    </p>
	
	<p>
   <h3><img src="images/dna.png"> 10-4-2012: LSC paper is released </h3>

   Kin Fai Au, Jason Underwood, Lawrence Lee and Wing Hung Wong <br>
    <b> Improving PacBio Long Read Accuracy by Short Read Alignment </b> 
    </p>
	
	
    <h3><img src="images/dna.png">  8-12-2012 - LSC 0.2.1 Released</h3>
    </div>
    <p>
   LSC 0.2.1 fixes the bug of python path. Another bug of removing redundant reads is also fixed. 
   LSC takes a long read data sets (>=100bp) and a short reads data sets (50 - 100bp) as input. They should be in FASTA format.
   Running time is almost linear with the the number of threads.
    </p>
    <ul>
    <li>Python (version 2.6 or higher) should be installed in the default user bin "#!/usr/bin/python"</li>
    <li>Novoalign should be in your default path. The version V2.07.10 is recommended.</li>
    <li>A new option of using nonredandunt reads that save ~40% running time</li>
    </ul>

    </p>

	
	
	<p>
   <h3><img src="images/dna.png"> 8-7-2012: some bugs are found</h3>

   <li>Great thanks to Hans Jansen@SEQanswers for testing LSC 0.2. Some bugs of python and novoalign path setting will be fix in the coming verison very soon. The thread in SEQanswers may be helpful for your questions:<a href="http://seqanswers.com/forums/showthread.php?p=80859#post80859  ">
http://seqanswers.com/forums/showthread.php?p=80859#post80859</a>
    </p>
If you need to run LSC 0.2 now, please add novoalign in your default path and change the first lines of all scripts "#!/home/stow/swtree/bin/python2.6" to "#!/usr/bin/python".</li>
   
   <h3><img src="images/dna.png"> 5-2-2012: LSC 0.2 Released</h3>
      <p>
   LSC 0.2 takes a long read data sets (>=100bp) and a short reads data sets (50 - 100bp) as input. They should be in FASTA format.
   Running time is almost linear with the the number of threads.
    </p>
    <ul>
    <li>More optional for raw data prefilter</li>
    <li>Multi-threading is available</li>
    <li>Reduced redundant temp files</li>
    </ul>
    <p>
      For detailed information about this release, please see the <a href="LSC_download.asp">release notes</a>.
   </p>
   
  </div>
 <!-- #include file="asp\sidebar.inc" -->

 <!-- #include file="asp\footer.inc" -->
  

<!-- end #content -->
</body>


<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-23879262-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>


</html>
