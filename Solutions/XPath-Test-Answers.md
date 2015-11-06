## XPath Exam Solutions ##

**Q1.** //div[@type='book'][2]//p[persName][placeName] 127 Results

**Q2.** distinct-values(//div[@type='book'][2]//placeName) 293 Results

**Q3.** string-join(distinct-values(//div[@type='book'][2]//placeName), ";")

**Q4.** //placeName[contains(.,"Taheitee")] 211 Results

**BONUS**

Shortest:  
(distinct-values(//placeName[contains(.,"Taheitee")]/string-length()))
*You get 5 results: 8, 10, 16, 15, 14*

min(//placeName[contains(.,"Taheitee")]/string-length())  
*You get Taheitee with 8 characters*

//placeName[contains(.,"Taheitee")][string-length()= min(//placeName[contains(.,"Taheitee")]/string-length())]   
*To find the shortest name, which is "Taheitee"*

Longest:  
(distinct-values(//placeName[contains(.,"Taheitee")]/string-length()))   
*You get 5 results: 8, 10, 16, 15, 14*

max(//placeName[contains(.,"Taheitee")]/string-length())   
*You get a result with 16 characters*

//placeName[contains(.,"Taheitee")][string-length()= min(//placeName[contains(.,"Taheitee")]/string-length())]   
*To find the longest name, which is "O-Taheitee-eetee"*


