import subprocess

# Define the path to the CIS-CAT tool
cis_cat_path = "C:\Program Files\CIS-CAT Pro\CIS-CAT.exe"

# Define the path to the benchmark XML file
benchmark_path = "C:\CIS_Windows_10_Benchmark.xml"

# Define the path to the output CSV file
output_path = "C:\CIS_Breakdown.csv"

# Run the CIS-CAT tool with the specified arguments
subprocess.run([cis_cat_path, "-a", "-f", "csv", "-b", benchmark_path, "-x", output_path])

# Print a message indicating that the report has been generated
print("CIS Breakdown report generated at " + output_path)
