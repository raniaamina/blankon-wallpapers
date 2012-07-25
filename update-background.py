#!/usr/bin/env python

import glob

PREAMBLE = """<background>
<starttime>
    <year>2011</year>
    <month>11</month>
    <day>24</day>
    <hour>4</hour>
    <minute>00</minute>
    <second>00</second>
  </starttime>
  
  <!-- This animation will start at 4 AM. -->
"""

ENTRY = """  <static>
    <duration>10795.0</duration>
    <file>%(a)s</file>
  </static>
  <transition>
    <duration>5.0</duration>
    <from>%(a)s</from>
    <to>%(b)s</to>
  </transition>
"""

FOOTER = """</background>
"""

PATH='/usr/share/backgrounds/'

def main():
    images = glob.glob('*.png')
    m = len(images)

    output = ''
    output += PREAMBLE 
    for i in xrange(m):
        output += ENTRY % {'a': PATH + images[i], 'b': PATH + images[(i+1) % m]}
    output += FOOTER
    print output,

if __name__ == '__main__':
    main()
