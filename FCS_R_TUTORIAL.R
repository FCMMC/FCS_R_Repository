#R can be used as a calculator
1+1
10*5
5^2
sqrt(16)
sum(1,3,5)

mean(1,3,5)#why doesn't this work?

example("mean")#or help("mean")

#We have to store our values in a variable

x<-c(1,3,5)
# or x = c(1,3,5)
# c(...,...) is storing things as a vector 
z<-c(2,1,3)

#what about this?
m<-c(5,2)
l<-c(9,5,7,2)

m / l
#looping rule, the smaller one(m) will simply repeat

m[2]
#index of m at the second position, index does NOT start at 0
l[c(2,3)]
l[1:4]

#matrices
A <- matrix(c(1,4,5,8,1,0,2,5,1), nrow=3, ncol=3, byrow = TRUE)

#or do it this way

B <- matrix(c(7,9,8,5,4,3,0,1,2), nrow=3, ncol=3) #Whats the difference? this fills by columns.

#Matrix specific operators
A*B
#what is wrong with this? R only multiplied corresponding positons in each matrix. If we want to do matrix muliplication we will need to do something different.

A %*% B

#Adding these percentage signs around our multiplication tells R that we want to do matrix multiplication.

#DATA FRAMES: how we store 2d arrays

Crypto_Prices <- data.frame(Currency = c("Bitcoin", "Ethereum", "Litecoin", "Ripple", "Tether"), Date = c("5.29.18","5.29.18","5.29.18","5.29.18","5.29.18"), Price_USD = c("7453", "565.21", "121.27", "0.599755", "1"), Percentage_Change = c("2.48", "5.08", "5.59", "2.72", ".16"), stringsAsFactors = FALSE)

#Here is the result
#    Currency  Date   Price_USD  Percentage_Change
#  1  Bitcoin 5.29.18      7453              2.48
#  2 Ethereum 5.29.18    565.21              5.08
#  3 Litecoin 5.29.18    121.27              5.59
#  4   Ripple 5.29.18  0.599755              2.72
#  5   Tether 5.29.18         1               .16

#Here is how to access the data in your new table
Crypto_Prices[3,"Price_USD"]
Crypto_Prices[3,3]
Crypto_Prices[,"Currency"]

#Here is how you can names rows
rownames(Crypto_Prices) <- c("BTC_stats", "ETH_stats","LTC_stats", "XRP_stats", "USDT_stats")

#Resulting table
#  Currency    Date Price_USD Percentage_Change
#  BTC_stats   Bitcoin 5.29.18      7453              2.48
#  ETH_stats  Ethereum 5.29.18    565.21              5.08
#  LTC_stats  Litecoin 5.29.18    121.27              5.59
#  XRP_stats    Ripple 5.29.18  0.599755              2.72
#  USDT_stats   Tether 5.29.18         1               .16

#Now we can do sonething like this:
Crypto_Prices["BTC_stats",]

#BINDINGS:attaching columns and rows
#to attach a column we use cbind, for a row we use rbind

Crypto_Prices <- cbind(Crypto_Prices, Market_Cap = c(127479431518,56382208235,6897943186,23538827383,2515965949))

#Result:
#  Currency    Date Price_USD Percentage_Change   Market_Cap
#  BTC_stats   Bitcoin 5.29.18      7453              2.48 127479431518
#  ETH_stats  Ethereum 5.29.18    565.21              5.08  56382208235
#  LTC_stats  Litecoin 5.29.18    121.27              5.59   6897943186
#  XRP_stats    Ripple 5.29.18  0.599755              2.72  23538827383
#  USDT_stats   Tether 5.29.18         1               .16   2515965949

#____________________________________________________________________________________
#SETTING WORKING DIRECTORIES AND IMPORTING DATA
#here is where things might bet confusing. We need to set a working directory so that our computer nows where to find the data files that we want to use.
#Lets say I want to get a ton of data about bitcoin. So I go and google "bitcoin data tables", I get data tables in CSV format. For reference I am going to be using this one:
#https://coinmetrics.io/data/btc.csv

#I download this file and then I move it into a folder on my computer. Specifically I have a folder on my Desktop called "Math Modeling" and inside that folder I have another one called "MMC R Programming".
#I place my "btc.csv" in that folder, now I want to get that csv into RStudio

#I need to set a working directory

setwd("~/Desktop/Math Modeling/MMC R Programming/")

