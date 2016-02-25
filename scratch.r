# 1          
fmax <- max(table(singer$voice.part))

# 2
singer2 <- singer %>% 
           group_by(voice.part) %>% 
           arrange(height) %>% 
           mutate(gid = 1:length(height),
                  f.org = (1:length(height) - 0.5 ) / n()) %>% 
           ungroup() %>% 
           complete(voice.part, gid )

# 3
library(stringr)
singer3 <- singer2 %>% 
           group_by(voice.part) %>% 
           mutate(  f.val = (1:length(height) - 0.5 ) / n(),
                    hgt2  = approx(f.org, height, f.val)$y ) %>% 
           ungroup() %>% 
           mutate(voice.part = str_replace_all(voice.part," ", "")) %>% 
           select(f.val, voice.part, hgt2) %>% 
           spread( key=voice.part, value=hgt2) %>%
           na.omit %>% as.data.frame()

ggplot(singer2, aes(x=height, y=height)) + geom_point() + facet_grid(voice.part~voice.part)

library(GGally)
ggscatmat(singer3, columns=2:9)



