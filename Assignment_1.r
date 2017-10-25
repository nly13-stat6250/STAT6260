#Assignment 1 (100 points) Due: Wednesday, October 25
#Email me one file. Do not use a “reply” to email your file. Use .R as the extension. The file name
#submitted by a student named Albert Einstein is AlbertEinsteinAssign1.R I should be able to load your
#code into the R environment by using the “Open Script” feature of R. Then I should be able to run your
#code. Put your name as the first line of your .R file. This will be a line that is executable, and look this:
#name = “Albert Einstein”. Of course your own name will be substituted for Albert Einstein. When I run
#tests on your code, I will want to know whose code is running. Your code should be well-commented,
#and indented so a reader can easily follow the code. Bring a print out of your file to class. Your one file
#should contain two functions.
#Use the function names and arguments indicated. DO NOT have any tests in your file. The only
#executable statement is the name = statement. Note that it is not Name =. Also make sure it is not a
#comment. Make sure your file does not produce a syntax error. Do not call the R sort() function, or any
#other sorting function in your code.

#1. Write a function that merges two already sorted vectors into a third sorted vector. The input
#vectors are sorted in ascending order. The function prototype is:
#merge.sort <- function(in1,in2).
 #Example: x = c(1,2,3,4) and y = c(1.5,3,5). Then z = merge.sort(x,y) results in z = c(1,1.5,2,3,3,4,5)
 
in1=c(2,4,6,8,10) #presorted vector 1
in2=c(1,3,5,7,9) #presorted vector 2
result=c()      #result of the merged vectors, currently empty

merge.sort=function (in1, in2) { #starts the function
  
  while (min(length(in1), length(in2)) > 0)  #begins to sort from both vectors, but some leftovers exist in both vectors
  {
    if (in1[1] < in2[1]) #put the smallest first element on the end #remove it from in1 or in2
    {
      result=c(result, in1[1])
      in1=in1[-1]
    }
    else
    {
      result=c(result, in2[1])
      in2=in2[-1]
    }
  } #end of which
  if (length(in1) > 0) #put the remaining values on the ends
  {
    result=c(result, in1)
  }
  else
  {
    result=c(result, in2)
  } 
} #end of function

while (min(length(in1), length(in2)) > 0) #run same which statement again, as result from previous run will generate 'null' 
{
  
  if (in1[1] < in2[1])
  {
    result=c(result, in1[1])
    in1=in1[-1]
  }
  else
  {
    result=c(result, in2[1])
    in2=in2[-1]
  }
} 
if (length(in1) > 0)
{
  result=c(result, in1)
}

print(result) #2nd run generates desired output

#2. Write a function that bins data. This is the kind of thing one does when making a histogram. We
#are given a data vector x, and a vector containing the boundary of the bins. This vector is called
#bins.
#Function prototype is:
#bin.data <- function(x,bins)
#Check that bins is strictly increasing. The bins are open on the left and closed on the right
#(except for the last bin). For example, if bins = c(2.5,5,7.8,9) you are to determine if an element
#of x falls into the bin (-Inf,2.5], the bin (2.5,5], the bin (5,7.8], the bin (7.8,9], or the bin (9,Inf).
#Here x is a numeric data vector, and we want to bin the data. If bins has length m, then we
#return a vector of length (m+1). We do not allow –Inf or Inf values in bins.
#The purpose of the function is to return a count of how many elements of x fall into each bin.
#Using the bins vector as defined above, If x = c(8.3, -2, 2.3, 7.9, 2.5, 2.51, 8.5, -8.9, 9.2) we
#return the vector c(4,1,0,3,1). The explanation of the output vector is given below.
#There are four values of i such that x[i] <= bins[1]

x=c(1:50) #  values of vector x, 1 to 50

bins=c(10,20,30,40,50) #the bins set as breaks in intervals of 10

histogram.vector = vector(length = (length(bins)+1)) #this is a vector of length equal to the number of bins needed

bin.data=function(x,bins) { #start of the function
  
  for(i in 1:length(histogram.vector))  
  { #Loops over each bin number in the histogram vector
    
    for(j in 1:length(x)) #This loop starts a count over each element of x
    { #The following conditions will determine what elements of x go in which bins 
      
      
      if(i==1 && x[j] <= bins[1] )     
      {#if x[j] < bins[1] then the historgram.vector[1] is incremented by 1, and stored
        histogram.vector[i] = histogram.vector[i] +1      
        histogram.vector
      }
      
      else if(i==length(histogram.vector) && x[j] > bins[length(bins)])
      {#if x[j] > bins[-1] then historgram.vector[-1] is incremented by 1, and stored
        histogram.vector[i] = histogram.vector[i] +1
        histogram.vector
      }
      
      else if(x[j] <= bins[i] && x[j] > bins[i-1])  
      {#if x[j] is less than or equal to the ith element of bins and greater than the 
        #i-1 element of bins then the ith element of historgram.vector is incremented by 1, and stored
        histogram.vector[i] = histogram.vector[i] +1    
        histogram.vector
      }
      
      else 
        histogram.vector
    }
    
  }# End: Loop over x
  
}# Loops over each bin number in the histogram vector

for(i in 1:length(histogram.vector))  #Run the for loop again, because without this, histogram.vector creates bins that say 'FALSE'
{
  
  for(j in 1:length(x))         
  {
    if(i==1 && x[j] <= bins[1] )     
    {
      histogram.vector[i] = histogram.vector[i] +1      
      histogram.vector
    }
    
    else if(i==length(histogram.vector) && x[j] > bins[length(bins)])
    {
      histogram.vector[i] = histogram.vector[i] +1
      histogram.vector
    }
    
    else if(x[j] <= bins[i] && x[j] > bins[i-1])  
    {
      histogram.vector[i] = histogram.vector[i] +1    
      histogram.vector
    }
    
    else 
      histogram.vector
  }
  
}

print(histogram.vector) #output is the values of x being sorted into the bins. 

#This code gives the desired result, but needs to be improved on in order to remove the 2nd run of the loop.
