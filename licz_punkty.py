import random

def policz_punkty_za_skok(odleglosc, wiatr, punkty_konstrukcyjne, noty):
    punkty_skok = 60 + (odleglosc - punkty_konstrukcyjne) * 1.8 if odleglosc > punkty_konstrukcyjne else (
        60 - (punkty_konstrukcyjne - odleglosc) * 1.8 if odleglosc < punkty_konstrukcyjne else 60)
    suma_punktow = punkty_skok

    # Odrzucenie dwóch skrajnych not od 1 do 5
    noty = noty[:5]
    noty.remove(min(noty))
    noty.remove(max(noty))
    suma_not = sum(noty)
    suma_punktow += suma_not + wiatr
    suma_punktow = round(suma_punktow, 1)
    
    if suma_punktow < 0:
        suma_punktow = 0
    return suma_punktow

while True:
    columns = ['ID_Zawodow', 'ID_Skoczka', 'ID_Skoczni', 'Odleglosc1', 'Odleglosc2']
    columns += [f'Nota{i}' for i in range(1, 11)]
    columns += ['Wiatr1', 'Wiatr2', 'Punkty']

    dane = []

    # Umożliwienie użytkownikowi wprowadzenia punktu konstrukcyjnego
    punkty_konstrukcyjne = float(input("Podaj punkt konstrukcyjny: "))

    # Umożliwienie użytkownikowi wprowadzenia danych
    odleglosc1 = float(input("Podaj odległość skoku 1: "))
    odleglosc2 = float(input("Podaj odległość skoku 2: "))
    noty = [float(input(f"Podaj notę {i}: ")) for i in range(1, 11)]
    wiatr1 = float(input("Podaj siłę wiatru dla skoku 1: "))
    wiatr2 = float(input("Podaj siłę wiatru dla skoku 2: "))

    # Obliczanie punktów za skoki na podstawie podanych przez użytkownika danych
    punkty_skok_1 = policz_punkty_za_skok(odleglosc1, wiatr1, punkty_konstrukcyjne, noty)
    punkty_skok_2 = policz_punkty_za_skok(odleglosc2, wiatr2, punkty_konstrukcyjne, noty)

    # Wyświetlenie punktów
    print(f"Punkty za skok 1: {punkty_skok_1}")
    print(f"Punkty za skok 2: {punkty_skok_2}")
    print(f"Suma punktów: {punkty_skok_1 + punkty_skok_2}")

    # Wybór użytkownika
    print("\nCzy chcesz powtórzyć operację?")
    print("1. Tak")
    print("2. Wyjdź z programu")
    wybor = input("Twój wybór: ")

    if wybor == "1":
        continue  # Kontynuuj pętlę, aby wykonać operację ponownie
    elif wybor == "2":
        break  # Zakończ pętlę while, kończąc program
    else:
        print("Niepoprawny wybór. Spróbuj ponownie.")
