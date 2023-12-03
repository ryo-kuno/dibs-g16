from rdkit import Chem
from rdkit.Chem import AllChem
import openbabel
import sys

def smiles_to_gaussian_input(smiles, method, basis_set, filename):
    # Convert SMILES to RDKit molecule and generate 3D coordinates
    mol = Chem.MolFromSmiles(smiles)
    mol = Chem.AddHs(mol)
    AllChem.EmbedMolecule(mol, AllChem.ETKDG())
    AllChem.UFFOptimizeMolecule(mol)

    # Convert RDKit molecule to Open Babel molecule
    obConversion = openbabel.OBConversion()
    obConversion.SetInAndOutFormats("mdl", "gjf")
    obMol = openbabel.OBMol()
    obConversion.ReadString(obMol, Chem.MolToMolBlock(mol))

    # Write to Gaussian input file
    with open(filename, 'w') as file:
        file.write(f"%chk={filename}.chk\n")
        file.write(f"# {method}/{basis_set}\n\n")
        file.write(f"Title Card Required\n\n")
        file.write(f"0 1\n")  # You might want to modify charge and multiplicity
        file.write(obConversion.WriteString(obMol))
        file.write("\n")

# Example usage
if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("Usage: python script.py <SMILES> <method> <basis_set> <output_filename>")
        sys.exit(1)

    smiles_string = sys.argv[1]
    method = sys.argv[2]
    basis_set = sys.argv[3]
    output_filename = sys.argv[4]

    smiles_to_gaussian_input(smiles_string, method, basis_set, output_filename)
    print(f"Gaussian input file generated: {output_filename}")

