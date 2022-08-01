def q1(a = None , b = None, c = None ):
    import math
    try:
        a = int(a)
        b = int(b)
        c = int(c)
        d = (b**2) - (4 * a * c)
        if d > 0:
            x1 = (-b + math.sqrt(d))/ (2 * a)
            x2 = (-b - math.sqrt(d))/(2 * a)
            return "x1 is: {} x2 is {}".format(x1,x2)
        elif d==0 :
            x = -b/(2 * a)
            return "x is: {}".format(x)
        elif not(a is None and b is None and c is None ): return 'input error detected'
        else: return 'input error detected'

    except:
        return 'input error detected'




def q2(sentence, word, occurence):
    try:
        sentence=str(sentence.lower())
        word=str(word)
        occurence=int(occurence)

        if word not in sentence:
            return "could not find the word"
        elif sentence.count(word)<occurence:
            return "could not find the word in the specified occurrence"
        else:
            sentence = sentence.replace(word,word[::-1],occurence)
            sentence = sentence.replace(word[::-1],word,occurence-1)
            return sentence
    except:
        return "input error detected"

