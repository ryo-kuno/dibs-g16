from rdkit import Chem
from rdkit.Chem import AllChem

# Create a molecule from a SMILES string
smiles = 'CCO'  # ethanol as an example
molecule = Chem.MolFromSmiles(smiles)

# Add hydrogens
molecule = Chem.AddHs(molecule)

# Use RDKit to optimize the molecule's geometry
AllChem.EmbedMolecule(molecule)
AllChem.UFFOptimizeMolecule(molecule)

# Generate the Gaussian input file data
num_atoms = molecule.GetNumAtoms()
gaussian_input = "%chk=molecule.chk\n%nprocshared=4\n%mem=1GB\n#p opt hf/6-31g(d)\n\nTitle Card Required\n\n0 
1\n"

# Loop over each atom to get its type and coordinates
for atom in molecule.GetAtoms():
    pos = molecule.GetConformer().GetAtomPosition(atom.GetIdx())
    gaussian_input += "{0}   {1:.4f}   {2:.4f}   {3:.4f}\n".format(atom.GetSymbol(), pos.x, pos.y, pos.z)

# Add the end of file line
gaussian_input += "\n"

# Write the Gaussian input file
with open('molecule.gjf', 'w') as file:
    file.write(gaussian_input)

print("Gaussian input file created as molecule.gjf")

