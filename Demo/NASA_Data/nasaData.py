# Source: https://data.giss.nasa.gov/gistemp/tabledata_v3/SH.Ts+dSST.txt
import urllib.request
url = "https://data.giss.nasa.gov/gistemp/tabledata_v3/SH.Ts+dSST.txt"
try:
    response = urllib.request.urlopen(url)
    txt = response.read().decode('utf-8')
    # fi=open('nasaData.txt','r',encoding='utf-8')
except Exception as e:
    print('File failed to load.')
    print(e)
    exit()
else:
    fo=open('nasaDataAnalysed.csv','w')
    lines=txt.split('\n')
    # lines=fi.readlines()
    flag=True
    for line in lines:
        if line[0] in "12" or (flag and line[0] in 'Y'):
            flag=False
            lineList=line.split()
            for index in range(13):
                if(lineList[index].startswith('*')):
                    lineList[index]=""
            fo.write(",".join(lineList[0:13])+"\n")
        else:
            pass
    fo.close()
    # fi.close()
