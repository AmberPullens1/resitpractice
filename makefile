#Main build rule
all: output/histogram.pdf output/lineplot.pdf

##Sub-builds:

data/reviews.csv data/listings.csv: src/download_data.R
	R --vanilla < src/download_data.R
	
temp/listings_merged_df.csv: src/filter_aggregate.R data/reviews.csv data/listings.csv
	R --vanilla < src/filter_aggregate.R
	
temp/aggregated_df.csv: src/filter_aggregate.R data/reviews.csv data/listings.csv
	R --vanilla < src/filter_aggregate.R
	
output/histogram.pdf: temp/listings_merged_df.csv src/histogram.R
	R --vanilla < src/histogram.R
	
output/lineplot.pdf: temp/aggregated_df.csv src/lineplot.R
	R --vanilla < src/lineplot.R