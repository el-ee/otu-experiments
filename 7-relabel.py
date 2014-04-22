# making a new copy of all_samples.fasta that adds to the label line, which looks like: 
# >M02233:23:000000000-A75VJ:1:1101:17702:1747 1:N:0:10
# so that it looks like: 
# >M02233:23:000000000-A75VJ:1:1101:17702:1747 1:N:0:10;barcodelabel=S10
# where barcode label is S (for sample) + the number after the last : (this is the sample number that this read came from)

# this extra step is to be able to use the usearch python script for creating an otu table
# seems easier than re-parsing the .uc file myself

outfile = open("all-samples/all_samples_labeled.fasta", "a")

with open('all-samples/all_samples.fasta', 'rb') as samplefile:
	for line in samplefile:
	# for i in range(0,8):
		# line = samplefile.readline()
		if line.startswith('>'):
			values = line.split(':')
			newline = line.strip("\n") + ";barcodelabel=S" + values[len(values)-1]
			outfile.write(newline)
		else:
			outfile.write(line)
			
outfile.close()