#now I want to read the btc.csv
BTC_Data <- read.csv(file = "btc.csv")

#lets try and print that
BTC_Data

#         date txVolume.USD.     txCount marketcap.USD.  price.USD. exchangeVolume.USD. generatedCoins
# 2013-05-01   108659660         52443 1.54282e+09         139.00           0            3575.000      36.806000
# 2013-05-02    96958519         55169 1.29219e+09         116.38           0            3425.000      54.407916
# 2013-05-03    84459697         55636 1.18007e+09         106.25           0            3650.000      48.526772
# 2013-05-04    41545845         48595 1.08989e+09          98.10           0            3900.000      43.419694
# 2013-05-05    56205930         49907 1.25476e+09         112.90           0            3875.000      38.408956
# 2013-05-06    78921301         52523 1.28947e+09         115.98           0            4250.000      51.889244
# 2013-05-07   102307623         55899 1.24847e+09         112.25           0            4150.000      43.224939
# 2013-05-08    76523058         47555 1.21945e+09         109.60           0            4125.000      49.517169
# 2013-05-09    65430830         66750 1.25998e+09         113.20           0            4100.000      68.833585
# 2013-05-10    79216458         68957 1.25597e+09         112.80           0            4250.000      61.037740
# 2013-05-11    71755642         71712 1.31105e+09         117.70           0            4475.000      64.714460
# 2013-05-12    55128766         67439 1.28863e+09         115.64           0            4375.000      57.987171
# 2013-05-13    65533932         60443 1.27998e+09         114.82           0            4375.000      58.664512
# 2013-05-14    79193467         65458 1.31572e+09         117.98           0            3850.000      56.346231
# 2013-05-15    73852227         65045 1.24276e+09         111.40           0            3575.000      48.999993
# 2013-05-16    71605811         61462 1.27462e+09         114.22           0            3650.000      58.400102
# 2013-05-17    77916539         60388 1.31959e+09         118.21           0            4050.000      88.126697
# 2013-05-18    73842241         48290 1.37914e+09         123.50           0            3425.000      37.085732
# 2013-05-19    54051750         50416 1.37637e+09         123.21           0            4150.000      44.699754
# 2013-05-20    53907228         49435 1.36891e+09         122.50           0            3375.000      48.798962
# 2013-05-21    72897396         53176 1.36394e+09         122.02           0            3550.000      45.737421
# 2013-05-22    81312151         52952 1.37413e+09         122.89           0            4150.000      50.660918
# 2013-05-23    75067902         55582 1.38478e+09         123.80           0            4075.000      53.957413
# 2013-05-24    85631207         56521 1.41330e+09         126.30           0            4125.000      43.308242
# 2013-05-25    97944507         54128 1.48995e+09         133.10           0            4225.000      55.025102
# 2013-05-26    47608887         40435 1.47803e+09         131.99           0            4100.000      31.466089
# 2013-05-27    63370027         52244 1.49552e+09         133.50           0            4500.000      47.295026
# 2013-05-28    88677940         55119 1.45431e+09         129.77           0            3850.000      54.586213
# 2013-05-29    87817483         54862 1.44619e+09         129.00           0            4275.000      52.006689
# 2013-05-30    71751534         57928 1.48318e+09         132.25           0            4375.000      47.802791
# 2013-05-31    84137423         56274 1.44505e+09         128.80           0            4500.000      47.483031
# 2013-06-01    57393276         52487 1.44580e+09         128.81           0            5050.000      39.680316
# 2013-06-02    48943212         50171 1.45193e+09         129.30           0            5100.000      49.719347
# 2013-06-03    74752207         52867 1.37618e+09         122.50           0            5300.000      45.446423
# 2013-06-04    75782043         59408 1.35702e+09         120.74           0            5150.000      64.119033
# 2013-06-05    75897110         55162 1.36511e+09         121.40           0            4900.000      60.927658
# 2013-06-06    84057331         55800 1.37130e+09         121.90           0            4550.000      42.944486
# 2013-06-07    77218643         54517 1.33888e+09         118.97           0            4100.000      40.768891
# 2013-06-08    39000432         45646 1.24963e+09         111.00           0            4025.000      44.054121
# 2013-06-09    67382203         46443 1.21513e+09         107.89           0            4275.000      38.599997
# 2013-06-10    47427824         43927 1.13157e+09         100.44           0            4550.000      34.074021
# 2013-06-11    55910460         49796 1.19864e+09         106.35           0            4475.000      47.355719
# 2013-06-12    58102012         45093 1.22900e+09         109.00           0            4875.000      41.801324
# 2013-06-13    55310831         44612 1.22703e+09         108.78           0            4850.000      39.617841
# 2013-06-14    73432833         47915 1.17306e+09         103.95           0            4200.000      37.942653
# 2013-06-15    44710830         40041 1.12895e+09         100.00           0            4525.000      36.500987
# 2013-06-16    43401248         40072 1.12712e+09          99.80           0            4525.000      29.210243
# 2013-06-17    52096314         43885 1.12872e+09          99.90           0            3875.000      35.699435
# 2013-06-18    59990408         47281 1.15225e+09         101.95           0            3625.000      36.926759
# 2013-06-19    59871659         45754 1.21026e+09         107.05           0            3100.000      35.497690
# 2013-06-20    70777252         51920 1.22421e+09         108.25           0            3775.000      66.639407
# 2013-06-21    78192714         49830 1.25900e+09         111.29           0            4250.000      50.882586
# 2013-06-22    44194464         44645 1.23921e+09         109.50           0            4600.000      49.418856
# 2013-06-23    33785355         37641 1.22498e+09         108.20           0            4125.000      36.927359
# 2013-06-24    55297293         42878 1.22203e+09         107.90           0            3550.000      38.587077
# 2013-06-25    71810617         45161 1.15661e+09         102.09           0            3825.000      36.088719
# 2013-06-26    59575509         45351 1.17105e+09         103.33           0            4700.000      38.723405
# 2013-06-27    54399647         46332 1.17911e+09         104.00           0            4150.000      32.651566
# 2013-06-28    56222596         48777 1.15388e+09         101.74           0            4275.000      47.753150
# 2013-06-29    51465756         37949 1.07401e+09          94.66           0            3950.000      25.126189
# 2013-06-30    35102077         32088 1.07826e+09          95.00           0            3950.000      30.266362
# 2013-07-01    69693364         36031 1.10713e+09          97.51           0            3950.000      22.297464
# 2013-07-02    66987913         40821 1.00007e+09          88.05           0            3825.000      35.689641
# 2013-07-03    66147577         35507 1.02716e+09          90.41           0            4625.000      29.485236
# 2013-07-04    69718355         35434 8.96693e+08          78.89           0            4050.000      22.163515
# 2013-07-05    72605725         36450 9.09526e+08          79.99           0            4475.000      33.489146
# 2013-07-06    46067872         35431 7.79255e+08          68.50           0            4750.000      30.923589
# 2013-07-07    45065104         29566 7.82352e+08          68.75           0            4850.000      17.772530
# 2013-07-08    52820328         36817 8.70912e+08          76.50           0            4550.000      31.443420
# 2013-07-09    79071192         41049 8.65585e+08          76.00           0            4825.000      35.045851
# 2013-07-10    87506402         39922 8.74138e+08          76.72           0            4400.000      26.819688
# 2013-07-11    82079603         41158 1.00309e+09          88.00           0            4775.000      34.605906
# 2013-07-12    92748746         48827 1.01464e+09          88.98           0            4000.000      30.883806
# 2013-07-13    80625346         39681 1.07214e+09          93.99           0            3800.000      34.091458
# 2013-07-14    59303891         33651 1.12626e+09          98.70           0            4100.000      22.129731
# 2013-07-15    53011951         36473 1.06852e+09          93.61           0            4325.000      23.212566
# 2013-07-16    87183920         39230 1.12926e+09          98.89           0            4100.000      34.644591
# 2013-07-17    98355721         40548 1.10476e+09          96.71           0            4250.000      34.351752
# 2013-07-18    91390708         41363 1.12566e+09          98.50           0            4325.000      27.480213
# 2013-07-19    71516702         37055 1.02967e+09          90.07           0            4225.000      32.109671
# 2013-07-20    47272637         33811 1.05214e+09          92.00           0            4675.000      22.962900
# 2013-07-21    38996481         35263 1.02764e+09          89.82           0            4850.000      24.645349
# 2013-07-22    76097240         38203 1.05300e+09          92.00           0            4400.000      22.771257
# 2013-07-23    87407489         39152 1.04882e+09          91.60           0            3575.000      31.287147
# 2013-07-24    73335601         40214 1.09449e+09          95.56           0            3925.000      33.709486
# 2013-07-25    69612917         42235 1.08280e+09          94.50           0            3425.000      34.441983
# 2013-07-26    77430091         39901 1.11116e+09          96.95           0            4375.000      22.031092
# 2013-07-27    46317375         36626 1.10090e+09          96.02           0            4200.000      31.414786
# 2013-07-28    46260095         33147 1.08275e+09          94.40           0            4425.000      20.282783
# 2013-07-29    73084053         44648 1.13134e+09          98.60           0            4350.000      32.816041
# 2013-07-30    93788563         39903 1.16494e+09         101.49           0            4625.000      35.335218
# 2013-07-31    95006029         51580 1.23963e+09         107.95           0            4800.000      45.755850
# 2013-08-01   111688211         48467 1.22019e+09         106.21           0            4850.000      32.623435
# 2013-08-02    89328839         50759 1.20507e+09         104.86           0            4600.000      39.866445
# 2013-08-03    69416173         46711 1.20149e+09         104.50           0            4250.000      26.826708
# 2013-08-04    50902787         46054 1.20710e+09         104.95           0            4400.000      33.642380
# 2013-08-05    78367887         47983 1.20952e+09         105.12           0            4875.000      26.924111
# 2013-08-06    75090130         52043 1.22844e+09         106.72           0            4600.000      40.489776
# 2013-08-07    78682325         56974 1.22910e+09         106.75           0            4575.000      30.508631
# 2013-08-08    76623671         56992 1.22910e+09         106.75           0            5000.000      49.883660
# 2013-08-09    60415116         52486 1.18792e+09         103.07           0            5150.000      44.978112
# 2013-08-10    50118600         52316 1.18531e+09         102.80           0            4925.000      30.099042
# 2013-08-11    41627441         39459 1.18815e+09         103.00           0            5350.000      32.894323
# 2013-08-12    73357810         47995 1.21179e+09         105.00           0            5850.000      25.249871
# 2013-08-13   126851543         51711 1.23534e+09         106.99           0            4700.000      29.039626
# 2013-08-14   145433013         51140 1.26545e+09         109.56           0            3950.000      43.680512
# 2013-08-15    96013850         59689 1.30066e+09         112.56           0            4250.000      64.333942
# 2013-08-16   111881820         68632 1.27147e+09         110.00           0            4225.000      45.187865
# 2013-08-17   102312328         55848 1.26035e+09         108.99           0            4550.000      28.109461
# 2013-08-18    85606845         55561 1.30432e+09         112.75           0            5000.000      46.470741
# 2013-08-19   113913897         70647 1.31216e+09         113.38           0            4500.000      38.023688
# 2013-08-20   102914644         64526 1.37773e+09         119.00           0            4450.000      45.047360
# 2013-08-21   151306158         63259 1.40389e+09         121.21           0            5100.000      34.164278
# 2013-08-22    95899884         63946 1.42870e+09         123.30           0            5275.000      37.278706
# 2013-08-23    91981179         57493 1.41429e+09         122.00           0            5350.000      34.305416
# 2013-08-24    67674867         51291 1.37442e+09         118.51           0            4550.000      28.256227
# 2013-08-25    62957897         44977 1.38764e+09         119.60           0            3675.000      30.696720
# 2013-08-26    73281129         54694 1.41720e+09         122.11           0            4200.000      39.925373
# 2013-08-27    97871863         60616 1.39401e+09         120.07           0            4150.000      39.955138
# 2013-08-28    94526050         63043 1.46896e+09         126.48           0            4250.000     259.975744
# 2013-08-29    80774949         62066 1.42468e+09         122.62           0            5050.000      28.626384
# 2013-08-30    90460072         61509 1.42212e+09         122.35           0            4750.000      43.309190
# 2013-08-31    88483024         50294 1.54764e+09         133.09           0            5500.000      31.726396
# 2013-09-01    75934734         44861 1.57223e+09         135.14           0            5475.000      25.051464
# 2013-09-02    82816880         50603 1.61360e+09         138.63           0            5700.000      47.069206
# [ reached getOption("max.print") -- omitted 1729 rows ]

