setwd("/Users/cianscannell/Desktop/R/data")

# For this particular type of file, the elements 
# are characters, not numbers
dim5 <- scan("cinq.pgm",what=character())
# First 11 ones are rubbish
dimm <- dim5[-(1:11)]


mat5 <- matrix(dimm,ncol=662,byrow=TRUE)
class(mat5) <- "numeric"

image(mat5)

flipv <- function(x){
    return(t(apply(x,2,rev)))
}

mimage <- function(x){
	image(x,axes=FALSE,col=grey.colors(256))
}

mimage(flipv(mat5))

wrap <- function(x){
	one <- scan(x,what=character())
	two <- one[-(1:11)]
	three <- matrix(two,ncol=as.numeric(one[9]),byrow=TRUE)
	# This one changes our matrix from
	# characters to numbers
	class(three) <- "numeric"
	return(three)
}

cinq <- flipv(wrap("cinq.pgm"))
quatre <- flipv(wrap("quatre.pgm"))
trois <- flipv(wrap("trois.pgm"))
deux <- flipv(wrap("deux.pgm"))
un <- flipv(wrap("un.pgm"))
zero <- flipv(wrap("zero.pgm"))

nums <- list(cinq,quatre,trois,deux,un,zero)

for(i in 1:6) {
	mimage(nums[[i]])
}

install.packages('animation')
library(animation)

gif.gen <- function(){
	for(i in 1:6) {
	     mimage(nums[[i]])
    }
}

saveGIF(gif.gen(),"mygif.gif",outdir="/Users/cianscannell/Desktop/R/")
