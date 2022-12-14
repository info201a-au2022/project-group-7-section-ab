
library(shiny)
library(ggplot2)
library(shinythemes)
library(tidyverse)
library(DT)


intro_panel <- tabPanel(
  "Introduction",
  titlePanel(strong("US Economy: Socioeconomic & House Market")),
  hr(style = "border-top: 1px solid #000000;"),
  p("The US economy is considered one of the strongest economies in the world. In our mixed market economy, the US continuously exhibits strengths. 
    However during the COVID-19 pandemic, our economy took several hits. Job growth slowed, overall wages were lost and ultimately the 
    economy and the housing markets have seen drastic downturns. Due to the changing atmosphere of America's economic systems, 
    we decided to focus our project on the highs and lows of the economy, ultimately seeking to learn more about individual standing in our economy and housing market. 
    Furthermore, we want to answer which demographics have suffered under our economic systems, the assets these groups have, and what resources have helped alter the economic landscape. 
    To help find those answers we plan to use data that gives information relating to the socioeconomic statuses of citizens. The information from the data includes race, occupation, annual 
    incomes, housing prices, US poverty rates, and more."),
  br(),
  h3(strong("Abstract")),
  sidebarLayout(
    mainPanel(
      img("", src="https://www.realestatewitch.com/wp-content/uploads/2021/10/pti-1536x1024.png.webp", height = 250, width = 500),
      br(),
      img("", src="https://img.money.com/2017/06/170613-how-old-is-old.jpg?quality=60&w=1600", height = 250, width = 500)
    ),
    sidebarPanel (
      p("Demonstrating the differences in Annual income compared to the house
    market. As well as show the percentage of change prior to the each of 
      the income/cost"),
      hr(style = "border-top: 1px solid #000000;"),
      p("Which groups are more susceptible to poverty as well as identifying reasonings for the occurance"),
      hr(style = "border-top: 1px solid #000000;"),
      p("Mapping poverty rates in the US to show poverty in correlation with races. Shows common patterns and characteristics in where
        ceterain poverty patterns occur to marginalized  groups")
      
    ) 
  )
)



# Graph 1
select_values <- c(colnames(house_and_annual[2]),colnames(house_and_annual[8]))
date_range <- house_and_annual$Year
select_values_percent <- c(colnames(percent_change_df[2]),colnames(percent_change_df[3]))


interaction_one <- tabPanel(
  "Annual Income and Housing Costs",
  titlePanel(strong("Average Income vs. Average House Price (1962-2021)")),
    sidebarLayout(
      sidebarPanel(
        helpText("Choose the following variables to show on the graph"),
        selectInput(
          inputId = "y_input",
          label = "Choose Graph",
          choices = list(
            "Average House Cost" = "Average_house_price",
            "Average Annual Income" = "Average_annual_income"
          ),
          selected = "Average_price_house"
        ),
      h5("Central Focus"),
      p("This graph illustrates the increasing prices in both annual income and house market beginning from 1962 to 2021. The annual income 
        graph shows a evenly increment increase throughout the years. However, in 2020 there is a spike of increase disproportionate to the 
        other years. This year is followed by the influence of Covid-19. With shortage of labor, minimum wages have increased, which in 
        return also increases the average annual income."),
      p("Followed with average cost of the house market, the graph illustrates less of a linear growth. There is more cases of sudden spikes 
      and fallouts. One of which is the 2007 house market crash showcasing the effects of increase home prices as well as the loose lending 
      practices towards home buyers. Another interesting note is the all time high in 2021 that still has influence to todays house market. "),
      p("The table to the right shows the changes of percentages of both annual income and the house market. It is organize by the year and 
      followed by the change of percentage to the year prior. ")
      ),
      mainPanel(
        plotOutput("graph_1"),
        DT::dataTableOutput("mytable")
      )
    )
)

interaction_two <- tabPanel(
  "Poverty by Race",
  titlePanel(strong("Poverty Rates by Races (2020)")),
  sidebarLayout(
    sidebarPanel(
      helpText("Shows areas where poverty are higher corresponding to the state"),
      selectInput(
        inputId = "graph2_input",
        label = "Choose varaible",
        choices = list(
          "Percentage of Whites in Poverty" = colnames(map_povertyv2[2]),
          "Percentage of Blacks in Poverty" = "Black",
          "Percentage of Hispanics in Poverty" = "Hispanic",
          "Percentage of Asian, Native, Hawaiian, and Pacific Islander in Poverty" = "Asian.Native.Hawaiian.and.Pacific.Islander",
          "Percentage of American Indian and Alaska Natives in Poverty" = "American.Indian.Alaska.Native"),
        selected = "White"
      ),
      h5("Central Focus"),
      p("The map above shows the areas where poverty is highest according to the race. One interesting point is that the catagory with White 
      Americans is the only option where it shows the information entirely for the US map. Other races lack information as some states do not 
        have any records of poverty. This data serves importance as it can potentially show marginalized areas where poverty inhibits. 
        As there are common characteristics that may differ from other groups in eccesne of location. As well as show exclusiverness as 
        some areas do not have information on poverty. ")
    ),
    mainPanel(
      plotOutput("graph_2")
    )
  )
)



interaction_three <- tabPanel(
  "Poverty by Age",
  titlePanel(strong("Age vs. Percentage in Poverty")),
    sidebarLayout(
      sidebarPanel(
        helpText("Choose the following variables to show on the graph"),
        radioButtons(
          inputId = "graph3_input",
          label = "Choose variables",
          choices = list(
            "Ages Under 18" = "under_18",
            "Ages 16 to 64" = "x18_to_64",
            "Ages 65 and above" = "x65_and_older"),
          selected = "under_18"
          
        ),
      ),
      
      mainPanel(
        plotOutput("graph_3"),
        h5("Central Focus"),
        hr(style = "border-top: 1px solid #000000;"),
        p("This data set showcases the differing categories in age in relationship with poverty. Dating from the 1970???s, there appears to be a 
        decline in poverty for those 65 years old and higher. However, for the other groups, there are higher vulnerability to poverty. Those 
        under 18 have the highest chances with 22% in poverty during the early 1990???s.  And similar numbers in the early 1980???s and 2010. Those 
        in the working age population in the ages of 16 to 64 also has history with poverty. Unlike those under 18, it has lower percentages, 
        the highest being 14% in the 2010."),
        p("A pattern found in all three graphs are higher spikes during the years of 1980, 1990, and 2010.")
      )
  )
)

#conclusion
sumtakeaway_panel <- tabPanel(
  "Summary Takeaways",
  titlePanel(strong("Summary Takeaways")),
  sidebarLayout(
    position = "right",
    sidebarPanel(
      h4(strong("About Us")),
      p("Special thanks to project members for allocating resources and utilizing R in order to create a project overviewing the economic patterns in the US!"),
      p("Lesther Dumosmog || ldumos@uw.edu"),
      p("Amy Oguejiofor || amyo6@uw.edu"),
      p("Nuria Abas Ibrahim || nuriai2@uw.edu")
    ),
    mainPanel(
      p("During the development of this project, we have learned a few things along with the utility of R. 
        The first takeaway would be the relationship between annual income and housing costs. It???s a predicament as housing has become fairly expensive. It brings emphasis 
        as annual income does not fit the needs in order for people to buy houses. A takeaway is that annual income have increased by 29% since the 1960???s, and the 
        housing has increased by 121% which is incomparable to one another. Another factor would be the stability of the housing market as it begins to spike up 
        and down in recent years. And annual income is a incrementally increasing slowly."),
      p("Another takeaway takes place in the Poverty Rates by Rate in 2020. It showed where groups are more exposed to poverty by state and each race had a characteristic 
        of their own. Hispanics had higher rates of poverty in the Southern states. Black americans were more common in the south as well but had an influence in Northern and 
        midwestern cities. This may be due to the great migration taken in the 1910-1940???s as they were trying to escape racial violence and pursue more opportunities. "),
      p("And lastly, the last takeaway resides in age in comparison to age. It shows that ages under 18 were more exposed to poverty as they had 22% of their group considered 
        part of poverty. However, those of ages 65 and up have decreased in poverty rates beginning at 15.5% in 1975 to approximately 5% in 2020. However, in groups under 18 
        and the working ages (16-64) had spikes in 1980, 1990, and one in 2010. After research we have discovered that in 1980 wages declined due to inflation. The 
        The cause for 1990 was because of the elimination of low skilled manufacturing jobs and popularity of employment to suburbs rather than central cities. And for 2010, it was 
        because of the continued lack of jobs that influenced the rate of poverty. ")
    )
  )
)

# report 
report_panel <- tabPanel(
  "Report",
  titlePanel(strong("US Economy Report")),
  sidebarLayout(
    position = "right",
    sidebarPanel(
      h4(strong("Acknowledgment")),
      p("Big thanks for U.S. Bureau of Labor Statistics for providing statistics as well as kaggle for publishing a data table to work from. As well as the
        articles provided in CBPP which a lot of our inspiration came from."),
      br(),
      br(),
      h4(strong("Refrences")),
      p("Tracking the COVID-19 Economy???s Effects on Food, Housing, and Employment Hardships.(2022, 
      February 10). Cbpp.https://www.cbpp.org/research/poverty-and-inequality/tracking-the-covid-19-
      economys-effects-on-food-housing-and#:~:text=The%20COVID%2D19%20pandemic%20and,unemployment%20
      remained%20high%20throughout%202020.", align = "right"),
      p("https://www.bls.gov/news.release/pdf/empsit.pdf", align ="right"),
      p("https://www.bls.gov/opub/mlr/2020/article/the-impact-of-the-covid-19-pandemic-on-food-price-
      indexes-and-data-collection.htm", align = "right"),
      p("https://www.thecut.com/2022/10/shein-is-treating-workers-even-worse-than-you-thought.html", align = "right")
    ),
      

    mainPanel(
      hr(style = "border-top: 1px solid #000000;"),
      h3("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington", align = "center"),
      h3("Date: Autumn 2022", align = "center"),
      h3("Project: credit_class", align = "center"),
      
      br(),
      br(),
      
      h2(strong("Abstract")),
      hr(style = "border-top: 1px solid #000000;"),
      p("The agenda of the project is to understand the differentiating social economic status play a role in the cultural norms
        in financial commitments. In order to approach this question, we will group the data by annual income showcaseing common 
        characteristics of each catagory of salary. The importance of this data is to outline the different resources used by 
        groups corresponding to their annual income."),
      
      br(),
      br(),
      
      h2(strong("Introduction")),
      hr(style = "border-top: 1px solid #000000;"),
      p("In the alarming growth in the expenses of resources becoming expensive, we have decided to report a project based on the 
        current economic situation. The limited resources being a concern after the hit of Covid-19 has created a global surge in 
        prices. This was due to the result of political desicions and supply and demand of resources. Due to the current outcome, 
        we have decide to create a project that reflects in the current trends and cultures in retrospective of the high living 
        standards. The information provided in this report comes from U.S. Bureau of Labor Statistics as well as kaggle showcasing 
        the information in the current work force. In addition of the information, we are hoping to showcase the changes and current 
        work flow to the general public."),
      
      br(),
      br(),
      
      h2(strong("Problem Domain")),
      hr(style = "border-top: 1px solid #000000;"),
      p("With the appearance of Covid-19, it lead to a drastic hit in the economy as many people lack secruity in their jobs due to 
        companies insueing layoffs. Job growth remaing slow, hours cut, instability in jobs, and overall lost in wages. The Census 
        Bereau released data on the job market at the end of 2021, and it was noted that tens of millions of people lost their jobs 
        (CBPP). This had resulted in many relief programs being active. Nevertheless, 20 million households did not have enough to 
        eat and 10 million being behing in house payments. The U.S. Bureau of Labor Statistics] recorded the changes in major worker 
        groups in September:"),
      p("1) The number of persons employed part time for economic reasons decreased by 306,000 to 3.8 million in September"),
      p("2) The number of persons not in the labor force who currently want a job was little changed at 5.8 million in September and remains
        above its February 2020 level of 5.0 million"),
      p("3) Among the unemployed, the number of permanent job losers decreased by 173,000 to 1.2 million in September"),
      p("4) The number of discouraged workers, a subset of the marginally attached who believed that no jobs were available for them, increased 
        by 119,000 to 485,000 in September."),
      p("The pandemic impacted everyone but was not distributed evenly to all social classes. In fact, it remained more prevalent in groups 
        such as Blacks, Latinos, and other groups of minority. This is the result due to structual racism shifting the most economic hardships 
        to those of color."),
      p("Among the major worker groups, the unemployment rate for Hispanics decreased to 3.8 percent in September. The jobless rates for adult 
        men (3.3 percent), adult women (3.1 percent), teenagers (11.4 percent), Whites (3.1 percent), Blacks (5.8 percent), and Asians (2.5 
        percent) showed little change over the month"),
      p("Into a more global setting, resources have increased due to the lack of production stemming from Covid-19. The article The impact of 
      the COVID-19 pandemic on food price indexes and data collection reported by U.S. Bureau of Labor Statistics Included that production of 
      meats in Asia fell 9% in 2020. This lead to the declining of U.S. exports meat prices resulting in a drop of 22.5% in meat packaging. 
      However, due to the meat shortage it caused in the increase of meat going up by 16%. As well as sea food experiencing chain disruptions 
      causing in a decrease of production in fish and shellfish by 17.1%. The pandemic caused many businesses to halt and slow down production 
      causing the demand to increase along with the prices."),
      
      br(),
      br(),
      
      h2(strong("Research Questions")),
      hr(style = "border-top: 1px solid #000000;"),
      p("1) How has the the workforce in groups of minority been impacted? How does other groups compared in losses compared to mainstream groups? 
      What resources were given to accommodate the standard of equity. It will give a visualization in which groups are being affected the most."),
      p("2) What are the current trends/culture of each standing social classes?
      In addition, what are the characteristics of other groups. What assets have increased and if they have taken a toll in their own finances. What they 
      have earned/lost or maintained throughout the economy collapse. We are hoping to see which traits are involved with each social economic standing."),
      p("3) How did Covid-19 affected finance in the long term?
      Current resources such as gases and food have continued to rise and maintained at high levels. How has the global economy been affected in the presences of 
      high demand and shortage of supplies. Along with real estate becoming expensive averaging nearly a 20% increase in rent within the US."),
      
      br(),
      br(),
      
      h2(strong("The Dataset")),
      hr(style = "border-top: 1px solid #000000;"),
      p("The dataset details a lot of information related to finance specifically credit scores. It gives data related to credit score, SSN, occupation, individual 
        base salaries and number of bank accounts a person has. All of this data is helpful to our project because it helps us see how credit scores differ based on 
        socioeconomic status and one way to determine that is through knowing occupation."),
      p("The data was collected by Rohan Paris, a software developer at Cognizant. The dataset was updated about 4 months ago. The purpose of the set was to identify 
        people???s credit scores with only occupation and minimal bank information given. It was funded through Kaggle. The people/organizations likely to benefit from 
        the data would be Kaggle because there would be more interactions with their site and also people who generally want to learn more about the development of 
        credit scores. We assume that Kaggle has measures that ensure their datasets are reliable and of quality, so yes it???s credible. We obtained the data by searching 
        the kaggle site where the link was provided to us through the proposal instructions. We did credit the source."),
      
      br(),
      br(),
      
      h2(strong("Expected Implications")),
      hr(style = "border-top: 1px solid #000000;"),
      p("Due to the idea that the economy globally is taking in affect as the chain markets experiences disturbances and lack of money to afford the current businesses, 
        everyone is considered as stakeholders. In a more general sense, the two stakeholders are the people and businesses."),
      p("As the problem relies in supply and demand, implications that can be a possible income are those within the work force. Too make the necessary resources, this may 
        aim towards lower wages for workers in order to make up the cut of losses in return for acquiring the needed resources. A prime example of this would be workers in 
        China that works for fast fashion companies such as Shein. According to Sangeeta Singh - Kurtz, a writer for The Cut Magazine, she noted that workders made 4,000 yuan per month ??? roughly $556 ??? to make 500 pieces of clothing 
        per day, which is about 18 hour work days and one day off per month."),
      p("Another implication that may follow suit are policymakers possibly withholding federal aid such as unemployment asstance, student loans, and much more economic reliefs that 
        were sent out during the pandemic. Although the relief programs are meant to help those of need, it can also be used against those in need. They can withhold benefits in order to manage the amount of economic 
        debt. This practice would insure prices remain the same, or at least to not skyrocket in market value."),
      
      br(),
      br(),
      
      h2(strong("Limitations")),
      hr(style = "border-top: 1px solid #000000;"),
      p("One thing that the data table fails to accommodate for is the area of living. As some areas that have low or high financial needs of living, it can have an effect on the statistics 
        and general making desicions in classifying the social classes. Additionally, the data lacks a few informational parts needed to find solutions for the problem domain. May have to find data that is 
        more fitting. Since the information is geared towards those of occupation, it would leave a huge group of people not heing considered as they can be homeless. The data 
        does not provide enough - or any information that of the lowest class."),
      p("Another limitation can be undocumated groups as they may work for jobs that are not affiliated with legal means to show record of payment. The US still have various
      controversies in DACA - Deferred Actions for Childhood Arrivals - which was introduced by Obama. This allowed for undocumented people to work and be voided of deportation. 
      As this movement is still in question, it can lead to many other groups to work without any records."),
      
      br(),
      br(),
      
      h2(strong("Findings")),
      hr(style = "border-top: 1px solid #000000;"),
      p(strong("1. How has the the workforce in groups of minority been impacted?")),
        p("We found that minority groups especially the workforce has seen a lot of detrimental impacts. In our research, we 
          saw that minority groups tend to have hgiher rates of poverty overall across the country. The highest percentage for Black Americans were seen in the Southern part of the US and it was 30%.
          White Americans had the lowest percentages of poverty of the across the country - 15%, which was half of the poverty percentages of Black Americans. So upon analyzing we concluded that minorities, 
          employed (the workforce) and unemployed had been disproportionately hit with poverty while their white counterparts had not endured as many negative 
          impacts."),
      p(strong("2. What are the current trends/culture of each standing social classes?")),
      p("We found one notable trend of younger and middle aged Americans being more susceptible to poverty. 
      Our research indicated that people under 18 have the highest chance of being in poverty - the number
      being 22%. Under 18 year olds reached that high percentage in poverty in three different eras -  the 
      early 1980s,1990s and 2010s. The lowest percentage of poverty depicted in our data visualization was 
      just under 5% for the ages of 18 to 64, the middle aged demographic. So ultimately we found that those 
      who belong to low socioeconomic statuses tend to be younger in age, which supports the ideas found in 
      our data that individuals who are not solidified in a career earn lower amounts of money and our therefore
      less likely to have higher socioeconomic statuses."),
      p(strong("3. How did Covid-19 affected finance in the long term?")),
      p("We found that COVID-19 did impact our economy in a way. The pandemic caused a 
        recession which led to flunctuations in gas prices. During our research we 
        saw a decline in that as the pandemic reached it's heights. This is due to the lack of transport needed during 
        COVID 19 lockdowns which in turn caused a lack of demand for gas and ultimately led to low prices. 
        However, the falling demand from the pandemic era indicated the current extreme increase in gas prices 
        across our country. The surge in prices we see today are the result of efforts to make up for the loss. 
        This highlights the economic blowbacks of the pandemic and just how much it influenced our daily lives. This 
        also demonstrates how our economy usually works, whenever prices drop, there is usually an immediate rise after in order to make up for 
        the loss during the drop. In our data visualizations for housing prices vs annual income this was seen in the decline of average housing costs during 2008 ($300,000 to $250,000), 
        which is also another significant time for the US economy, because a recession occurred that year."),
      br(),
      br(),
      
      h2(strong("Discussion")),
      hr(style = "border-top: 1px solid #000000;"),
      p("One of the goals of our project was to help people better understand our economy and 
        specifically look into how every day people are affected by our country's economic structure. 
        In our findings, there were various socioeconomic implications analyzed. First, minority groups such as Black Americans, Hispanics, 
        Asian/Native/Hawaiian/Pacific Islander, and Native Americans had higher instances of poverty in our country compared to White Americans.
        This indicated that the workforce for those marginalized groups had significantly lower socioeconomic statuses of White Americans and were 
        ultimately less likely to be able to afford things and become affluent in this economy. Second, trends show that our economy tends to have linear increases in prices for goods and services after periods of declines. 
        This was noticed in our analysis of average income vs average housing costs. After the '08 recession housing costs kept rising higher and higher to make up for losses and 
        ultimately Americans suffered to meet those high costs in real time because the average house cost post '08 is nearly 6 times the highest average income seen amongst Americans. 
        Overall, our economy in order to work with declines in consumption tends to be 
        unforgiving to the people who live in this country."),
      
      br(),
      br(),
      
      h2(strong("Conclusion")),
      hr(style = "border-top: 1px solid #000000;"),
      p("Our economic system in the US is complex and has various factors constantly 
        influencing its behaviors. Through our project we saw how our economy is affected on an 
        individual level as well as extreme events, such as a global pandemic. By looking at our data
        it was clear to understand that our housing market is deeply relational to the economy. We saw how the housing prices declined during the 2008 
        recession and then immediately shot up in its prices and that trend is evident currently as we battle against another recession as a result to a pandemic. 
        That increase ultimately plays into socioeconomics in our society through allowing individuals from higher statuses to build wealth through their property. 
        All in all, this project shows how important the economy is to our lives and hopefully teaches more about its significance.")
      
      
    )
  )
)


shinyUI <- navbarPage(
  h4("The US Economy", align = "center"),
  theme = shinytheme("yeti"),
  intro_panel,
  interaction_one,
  interaction_two,
  interaction_three,
  sumtakeaway_panel,
  report_panel
)