#So this file is so big that R wont print all of it

#if you want to view this csv file, go to the top of your screen hit 'File' then 'Open File', and search for 'btc.csv'.

#Now let's interact with this data

dim(BTC_Data)#this gives the dimensions of your data, btc.csv has dimensions of 1854 x 8

colnames(BTC_Data)
#This gives the column names of your data file, in the format which you have to use to reference in your code
#What I mean by this is in our data file we have a column titled "price(USD)". Parentheses are not allowed in column names, they will mess up our code
#so the system will lable that column "price.USD." even though it will not overwrite the csv file, that is how you will reference that file
#when you ask the system for colnames it will tell you that column is called "price.USD." so that is what you should call it aswell.

#R has this one built in function called summary(), which just gives a bunch of really basic statistics like min/max, mean, median etc.
summary(BTC_Data)

# date           txVolume.USD.       txCount          marketcap.USD.      price.USD.       
# Min.   :3.379e+07   Min.   : 29566   Min.   :7.793e+08   Min.   :   68.5   Min.   :0.000e+00  
# 1st Qu.:2.370e+08   1st Qu.: 72125   1st Qu.:4.051e+09   1st Qu.:  284.9   1st Qu.:1.727e+07  
# Median :6.543e+08   Median :155839   Median :7.218e+09   Median :  559.7   Median :4.870e+07  
# Mean   :2.611e+09   Mean   :162760   Mean   :3.036e+10   Mean   : 1861.3   Mean   :1.155e+09  
# 3rd Qu.:1.815e+09   3rd Qu.:233938   3rd Qu.:1.682e+10   3rd Qu.: 1045.7   3rd Qu.:2.286e+08  
# Max.   :4.835e+10   Max.   :490459   Max.   :3.261e+11   Max.   :19475.8   Max.   :2.384e+10  

