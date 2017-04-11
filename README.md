# PSSPred

PSSPred is a a multiple neural network training program for protein secondary structure prediction

This repository contains the Docker instructions for creating a Docker Image.

## Usage:

PSSPred is a perl program which expects an input file as it's only input argument and will output a file: seq.dat.ss

This Docker Image is constructed to accept a BASE64 encoded single hemoglobin sequence as the input argument like so:

```
$ cat sequence.fa | base64 | xargs docker run nerdalize/psspred 
```

In the run.sh script we write BASE64 --decode that input string and write it to the inputfile.
