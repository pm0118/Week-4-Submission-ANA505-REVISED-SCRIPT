#Week 4: REVISED SCRIPT - dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))

Titanic_Edited <- as.data.frame(Titanic)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data

head(Titanic_Edited)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr

install.packages("dplyr")
library(dplyr)

#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)

selected_columns <- select(Titanic_Edited, Survived, Sex)

#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name

new_dataset <- selected_columns
write.csv(new_dataset, file = "new_dataset.csv", row.names = FALSE)

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

new_dataset_1 <- select(new_dataset, -Sex)
head(new_dataset_1)

#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'

Titanic_Edited_1 <- rename(Titanic_Edited, Gender = Sex)
head(Titanic_Edited_1)

#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column

Titanic_Edited_Gender <- as.data.frame(Titanic_Edited_1)

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'

males_only <- filter(Titanic_Edited_Gender, Gender == "Male")
head(males_only)

#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())

arranged_data <- arrange(Titanic_Edited_Gender, Gender)
head(arranged_data)

#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:2201

total_examined <- sum(Titanic_Edited$Freq)
print(total_examined)

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'

females_only <- filter(Titanic_Edited_Gender, Gender == "Female")
head(females_only)

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

combined_dataset <- bind_rows(males_only, females_only)
head(combined_dataset)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package

combined_dataset <- combined_dataset %>%
mutate(Gender = recode(Gender, "Male" = "M", "Female" = "F"))
head(combined_dataset)