# exchangeVolume.USD. generatedCoins               
# Min.   :1000        Min.   :   7.856     
# 1st Qu.:1988        1st Qu.:  15.468        
# Median :3550        Median :  35.065                 
# Mean   :3216        Mean   :  89.257                 
# 3rd Qu.:4050        3rd Qu.:  83.573                 
# Max.   :6450        Max.   :1495.947  

#_____________________________________________________________________________
#PLOTTING AND GRAPHING

#the most basic type of plot you can make in R is called a histogram:

hist(BTC_Data[,"marketcap.USD."])

#here is a histogram of the market cap in USD of our bitcoin data. This histogram is not particularly helpfulf in this scenario
#Histograms are helpful when you are trying to represent PROBABILITY FREQUENCIES WITHOUT RESPECT TO TIME. With bitcoin market caps, we have market caps that change over time so a histogram is not helpful

boxplot(BTC_Data[,"marketcap.USD."])
#This is a boxplot, it helps you to see the middle 50% of the data with respect to the entire set

boxplot(BTC_Data[,"marketcap.USD."] ~ BTC_Data[,"exchangeVolume.USD."])
#Use the ~ symbol to compare two boxplots on the same graph
#________________________________________________________________________________________


#GRAPHING CURVES AND OTHER THINGS
#you can obviously do "normal" types of graphing in R:
x <- -10:10
y <- (x^3)-5
plot(x,y, type ='l')

