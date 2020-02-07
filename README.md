# Enigma

![Enigma Cracking](https://user-images.githubusercontent.com/38663414/74063417-49f11c80-49e8-11ea-9ac8-80ce62353332.gif)

## Description

A series of encryption cracking algorithms designed to mimic Alan Turing's cracking of the German Enigma Machine in World War 2.

This was done as a solo project over a one week period.

## Purpose

The purpose of Enigma was to get practice with the fundamentals of test driven development and object oriented programming as well to practice file input and output with Ruby.

## Use

This application comes with a series of command line tools that will be used to encrypt and decrypt a message.

Update the `message.txt` file with the message you would like to either encode or decode. You can then encrypt the message or decrypt the message by using the appropriate command line prompt.

The first command line uses `encrypt.rb` and takes two command line arguments. The first is an existing file that contains a message to encrypt. The second is a file where your program should write the encrypted message

The second command line prompt uses `decrpyt.rb` and takes four command line arguments. The first is the path and name of an existing file that contains an encrypted message. The second argument is a file path and name where the program should write the decrypted message. The third is the key to be used for decryption and the fourth argument is the date to be used for decryption.

An example of command line prompt use and output is as follows:
```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
Created 'decrypted.txt' with the key 82648 and date 240818
```

## Installation

1. Clone down the the repo using `git clone git@github.com:BabsLabs/enigma.git`
1. Change into the project directory
1. That’s it!

## Technologies
1. Ruby
1. File IO
1. Minitest
1. Mocha
1. SimpleCov

## Testing

All testing was done with Minitest. Some test features were mocked with the Mocha mocking and stubbing library. Test coverage was monitored by SimpleCov.

### Running tests

To run tests use the `ruby test/<PATH_TO_TEST>` formula.

#### Testing Notes
1. Running the `test/crack_test.rb` file will result in the computer trying to crack the Enigma code. This can take an unknown amount of time and is a very CPU intensive process. To cancel a test when in progress use the `^ + C` command.
1. The `test/enigma_test.rb` file will need to be updated with the current date to properly pass. Please see the comments in the test file for more information.