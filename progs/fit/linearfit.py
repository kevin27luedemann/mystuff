# -*- coding: utf-8 -*-
# <nbformat>3.0</nbformat>

# <codecell>

import maabara as ma
import uncertainties as uc
import matplotlib as mp
import math
import numpy as np
import matplotlib.pyplot as plt
mp.rcParams['text.usetex']=True
mp.rcParams['text.latex.unicode']=True
plt.rc('text', usetex=True)
plt.rc('font', family='serif')
fig, ax = plt.subplots(figsize=(12,6))
ax.ticklabel_format(style='sci', axis='both', scilimits=(-3,3))
colors=['b','g','r','c','m','y','k']
fitcolors=['g','b','g','r','c','m','y','k']
datensaetze = np.genfromtxt('linearindex.txt',dtype='str', delimiter="\t")
print datensaetze
ax.set_xlabel(datensaetze[0,0],fontsize=16)
ax.set_ylabel(datensaetze[0,1],fontsize=16)
for i in range(len(datensaetze)-1):
    data=np.loadtxt(datensaetze[i+1,0])
    x1=data[:,0]
    y1=data[:,1]
    y_err1=data[:,2]
    m,b,tex=ma.linear_fit(x1,y1,y_err1)
    ax.errorbar(x1, y1, y_err1,ls='None',marker='+',color=colors[i+1], label=datensaetze[i+1,1])
    x = np.linspace(0,5)
    ax.plot(x, m.n*x+b.n,"r-", label ="$" + tex + "$",color=colors[i+1])
    plt.legend(loc=2)
plt.savefig("pl.pdf", transparent=True, format="pdf", bbox_inches='tight')

# <codecell>


