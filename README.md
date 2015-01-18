I have placed my run_analysis.r file in the "UCI HAR Dataset" directory. This directory contains the 'test' and 'train' sub-directories.  You will need to run it out of there for the referencing of the files to work correctly.

I started by reading in the X_test and X_train files and appending them both into one complete list with all of the data.

I read in features.txt and made a list of all of the variable names that had mean or std in them.

The question arose as to which columns to keep in the data.  It said in the instructions to keep only the entries which were for the mean or the standard deviation.  That sounded straightforward enough, I could just cut out everything that didn't end in -mean or -std, but alas, there were some columns with names like:  "angle(tBodyAccJerkMean),gravityMean)" and "angle(Z,gravityMean)" which had Mean in them, but might not have been supposed to be kept.  I read in this post from the TA, https://class.coursera.org/getdata-010/forum/thread?thread_id=49, that it was up to us to decide whether we wanted to keep the extra columns or not.  I thought it would be better to keep a few extra columns than to discard something that is possibly meaningful, so I kept them all.

Once I had the list of variables that I wanted to keep, I trimmed the other ones out of my competed list.
I read in the subject_test and subject_train files and formed them into one complete list as I did with the X data.  I added this subject_data into my X data.  This contained the subjects associated with each entry in the X data.  

Then I read in Y_test and Y_train files and did the same thing that I had done with the subjects, adding it to my full X data frame.  I next changed the activity entries from the number representations to the actual strings the explain what the activity was.

After that, I cleaned up the column names.  I made a long list of cleaner names and applied it to the data frame.  In Order to make the variable names more readable, I changed the t's to TimeDomain the f's to FrequencyDomain, the Acc's to Accelerate and removed all of the dashes and parentheses, which are not legal R language characters and could screw up some R functionality.

At this point I was done with steps 1-4 of the assignment and I only had to average the data and make a new file.

I found that I needed to average every variable for each combination of subject and activity.  Since there were 30 subjects and 6 activities, this final file would consist of 30 * 6 = 180 rows, one for each combination.  So I separated the data into each combination and averaged the columns and appended that on to the dataframe that I would store in the file.  After I'd done that for every combination, I wrote out the file, MiniFile.txt, to submit for the project.
