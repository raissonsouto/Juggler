from random import randint
import sys

print('')
parameters = sys.argv[1::]

min_size = 20
max_size = 40
words_count = 4
multiple = 1 #todo

language = "languages/english.txt"
words_format = "ll"

space = False
stats = False

for parameter in parameters:

    if parameter.startswith('--min='):
        min_size = int(parameter.split('=')[1])

    elif parameter.startswith('--max='):
        max_size = int(parameter.split('=')[1])

    elif parameter.startswith('-count='):
        words_count = int(parameter.split('=')[1])
    
    elif parameter == '-space':
        space = True

    elif parameter == '-stats':
        stats = True

    elif parameter == '-LL':
        words_format = "LL"

    elif parameter == '-Ll':
        words_format = "Ll"

    elif parameter == '-lL':
        words_format = "lL"

    elif parameter == '-ls':
        words_format = "ls"

    elif parameter == '-br':
        language = "languages/portugues.txt"

    else:
        print('Parameter "' + parameter + '" not recognized.')
        sys.exit(0)


def wordFormat(format: str, word: str) -> str:

    if format == 'll':
        return word

    elif format == 'Ll':
        return word.capitalize()

    elif format == 'LL':
        return word.upper()

    elif format == 'lL':
        return word[0] + word[1::].upper()

    elif format == 'ls':
        return word #todo


def passwordGenerator(words_list, min_size, max_size, space, words_count, format):

    new_password = ''

    for _ in range(words_count):
        random_number = randint(0, len(words_list))
        
        new_password += wordFormat(format, words_list[random_number])

        if space:
            new_password += " "

    if len(new_password) > max_size or len(new_password) < min_size:
        return passwordGenerator(words_list, min_size, max_size, space, words_count, format)

    return new_password


with open(language, mode='r') as words:
    words_list = words.read().split('\n')
    password = passwordGenerator(words_list, min_size, max_size, space, words_count, words_format)

    print('Generated password: ' + password)
    
    if stats:
        print('Password length: ' + str(len(password)))
        #todo