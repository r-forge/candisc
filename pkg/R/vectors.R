# utility for drawing labeled vectors
# TODO: handle xpd=TRUE somewhere so labels aren't cut off
# DONE: allow origin to be a two-col matrix like x
# TODO: calculate default length in terms of par("usr")

vectors <- function(x, origin=c(0,0), labels=rownames(x), scale=1, length=.1, angle=12, col="blue", pos=NULL, ...) {
	x <- scale*x
	if (is.vector(origin)) origin <- matrix(origin, ncol=2)
	arrows(origin[,1], origin[,2], x[,1], x[,2], length=length, angle=angle, col=col, ...)
	if (!is.null(labels)) {
		if(missing(pos)) pos <- ifelse(x[,1]>0, 4, 2)
		# DONE: position labels relative to arrow ends (outside)
		text(x[,1], x[,2], labels, pos=pos, col=col, ...)
		}
}