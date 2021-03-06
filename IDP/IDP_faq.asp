<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
  <title>IDP FAQ</title>
  <!-- #include file ="asp\header.inc" -->
  <!-- #include file ="asp\all_track.inc" -->
</head>

<body>

<!-- #include file="asp\redbar.inc" -->

<div id="content_container">
  <!-- PAGE TITLE AREA AND BOX -->
  <!-- #include file="asp\titlearea.inc" -->
  <!-- END PAGE TITLE AREA AND BOX -->
  <div id="content">
    <h2>FAQ</h2>
    If you have any questions that have not been answered here, please <a href="IDP_contact.asp">contact</a> us.
    <h3><img src="images/dna.png"> What is IDP?</h3>
	IDP is a program written entirely in python2.6 that is able to integrate the thrid generation long reads and the second generation 
    short reads to <b>identify gene isoforms</b>.


  <h3><img src="images/dna.png">My genome does not have an extensive EST and mRNA database to build the "allref_annotation_pathfilename" file, may I use the same reference genepred file (ref_annotation_pathfilename) for this file?</h3>
  <ul>
  
  <li>Question:</li>
  My genome does not have an extensive EST and mRNA database to build the "allref_annotation_pathfilename" file, may I use the same reference genepred file (ref_annotation_pathfilename) for this file?
  </ul>
  <ul>

  <li>Answer:</li>
  Yes, an exhastive set of junctions would be more useful in identifying true negatives, but you may use the reference annotation genepred when no other is available.
  </ul>           

  <h3><img src="images/dna.png">Can I concatenate a long read set that has 5' and 3' primer sequences with a set that has been trimmed?</h3>
  <ul>
  
  <li>Question:</li>
  Can I concatenate a long read set that has 5' and 3' primer sequences with a set that has been trimmed? If I set the primers in the config file will there be any problem using sequences that have been trimmed simulaneously?
  </ul>
  <ul>

  <li>Answer:</li>
  Yes, there should be no problem using those concatenated data sets.
  </ul>           

  <h3><img src="images/dna.png">Can I use any aligner I want for my short reads?</h3>
  <ul>
  
  <li>Question:</li>
  Can I use any aligner I want for my short reads? 
  </ul>
  <ul>

  <li>Answer:</li>
  At this moment, IDP only supports the junction output format of SpliceMap.  In the future we would like to support other short read aligners.
  </ul>      

  <h3><img src="images/dna.png"> Which corrected long read output of LSC do I use as an input for IDP?</h3>
  <ul>
  
  <li>Question:</li>
  Which corrected long read output of LSC do I use as an input for IDP?  I see both corrected.fa and full.fa that I could use 
  </ul>
  <ul>

  <li>Answer:</li>
<b><font color = "red">Please concatenate the LSC outputs: corrected.fa with full.fa, and use this new fasta
file as your long read inputs for IDP.</font color></b><br>

The reason is that corrected.fa will lose some flanking sequences on
the long reads that were not corrected by short reads, and there still
may be some informative junctions in that region.  If we used only
corrected.fa, we could lose this information.  full.fa includes those
flanking regions in addition to the corrections that were made.
However, if we used only full.fa, it is likely the IDP algorithm could
throw out many of those long reads for failing to find short read
support for junctions in those regions.  If you combine the two
datasets, you will not suffer any loss of information, and any
redundancies will be handled by IDP.
  </ul> 

  <h3><img src="images/dna.png"> [ IDP 0.2.4 ] What is in the folder "output_old"?</h3>
  <ul>
  
  <li>Question:</li>
  I got three folders output, output_old, and temp.
I guess IDPoutput is new vision result and IDPoutput_old is earlier vision result. Right?
New result folder has new files like newLS.fa etc.
Could you explain the files mean? 
  </ul>
  <ul>

  <li>Answer:</li>
The folder output_old contains some "old" results which may have slightly lower accuracy.
In IDP 0.2.4, I corrected some bugs and output "new" results in the folder output. You should use these files. newLS.fa is just a temp file for debugging. you only need to use full_LR_SR.map.fa and corrected_LR_SR.map.fa
  </ul>



  
    <h3><img src="images/dna.png"> "awk" bugs?</h3>
  <ul>
  <li>Question:</li>
  
    IDP 0.2.1 runs fine on a small set of data, but when it runs on the whole short read set (49 GB) I get an read error in awk:
  <pre>(awk: read error (Bad address) </pre>
  At first try it reached 30 GB but this error popped up earlier and earlier with each run. This error also appears when I just run awk from the commandline on this set. 
  </ul>
  <ul>
  <li>Answer:</li>
  The user may have used mawk that is a very fast AWK implementation by Mike Brennan based on a byte code interpreter. You will install GNU awk to run IDP.
  </ul> 
  </div>
  
  
  


<!-- #include file="asp\sidebar.inc" -->
<!-- #include file="asp\footer.inc" -->  
  
<!-- end #content -->
</body>


</html>
