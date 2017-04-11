# PSSPred

PSSPred is a a multiple neural network training program for protein secondary structure prediction

This repository contains the Docker instructions for creating a Docker Image.

**BEWARE! This image is something like 8GB in size**


## Usage:

PSSPred is a perl program which expects an input file as it's only input argument and will output a file: seq.dat.ss. That doesn't really work well for batch jobs so this Docker Image is constructed to accept a BASE64 encoded single hemoglobin sequence as the input argument like so:

```
$ cat sequence.fa | base64 | xargs docker run nerdalize/psspred 
```

What this line does:
* `cat` reads the input of sequence.fa and prints it to stdout
* `base64` base64-encodes that string, this is important, as otherwise the newlines will break things
* `xargs` takes that pipe, and turns it into an argument
* `docker run nerdalize/psspred` runs the docker image essentially like: `docker run nerdalize/psspred BASE64STRING`

In the run.sh script we write BASE64 --decode that input string and write it to the inputfile.

# ToDo:
(exercise for the reader)

- [ ] do something usefull with the output.
