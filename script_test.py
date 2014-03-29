import string
import random
import time
import subprocess
import os
import sys
import getopt

PYGAL_OK = True

#Pygal is a free package for creating charts. It's not natively installed, so
#if you don't get it no chart will be generated
try:
    import pygal #Use to draw charts
except ImportError, e:
    PYGAL_OK = False
    print("\nYou don't have the package Pygal to generate chart. Install it or no charts will be generated\n")
    pass

PROGRAM = "./words"
WORD_RANGE = [10000,50000,100000,250000,500000,750000,1000000]
MAX_SIZE_WORD = 20

# Display help menu
#----------------------------------------------------------------------
def display_help():
    print()
    print("--------- Algo test script ----------")
    print("Semester 2 - Project 1")
    print()
    print("Author : EMMANUEL Baptiste & GELPE Mathieu")
    print("-------------------------------------")
    print()
    print("Usage : ")
    print("-h, --help                       Display help")
    print("-s, --max_size=20                Maximum word's size to test. Equal 20 by default")
    print()
#----------------------------------------------------------------------


# Create a random string from lowercase characters
#-----------------------------------------------------------------------
def string_generator(size):
    return ''.join(random.choice(string.ascii_lowercase) for _ in range(size))
#-----------------------------------------------------------------------



#----------------- MAIN SCRIPT -----------------------------------------

# Get arguments from command line
try:
    opts, args = getopt.getopt(sys.argv[1:], "hs:", ["help","max_size"])
except getopt.GetoptError as err:
    print(err)
    display_help()
    sys.exit(2)

#Analyze arguments from commande line
for o,a in opts:
    if o in ("-h", "--help"):
        display_help()
        sys.exit(2)
    elif o in ("-s", "--max_size"):
        MAX_SIZE_WORD = int(a)
    else:
        print("Option {} unknown".format(o))
        sys.exit(2)

tab_results = []

for words_number in WORD_RANGE:
    tab_times = []
    for i in range(1,MAX_SIZE_WORD):
    
        #Generate WORD_NUMBER words of i size
        #When WORD_NUMBER is big this function could take a lot of time
        tab_words = [string_generator(i) for _ in range (0,words_number)]
        
        #Create file to write words
        file_tmp = open("tmp.txt","w")
        for word in tab_words:
            file_tmp.write("%s\n" % word)
        file_tmp.close()
        
        #Start the program
        start = time.time()
        subprocess.call([PROGRAM,"<","tmp.txt",">","/dev/null"], shell=True);
        end = time.time()
        tab_times.append((end - start) * 1000)
        os.remove("tmp.txt")
        
    tab_results.append(tab_times)
    print("DONE : %d words" % words_number)

if PYGAL_OK:
    #Draw the chart
    line_chart = pygal.Line(show_dots=False, x_title="Word length", y_title="Time (ms)")
    line_chart.title = 'Time to find a word according to its length'
    line_chart.x_labels = map(str, range(1,MAX_SIZE_WORD))
    for i in range(0,len(tab_results)):
        line_chart.add(str(WORD_RANGE[i]), tab_results[i])
    line_chart.render_to_file('graph_test.svg')
    print("DONE : Chart graph_test.svg generated")
    subprocess.call(["inkscape graph_test.svg"], shell=True)
else:
    print("No charts generating because Pygal is missing")
#---------------END SCRIPT --------------------------------------------
