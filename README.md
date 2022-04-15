# Juggler - Password Generator

Juggler is a password generator and our goal is to analyze and create algorithms to crate great passwords for each situation.

Now, we have just one method of generating passwords, this one is easy to record but hard to brute force it, it consists in a phrase generated with random words. For example:

> metfinestoedipusbimestrialpiscatory (or "met finest oedipus bimestrial piscatory", 26^35)

## Usage Example
```
$ python main.py --min=32 -Ll
```

<!--

This is a 35 length password using just lowercase letters, which that the 
## How to use it

First, install the required packges.
```
pip install -r requirements.txt
```
-->
## Parameters
See some of the parameters you can pass in order to generate the best password for you.

```

-count=<int>     How many words it must have, default is False.

--min=<int>      Minimum size of the password, default is 20.

--max=<int>      Maximum size of the password, default is 40.

--mult=<int>     If you want to generate more than one password, default is 1. (to be implemented)

-space           Add blank spaces between words, default is False.

-stats           Show statitics about the password, default is False. (to be implemented)


Capitalization (Default is -ll):

-ll              all letters lowercased
-Ll              Capitalized Words
-lL              aLL lETTERS uPPERCASED bESIDES tHE fIST oF eACH wORD
-LL              ALL LETTERS UPPERCASED
-lS              cAmEl CaSeD WoRdS


Language Options(Default is english):

-br              Português

```