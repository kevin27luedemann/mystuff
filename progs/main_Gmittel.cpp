#include <iostream>
#include <cmath>
#include <string>
#include <fstream>

using namespace std;

int main(){
int zahl=0;

ifstream out("GMittel.dat");

cout << "Wie viele Zahlen sollen gemittelt werden: ";
cin >> zahl;
double wert[zahl];
double fehler[zahl];
for(int i = 0; i <zahl;i++){
out >> wert[i] >> fehler[i];
}
double fehlersum = 0;
double wertsum = 0;
for(int i = 0; i < zahl; i++){
fehlersum += 1/(fehler[i]*fehler[i]);
wertsum += wert[i]/(fehler[i]*fehler[i]);
}
double gmittel = wertsum/fehlersum;
double gmittelfehler = sqrt(1/fehlersum);
cout 
	<< "Der gewichtete Mitelwert: " << gmittel
	<< " +- " << gmittelfehler << endl;


return 0;
}
