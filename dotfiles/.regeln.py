#!/usr/bin/python
# -*- coding: utf-8 -*-

regeln = [
#1
    "Nur unmöglich ist unmöglich;\n\tGibt niemals auf, aber akzeptiere die Niederlage",
#2
    "Vertraue deinem Instinkt/Herzen",
#3
    "Kein Stress nach Acht",
#4
    "Um die richtige Antwort zu erhalten muss man die richtige Frage stellen (#42b)",
#5
    "Genieße solange du kannst und lass los",
#6
    "Die Familie ist das wichtigste(unspoken)",
#7
    "",
#8
    "",
#9
    "",
#10
    "",
#11
    "",
#12
    "",
#13
    "",
#14
    "",
#15
    "",
#16
    "",
#17
    "",
#18
    "Es ist besser um Vergebung bitten, als um Erlaubnis zu fragen (#18)"
    ]

def print_all_rules(rules):
    i = 1
    for rule in rules:
        print "Regel {}:".format(i)
        print "\033[31m"+"\t"+rule + "\033[0m"
        i += 1

def print_rule(number,rules):
    n = len(rules)
    if number > n:
        print "Keine Regel fuer Nummer {}".format(number)
    else:
        print "Regel {}:".format(number)
        print "\033[31m"+"\t"+rules[number-1] + "\033[0m"

def main():
    print_all_rules(regeln)

if __name__ == "__main__":
    main()
