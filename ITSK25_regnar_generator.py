import random

while True:
    try:
        size = int(input("Sisesta maatriksi suurus (3-10): "))
        if 3 <= size <= 10:
            break
        else:
            print("Lubatud on ainult vahemik 3-10.")
    except ValueError:
        print("Palun sisesta arv.")

matrix = []

for i in range(size):
    row = []
    for j in range(size):
        number = random.randint(1, 99)
        row.append(f"{number:02}")
    matrix.append(row)

with open("output.txt", "w") as file:
    for row in matrix:
        file.write(" ".join(row) + "\n")

print("Valmis. Fail output.txt on loodud.")
