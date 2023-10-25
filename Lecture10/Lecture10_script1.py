#!/usr/bin/python3
my_dna = "ACTGATCGATTACGTATAGTATTTGCTATCATACATATATATCGATGCGTTCAT"
at_content = (my_dna.count('A') + my_dna.count('T')) / len(my_dna)
print("A+T content is",str(int(100*at_content)),"percent")

replacement1 = my_dna.replace('A', 't')
replacement2 = replacement1.replace('T', 'a')
replacement3 = replacement2.replace('C', 'g')
replacement4 = replacement3.replace('G', 'c')
print("The complement sequence is " + str(replacement4.upper()))

frag1_length = my_dna.find("GAATTC") + 1
frag2_length = len(my_dna) - frag1_length
print("Length of fragment one is " + str(frag1_length))

exon1 = my_dna[0:63]
exon2 = my_dna[90:]
print("### Exons joined ###\n" + exon1 + exon2)
coding_length = len(exon1 + exon2)
total_length = len(my_dna)
print("### Coding percentage (rounded) ###\n" + str(int((coding_length / total_length) * 100)))

