#!/usr/bin/python

"""
Output lines selected randomly from a file

Copyright 2005, 2007 Paul Eggert.
Copyright 2010 Darrell Benjamin Carbajal.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Please see <http://www.gnu.org/licenses/> for a copy of the license.

$Id: randline.py,v 1.4 2010/04/05 20:04:43 eggert Exp $
"""

import random, sys
from optparse import OptionParser

class randline:
    def __init__(self, filename):
        f = open(filename, 'r')
        self.lines = f.readlines()
        f.close()

    def chooseline(self):
        return random.choice(self.lines)

def main():
    version_msg = "%prog 2.0"
    usage_msg = """%prog [OPTION] [OPTION] [OPTION]... FILE

Output randomly selected lines from FILE."""

    parser = OptionParser(version=version_msg,
                          usage=usage_msg)
    parser.add_option("-n", "--numlines",
                      action="store", dest="numlines", default=1,
                      help="output NUMLINES lines (default 1)")

    parser.add_option("-u", "--unique", action="store_true", dest="uVal", default=False, help="ignore duplicate lines in input")

    parser.add_option("-w", "--without-replacement", action="store_true", dest="wVal", default=True, help="output lines without replacement")

    options, args = parser.parse_args(sys.argv[1:])

    uBool = options.uVal #boolean value for unique
    wBool = options.wVal #boolean value for without replacement

    try:
        numlines = int(options.numlines)
    except:
        parser.error("invalid NUMLINES: {0}".
                     format(options.numlines))
    if numlines < 0:
        parser.error("negative count: {0}".
                     format(numlines))
    if len(args) != 1:
        parser.error("wrong number of operands")

    input_file = args[0]

    if (not uBool and not wBool): #only n option selected
	try:
		generator = randline(input_file)
	        for index in range(numlines):
	            sys.stdout.write(generator.chooseline())
        except IOError as (errno, strerror):
	        parser.error("I/O error({0}): {1}".
	                     format(errno, strerror))

    else:
	#try:
	generator = randline(input_file)

	if (uBool and self.lines):
		self.lines = list(set(self.lines)) #get rid of duplicates
		self.lines.sort() #sort them (optional)
		input_file = self.lines #set file to one with unique lines
	if wBool:
		if uBool and len(self.lines)<numlines:
			usage ("number of unique lines is insufficient")
		try:
			generator = randline(input_file) #reset it
			for i in range (numlines):
				chosenline = generator.chooseline()
				sys.stdout.write(chosenline)

				for j in range (len(self.lines)):
				#for every line in self.lines
		
					if self.lines[j]==chosenline:
					#delete that line; it's been discarded
						del self.lines[j]
		except IOError as (errno, strerror):
			parser.error("I/O error({0}): {1}".
					format(errno, strerror))
			

			

if __name__ == "__main__":
    main()
