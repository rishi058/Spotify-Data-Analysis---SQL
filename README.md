# Spotify Data Analysis

**Advanced SQL Project**
, [Dataset - Kaggle](https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset)

![Spotify Logo](spotify_logo.jpg)

## Overview
This project involves analyzing a Spotify dataset with various attributes about tracks, albums, and artists using **SQL**. It covers an end-to-end process of normalizing a denormalized dataset, performing SQL queries of varying complexity and optimizing query performance.


## Technology Stack :
    1. Database: PostgreSQL
    2. SQL Queries: DDL, DML, Aggregations, Joins, Subqueries, Window Functions
    3. Tools: pgAdmin 4 (or any SQL editor), PostgreSQL (via Homebrew, Docker,or direct installation)

## How to Run the Project
    1. Install PostgreSQL and pgAdmin (if not already installed).
    2. Set up the database schema and tables using the provided normalization structure.
    3. Insert the sample data into the respective tables.
    4. Execute SQL queries to solve the listed problems.
    5. Explore query optimization techniques for large datasets.

---

## Project Steps

### 1. Data Exploration

    The dataset contains attributes such as:
    - Artist: The performer of the track.
    - Track: The name of the song.
    - Album: The album to which the track belongs.
    - Album_type: The type of album (e.g., single or album).
    - Various metrics such as `danceability`, `energy`, `loudness`, `tempo`, and more.



### 2. Querying the Data

    a. Easy Queries : Simple data retrieval, filtering, and basic aggregations.

    b. Medium Queries : More complex queries involving grouping, aggregation    functions, and joins.
    
    c. Advanced Queries : Nested subqueries, window functions, CTEs, and performance    optimization.

### 3. Query Optimization

    a. Indexing: Adding indexes on frequently queried columns.

    b. Query Execution Plan: Using `EXPLAIN ANALYZE` to review and refine query     performance.
  


## Questions :

### Easy Level
1. Retrieve the names of all tracks that have more than 1 billion streams.
2. List all albums along with their respective artists.
3. Get the total number of comments for tracks where `licensed = TRUE`.
4. Find all tracks that belong to the album type `single`.
5. Count the total number of tracks by each artist.

### Medium Level
1. Calculate the average danceability of tracks in each album.
2. Find the top 5 tracks with the highest energy values.
3. List all tracks along with their views and likes where `official_video = TRUE`.
4. For each album, calculate the total views of all associated tracks.
5. Retrieve the track names that have been streamed on Spotify more than YouTube.

### Advanced Level
1. Find the top 3 most-viewed tracks for each artist using window functions.
2. Write a query to find tracks where the liveness score is above the average.
3. **Use a `WITH` clause to calculate the difference between the highest and lowest energy values for tracks in each album.**
5. Find tracks where the energy-to-liveness ratio is greater than 1.2.
6. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.


## Query Optimization Technique :

To improve query performance, we carried out the following optimization process:

- **Initial Query Performance Analysis Using `EXPLAIN`**
    - We began by analyzing the performance of a query using the `EXPLAIN` function.
    - The query retrieved tracks based on the `artist` column, and the performance metrics were as follows:
        - Execution time (E.T.): **7 ms**
        - Planning time (P.T.): **0.17 ms**
    - Below is the **screenshot** of the `EXPLAIN` result before optimization:
      ![EXPLAIN Before Index](spotify_explain_before_index.png)

- **Index Creation on the `artist` Column**
    - To optimize the query performance, we created an index on the `artist` column. This ensures faster retrieval of rows where the artist is queried.
    - **SQL command** for creating the index:
      ```sql
      CREATE INDEX idx_artist ON spotify_tracks(artist);
      ```

- **Performance Analysis After Index Creation**
    - After creating the index, we ran the same query again and observed significant improvements in performance:
        - Execution time (E.T.): **0.153 ms**
        - Planning time (P.T.): **0.152 ms**
    - Below is the **screenshot** of the `EXPLAIN` result after index creation:
      ![EXPLAIN After Index](spotify_explain_after_index.png)

- **Graphical Performance Comparison**
    - A graph illustrating the comparison between the initial query execution time and the optimized query execution time after index creation.
    - **Graph view** shows the significant drop in both execution and planning times:
      ![Performance Graph](spotify_graphical%20view%203.png)
      ![Performance Graph](spotify_graphical%20view%202.png)
      ![Performance Graph](spotify_graphical%20view%201.png)

**This optimization shows how indexing can drastically reduce query time, improving the overall performance of our database operations in the Spotify project.**



## Future Improvements : 

- **Visualize the Data**: Use a data visualization tool like **Tableau** or **Power BI** to create dashboards based on the query results.
- **Expand Dataset**: Add more rows to the dataset for broader analysis and scalability testing.
- **Advanced Querying**: Dive deeper into query optimization and explore the performance of SQL queries on larger datasets.

---
