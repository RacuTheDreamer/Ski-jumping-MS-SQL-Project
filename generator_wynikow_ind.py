import random
import csv

# Wrzucenie do słownika przedziałów odległości, na którą mogą latać zawodnicy na danych skoczniach 
przedzialy_odleglosci = {
    1: (118, 142),
    2: (120, 140),
    3: (122, 140),
    4: (122, 140),
    5: (118, 137),
    6: (122, 142),
    7: (118, 128),
    8: (122, 142),
    9: (118, 134),
    10: (93, 106),
    11: (122, 140),
    12: (125, 147),
    13: (113, 128),
    14: (120, 137),
    15: (190, 235),
    16: (114, 130),
    17: (118, 134),
    18: (122, 140),
    19: (190, 244),
    20: (190, 244)
}

# Przypisanie punktów konstrukcyjnych każdej ze skoczni, która potem ma wpływ na wyliczanie punktów za oddane skoki
punkty_konstrukcyjne = {
    1: 120,  
    2: 123,
    3: 125,  
    4: 125,
    5: 120,  
    6: 125,
    7: 120,  
    8: 125,
    9: 120,  
    10: 95,    
    11: 125,  
    12: 130,
    13: 115,  
    14: 123,
    15: 200,  
    16: 116,
    17: 120,  
    18: 124,
    19: 200,
    20: 200    
}

# Generowanie losowych odległości i wrzucenie ich do listy

def oblicz_skok(skocznia):
    
    przedzial_odleglosci = przedzialy_odleglosci.get(skocznia, None)
    
    if przedzial_odleglosci is None:
        wielkosc_skoczni = skocznia * 5  # Zakładam, że przedziały będą zależne od skoczni
        przedzial_odleglosci = (wielkosc_skoczni * 0.5, wielkosc_skoczni * 0.5 + 10)

    # Generowanie odległości, uwzględniając tylko wartości całkowite i połówki
    odleglosc = round(random.uniform(*przedzial_odleglosci) * 2) / 2
    noty = [random.choice([17, 17.5, 18, 18.5, 19, 19.5, 20]) for _ in range(5)] 
    wiatr = round(random.uniform(-7, 7), 1)

    return [odleglosc] + noty + [wiatr]

def policz_punkty_za_skok(odleglosc, wiatr, skocznia, noty):

    punkty_skok = 60 if odleglosc == punkty_konstrukcyjne[skocznia] else (
        (odleglosc - punkty_konstrukcyjne[skocznia]) * 1.8 + 60 if odleglosc > punkty_konstrukcyjne[skocznia] else (
            60 - (punkty_konstrukcyjne[skocznia] - odleglosc) * 1.8 if odleglosc < punkty_konstrukcyjne[skocznia] else 60))
    suma_punktow = punkty_skok

    # Odrzucenie dwóch skrajnych not od 1 do 5
    noty = noty[:5]
    noty.remove(min(noty))
    noty.remove(max(noty))
    suma_not = sum(noty)
    suma_punktow += suma_not + wiatr
    suma_punktow = round(suma_punktow, 1)
    
    return suma_punktow

# Tworzenie ramki danych
columns = ['ID_Zawodow', 'ID_Skoczka', 'ID_Skoczni', 'Odleglosc1', 'Odleglosc2' ]
columns += [f'Nota{i}' for i in range(1, 11)]
columns += ['Wiatr1', 'Wiatr2', 'Punkty']



dane =  []

# Dane dotyczące skoczni, skoczków i zawodów
SKOCZNIA_SEKWENCJA = [1, 1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18, 19, 19, 20, 20, 20]
ZAWODY = [zawod for zawod in range(1, 36)]
EXLUDING = [15, 25, 34]

for zawody, skocznia in zip(ZAWODY, SKOCZNIA_SEKWENCJA): 
    if zawody in EXLUDING:
        continue
    #zawdoy
    wyniki = []
    indeky = {}
    # skok1
    skoczkowie = list(range(1, 51))
    for skoczek in skoczkowie:
        odleglosc, nota1, nota2, nota3, nota4, nota5, wiatr = oblicz_skok(skocznia)
        punkty = round(policz_punkty_za_skok(odleglosc, wiatr, skocznia, [nota1, nota2, nota3, nota4, nota5]))
        wiersz = [zawody, skoczek, skocznia, odleglosc, 0, nota1, nota2, nota3, nota4, nota5, 0, 0, 0, 0, 0, wiatr, 0, punkty]
        key = (zawody, skoczek, skocznia)
        indeky[key] = len(wyniki)
        wyniki.append(wiersz)
    #skok2
    top_30 = sorted(wyniki, key=lambda x: x[-1], reverse=True)[:30]
    top_skoczkowie = [wiersz[1] for wiersz in top_30]
    for skoczek in skoczkowie:
        odleglosc, nota1, nota2, nota3, nota4, nota5, wiatr = oblicz_skok(skocznia)
        punkty = round(policz_punkty_za_skok(odleglosc, wiatr, skocznia, [nota1, nota2, nota3, nota4, nota5]))
        key = (zawody, skoczek, skocznia)
        index = indeky[key]
        wyniki[index][4] = odleglosc
        wyniki[index][10] = nota1
        wyniki[index][11] = nota2
        wyniki[index][12] = nota3
        wyniki[index][13] = nota4
        wyniki[index][14] = nota5
        wyniki[index][16] = wiatr
        wyniki[index][17] += round(punkty)
    # sort
    wyniki = sorted(wyniki, key=lambda x: x[-1], reverse=True)

    dane.extend(wyniki)


with open('dane_odleglosci.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(columns)
    writer.writerows(dane)
