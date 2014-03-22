from PIL import Image
from PIL import ImageDraw
f=open('data.csv','w')
f.write('No.')
f.write(', File Name')
f.write(', Status')
f.write(', Serial No.')
for i in range(1,26):
	z=(', A{}').format(i)
	f.write(z)
for i in range(1,26):
	z=(', B{}').format(i)
	f.write(z)

for m in range(1,51):
	if m<10:
		dup=('OMR\scan000{}.jpg').format(m)
	else:
		dup=('OMR\scan00{}.jpg').format(m)
	im = Image.open(dup)
	f.write('\n')
	r=im.getpixel((248,466))
	b=15
	dec=0
	j=223
	while b >= 0:
		mean=0.0
		n=j
		while j <= n+43 :
			r = im.getpixel((j,348))
			mean = mean + r/45
			j=j+1;	
		if mean < 135 :
			dec = dec + pow(2,b)
		else :
			dec = dec + 0
		b=b-1	
	f.write(str(m))
	f.write((', scan{}').format(m))
	f.write(', OK, ')
	f.write(str(dec))
	y=551
	for i in range(1, 26):
		k=367
		count=0
		for j in range(1,6):
			mean=0.0
			n=k
			while k <= n+45 :
				r=im.getpixel((k,y))
				mean=mean+r/46
				k=k+1
			if mean < 180 :
				a=chr(64+j)
				count=1
				f.write((', {}').format(a))
				
		if count==0 :
			f.write(', none')
			
		y=y+60

	y=551
	for i in range(1,26):
		k=1084
		count=0
		for j in range(1,6):
			mean=0.0
			n=k
			while k <= n+45:
				r=im.getpixel((k,y))
				mean=mean+r/46
				k=k+1
			if mean < 180:
				a=chr(64+j)
				count=1
				f.write((', {}').format(a))
		if count==0:
			f.write(', none')
		y=y+59
print("shubham")