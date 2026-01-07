import random  # kasutan juhuslike arvude loomiseks

# Kysin kasutajalt maatriksi suuruse
# lubatud on ainult 3 kuni 10
while True:
    try:
        size = int(input("Sisesta maatriksi suurus (3-10): "))
        if 3 <= size <= 10:
            break
        else:
            print("Lubatud on ainult vahemik 3-10.")
    except ValueError:
        print("Palun sisesta arv.")

# loon tyhja listi, kuhu hakkan maatriksit koguma
matrix = []

# loon maatriksi read ja veerud
for i in range(size):
    row = []
    for j in range(size):
        number = random.randint(1, 99)  # juhuslik arv 1-99
        row.append(f"{number:02}")      # teen alati kahekohaliseks (nt 01)
    matrix.append(row)

# kirjutan maatriksi faili output.txt
with open("output.txt", "w") as file:
    for row in matrix:
        file.write(" ".join(row) + "\n")

# annan kasutajale teada, et fail on valmis
print("Valmis. Fail output.txt on loodud.")