#plot() is a great function to use when plotting general lines, curves, and shapes.
plot(x,sin(.5*x), type = 'l', col = 'purple', lwd = 3 )

#IMPORTANT: If you want to save a plot you must use this code pair:
#png(file = "exampleplot.png")
#dev.off
#The png command comes before your plot and the dev.off comes after like this:

png(file = "exampleplot.png")

x <- -10:10
plot(x,sin(.5*x), type = 'l', col = 'purple', lwd = 3 )

dev.off
#now exampleplot.png is saved to my working directory, right next to btc.csv
#___________________________________________________________________________________________________________________________________
#PRACTICE PROBLEM FROM 2017 M3 COMPETITION
#Part 3 of the 2017 M3 competition asks contestants to determine where the NPS should allocate resources
#The logical of determining this is to determine which park is most valuable, one way of doing this is to determine how many
#visitors go to the park. Not only that but which parks have increased their visitor counts over the years?
#Which months are certain parks most visited and how should NPS resources be allocated with that in mind?

#YOUR JOB is to take this xlsx file:https://m3challenge.siam.org/sites/default/files/uploads/NPS_Visitor_Stats_1.xlsx
#convert it into csv(online converter), and make a variety of different graphs and statistics surrounding this data set

#YOUR GOAL is to describe, in some detail, how the NPS should allocate resources in the coming years.
