library(ggplot2)
library(data.table)

df <- fread('Economist_Assignment_Data.csv', drop=1)
head(df)
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore", "Congo")
pl <- ggplot(df, aes(x=CPI, y=HDI)) 
pl + geom_point(aes(color=Region), shape=1, size=5, stroke=1) +
  geom_smooth(aes(group=1), method='lm', formula=y ~ log(x), se=F, color='red') +
  geom_text(aes(label=Country), color='gray20', 
            data=subset(df, Country %in% pointsToLabel), check_overlap=T) +
  theme_bw() +
  scale_x_continuous(name='Corruption Perceptions Index, 2011 (1=best)',
                     limits=c(1,10), breaks=1:10) + 
  scale_y_continuous(name='Human Development Index, 2011 (10=least corrupt)',
                     limits=c(0.2,1), breaks=seq(0.2,1,0.2))
