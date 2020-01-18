
# Source: https://www.zjzs.net/moban/index/402848536bab8311016bfe0466c600a8.html
# Problems:
# 1. Remove comments at the bottom '注' (endnotes).
# 2. Generate a new table counting how many positions are universities in each province enrolling,
#    based on '学校代号' (University Code) (whose first two digits represent province)
#    and '计划数' (number of enrolling).
# 3. Add a column '是否双一流' (whether entitled as "Top-Ranked" by Ministry of Education),
#    based on information provided in the '学校名称' (University Name) column.
# 4. Modify column '学校名称' (University Name): delete their "Top-Ranked" honors tags in the name
# 5. Fill the missing value (blanks) in the Column '位次' (Ranking) with 53225,
#    which is the total number of exam candidates in this admission round.
# 6. Calculate '百分位' (Percentile) based on '位次' (Ranking) and total number of candidates.
# 7. Extract the major entry with lowest admission line of each university.
# 8. Remove columns '专业代号' (Major Code), '专业名称' (Major Name), '计划数' (Admission number).


province_code={'00':'Zhejiang','01':'Zhejiang','02':'Zhejiang',
               '11':'Beijing','12':'Tianjin','13':'Hebei','14':'Shanxi','15':'Inner Mongolia',
               '21':'Liaoning','22':'Jilin','23':'Heilongjiang',
               '31':'Shanghai','32':'Jiangsu','33':'Jiangsu','34':'Anhui','35':'Fujian','36':'Jiangxi','37':'Shandong',
               '40':'Hubei','42':'Henan','43':'Hunan','44':'Guangdong','45':'Guangxi','46':'Hainan',
               '50':'Chongqing','51':'Sichuan','52':'Guizhou','53':'Yunan',
               '61':'Shaanxi','62':'Gansu','63':'Qinghai','64':'Ningxia','65':'Xinjiang',
               '90':'Shanghai'}
honor_tag=('(一流大学建设高校)','(一流学科建设高校)')

try:
    fi=open('浙江省2019年普通高校招生普通类平行投档（一段）分数线.csv','r',encoding='utf-8')
except Exception as err:
    print('File open failed.')
    print(err)
else:
    fo1=open('Province_Distribution.csv','w')
    fo2=open('Data_Cleaned.csv','w',encoding='utf-8')
    lines=fi.readlines()
    print('{} lines read.'.format(len(lines)))
    title_printed=False
    lines_printed=0
    d={} # dicitonary used to store the province distribution
    u={} # dictionary used to store the lowest admission line for each university
    index_dict={}
    for line in lines:
        if '学校代号' in line and title_printed==False: # read the title line
            lines_printed+=1
            title_printed=True
            lineList=line.split(',')
            # Problem 8
            for item in ('专业代号','专业名称','计划数'):
                index_dict[item]=lineList.index(item)
                lineList.remove(item)
            lineList.insert(2,'是否双一流')
            lineList[-1]=lineList[-1].replace('\n','')
            lineList.append('百分位')
            fo2.write(','.join(lineList)+'\n')
        elif line[0].isdigit(): # read data entries
            lines_printed+=1
            lineList=line.split(',')
            univ=lineList[0]
            # Problem 5
            if eval(lineList[-2])==595 and len(lineList[-1])<5:
                lineList[-1]='53225'
            if lineList[-1].endswith('\n'):
                lineList[-1]=lineList[-1][0:-1]
            # Problem 6
            percentile=(1-eval(lineList[-1])/53225.0)*100
            lineList.append(str(percentile))
            # count distribution for Problem 2
            prov=province_code[univ[0:2]]
            d[prov]=d.get(prov,0)+int(lineList[4])
            # Problem 8
            for index in sorted(list(index_dict.values()),key=lambda x:x,reverse=True):
                del lineList[index]
            # Problems 3 and 4
            top_ranked='No'
            for honor in honor_tag:
                if honor in lineList[1]:
                    top_ranked='Yes'
                    lineList[1]=lineList[1].replace(honor,'') # remove honor tag
            lineList.insert(2,top_ranked)
            # Problem 7
            current_percentile=eval(lineList[-1])
            previous=u.get(univ,['101'])
            if current_percentile < eval(previous[-1]):
                u[univ]=lineList
        else: # Problem 1
            pass
    print('{} lines printed to file 2.\n'.format(lines_printed))
    
    fo1.write('Province,Number of Admission Positions\n')
    ls=sorted(list(d.items()),key=lambda x:x[1],reverse=True)
    for item in ls:
        province,number=item
        fo1.write('{},{}\n'.format(province,number))
    
    lt=sorted(list(u.values()),key=lambda x:eval(x[-1]),reverse=True)
    for entry in lt:
        fo2.write(','.join(entry)+'\n')

    fo2.close()
    fo1.close()
    fi.close()

