data = open("account_data.txt", "r")

d = dict()
for line in data:
    line = line.rstrip()
    key =line.split()[4:]
    d[key[0]] = int(line.split()[3]),list(line.split()[0:3])


def checkPass(count = 0):
    while count < 3:
        try:
            name = str(input('pleas enter your name: '))
            passowrd = int(input('pleas enter your password: '))
            if name in d.keys() and d[name][0] == passowrd:
                return print(d[name][1])

            elif not (name in d.keys() and not d[name] == passowrd):
                    count += 1
                    if count < 3:
                        print('user name or password are incorrect')
                    elif count == 3:
                        print("You are blocked!!!, try again later")
        except :
            count +=1
            if count < 3 :print('user name or password are incorrect')
            if count ==3 :print("You are blocked!!!, try again later")
checkPass()