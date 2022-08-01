import wikipedia
import csv
from tkinter import simpledialog
from tkinter import *
from tkinter import filedialog
import tkinter as tk
from tkinter import ttk


def popupmsg(msg, title):  # Function to popup our OUTPOT

    root = tk.Tk()
    root.title(title)  # Define the Title of the window
    root.geometry('1000x80')  # Define the windows size
    label = ttk.Label(root, text=msg)  # Creat a Lable
    label.pack(side="top", fill="x", pady=10)  # Creat the postion of the window
    B1 = tk.Button(root, text="Close", command=root.destroy)  # Define the Button in the window that close it
    B1.pack()
    root.mainloop()


def load_wikipedia_page(query):
    import re
    import string
    # import the wikipedia page text from the web
    try:
        page = wikipedia.page(query)  # Take the page with wikipedia library
        print("The Url of the web is : " + page.url)
        textW = page.content
        # print("Summary of the wikipedia page : \n " + page.summary)
        textW = textW.lower()
        textW = re.findall(r'\b\S+\b', textW)
        return textW

    except:
        print("Bad search name")


def load_idf_file(fileName):
    # load the csv file from out folder
    IDF = csv.reader(open(fileName, 'r'))
    return IDF


def most_occur_words(Text):
    from collections import Counter
    # counter the most occur words in out wikipedia page
    Counter = Counter(Text)
    mostOccur = Counter.most_common(15)
    return mostOccur


root = Tk()
root.wm_withdraw()

Query = simpledialog.askstring(title="Wikipedia Page", prompt="Insert Your Wikipedia page name ") # popup win that get the query
text = load_wikipedia_page(Query) # send the query to the function
most_occur = most_occur_words(text) # Find the most occure names in the text and count them
filename = filedialog.askopenfilename(title='Select The IDF file csv')
idf = load_idf_file(filename)

word_vector = []
tf = []
# make 2 vectors of our value : tf and the words
for value1 in most_occur:
    word_vector.append(value1[0])
    tf.append(int(value1[1]))

most_occur_dic = dict(zip(word_vector, tf)) # Creat a dict from this 2 vectors

# export the idf weight from our csv file
words_weight_idf = {}
for row in idf:
    if row[0] in word_vector:
        words_weight_idf[row[0]] = round(float(row[1]), 3)
        if row[0] not in word_vector:
            words_weight_idf[row[0]] = 0

tf_idf = {} # Calculate the IDF*TF
for key in most_occur_dic:
    value = most_occur_dic[key] * words_weight_idf[key]
    tf_idf[key] = round(value, 0)

tf_idf = sorted(tf_idf.items(), key=lambda x: x[1], reverse=True) # Sort the Dictonery
popupmsg(tf_idf , "The result of tf_idf keys in a dictionary is : ")
