# Parallel-Coordinates
An implementation of a parallel coordinates plot visualization using processing.

###### Project by: Lawson Busch and Matt Bonazzoli


## Sketches For Project
![Project Sketch](/images/Sketches.PNG)


## Final Implementation
We decieded to implement a horizontal parallel coordinate plot because we felt it was easier to interpret the various data attributes. Each item is displayed with each of its quantitative vairables assigned to an attribute column. The items were distinguished by their quantitative variables. Even though there are many items for each data set, which creates clutter, this design choice was best to show the overall data attributes for each item. To compensate for the clutter and occlusion of data we implemented filtering. The filtering is distinguished with a change in hue for the selected items as well as a decrease in saturation for the unselected items to make the highlighted items very apparent. We also allow the user to click and drag the column order to see different patterns in the data. Initially we only chose to have the change in hue for the highlighted items, but upon initial implementation there was still too much clutter so we decided to add teh desaturation factor. We also decided to implemented a toggle so that only the highlighted items are shown on the plot in order to reduce the screen clutter. For the column changing, we stuck with our initial design desicion to change the hue of the column as the column is manipulated. We were able to include everything we initially invisioned for the visualization and were able to add more as we did not feel our initial decisions allowed the visualization to be effective.

#### Initial Parallel-Coordinate Plot
![Initial Visualization](/images/ParallelPlotsSnippet1.PNG)


#### Data Filtering
![Initial Visualization](/images/ParallelPlotsSnippet2.PNG)


#### Data Filtering With Toggle
![Initial Visualization](/images/ParallelPlotsSnippet3.PNG)


#### Column Selection
![Initial Visualization](/images/ParallelPlotsSnippet4a.PNG)


#### Column Position Change
![Initial Visualization](/images/ParallelPlotsSnippet4b.PNG)


## Interactivity

Our parallel coordinates plot supports several different types of interactivity. The first is the ability to **filter by select colomn attributes**. Initially, the user sees all data displayed across the parallel coordinates, but the user can select data from a column by clicking over the column and dragging to over the data points that they want to highlight. When the mouse click is released, selected data will be highlighted with a blue line, and non selected data will be desaturated to make it fall into the background. We chose blue because it provided a significant popout effect, while also not being such a strong contrast that it is hard for the user to view non-highlighted data. This allows the viewer to easily see the contrast between the highlighted data and the non-highlighted data. If the user wants to see the highlighted data by itself, they can press the space bar, which toggles the view between displaying non-highlighted data and highlighted data to only highlighted data points. 

The second interaction that our visualization supports is the ability to **reorder columns**. Columns can be moved by clicking on their label, which will be highlighted in red when moused over, and dragging the column to the left or right in the x direction. Each column can only be dragged fifty units, at which point it will stop being able to move. When the mouse is released, the column will swap positions with the column to its left or its right, depending on which direction the column was dragged. This allows the user to reorder the columns in order to get a better view of specific relations between columns.

The last interaction that our data supports is interactively **changing the displayed data set**. This is done by either pressing the **'a'** key for the carData set, the **'c'** for the cameraData set, or the **'f'** key for the foodData set. 

## Interaction Improvements

Areas that we would like to improve for our interactions are our highlighting method and our column dragging method. We would like to change our column relocating method by allowing the user to interactively drag the column between any pairs of columns and adjust the column's positions accordingly when the mouse in released, instead of our current method of dragging a certain distance, releasing, and swapping with its neighbor column. For our highlighting method, we would like to include some interaction during the dragging process, such as a rectangle over the currently dragged area, so that the user has some indication of what data they are in the process of selecting. We would also like to allow the user to perform multiple filters at the same time. Otherwise, we are happy with the performance of our interactions.
