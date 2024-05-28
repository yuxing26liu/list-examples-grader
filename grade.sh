CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

#step 1
git clone $1 student-submission
echo 'Finished cloning'

#step 2
if [[ -f student-submission/ListExamples.java ]]; then 
    echo "File Existed"
else
    echo "ListExample.java doesnt exist"
    echo "Grade: 0"
    exit 1
fi

#step 3
cp student-submission/ListExamples.java TestListExamples.java grading-area
cp -r lib grading-area

#step 4
cd grading-area
javac -cp $CPATH ListExamples.java TestListExamples.java

echo " This is the exit code of javac(previous command): $?."

#step 5

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples #> output.txt

#OUTPUT=$output.txt

#if [[ $OUTPUT == *"OK (2 tests)"* ]]; then
 #   echo "Tests passed successfully."
  #  echo "Grade: 100"
#else
     #echo "Tests did not pass as expected."
    # echo "Grade: 0"
 #fi


echo "this is the tail method output: $OUTPUT" #testing



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
