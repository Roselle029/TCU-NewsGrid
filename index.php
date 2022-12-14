<?php
  // Fetching all the Navbar Data
  require('./includes/nav.inc.php');

  // Fetching all the Slider Data
?>

<style>

  /* Scrollbar Styling */
  ::-webkit-scrollbar {
    width: 10px;
}
 
::-webkit-scrollbar-track {
    background-color: #ebebeb;
    -webkit-border-radius: 10px;
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    -webkit-border-radius: 10px;
    border-radius: 10px;
    background: #6d6d6d; 
}

  .hero {
  width: 100%;
  height: 500px;
  background-color: #fff;
  background-image: url(bg.png);
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  box-shadow: 0 0 14px 0 rgba(0,0,0.80);
}

.hero__content {
  padding: 10rem 3rem;
  text-align: left;
}

.scroll-down {
  opacity: 1;
  -webkit-transition: all .5s ease-in 3s;
  transition: all .5s ease-in 3s;
}

.scroll-down {
  position: absolute;
  bottom: 85px;
  left: 50%;
  background-color: #ffffff;
  margin-left: -16px;
  display: block;
  width: 62px;
  height: 62px;
  background-size: 14px auto;
  border-radius: 15%;
  z-index: 2;
  -webkit-animation: bounce 2s infinite 2s;
  animation: bounce 2s infinite 2s;
  -webkit-transition: all .2s ease-in;
  transition: all .2s ease-in;
  transform: scale(1)
}

.scroll-down:before {
    position: absolute;
    top: calc(50% - 8px);
    left: calc(50% - 6px);
    transform: rotate(-45deg);
    display: block;
    width: 14px;
    height: 14px;
    content: "";
    border: 8px solid #000000;
    border-width: 0px 0 4px 4px;
}

@keyframes bounce {
  0%,
  100%,
  20%,
  50%,
  80% {
    -webkit-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
  }
  40% {
    -webkit-transform: translateY(-10px);
    -ms-transform: translateY(-10px);
    transform: translateY(-10px);
  }
  60% {
    -webkit-transform: translateY(-5px);
    -ms-transform: translateY(-5px);
    transform: translateY(-5px);
  }
}

#page-preloader {
    position: fixed;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    background: #ffffff;
    z-index: 100500;
  }
  
  #page-preloader .spinner {
    margin-right: auto;
    margin-left: auto;
    display: block;
    margin-top: 20%;
    width: 10%;
    z-index: 10000; 
    animation: 3s infinite alternate shadow;
  }
  
  @keyframes floating {
    0% {
      transform: translatey(0px);
    }
    50% {
      transform: translatey(-10px);
    }
    100% {
      transform: translatey(0px);
    }
  }
  @keyframes shadow {
    0% {
      width:180px;
    }
    50% {
      width:150px;
    }
    100% {
      width:180px;
    }
  }
</style>

<section class="hero">
       <!-- <a href="#news" class="scroll-down" address="true"></a>-->
        <div class="hero__content">
        </div>
      </section>

<!-- Article List Container -->
<br/><br/><br/><br/><section class="py-1 category-list">
  <div class="container" id="news">
    <h2 class="headings">Articles & News</h2>
    <div class="card-container">
      <?php

        $articleQuery = " SELECT category.category_name, category.category_color, article.*
                          FROM category, article
                          WHERE article.category_id = category.category_id
                          AND article.article_active = 1
                          ORDER BY RAND() LIMIT 5";
        
        // Running Article Query 
        $result = mysqli_query($con,$articleQuery);

        // Row stores the no of rows in the return data from Query
        $row = mysqli_num_rows($result);
        
        // If query has any result (records) => If any articles are present
        if($row > 0) {
          
          // Fetching the data of particular record as an Associative Array
          while($data = mysqli_fetch_assoc($result)) {
            
            // Storing the article data in variables
            $category_color = $data['category_color'];
            $category_name = $data['category_name'];
            $category_id = $data['category_id'];
            $article_id = $data['article_id'];
            $article_title = $data['article_title'];
            $article_image = $data['article_image'];
            $article_desc = $data['article_description'];
            $article_date = $data['article_date'];
            $article_trend = $data['article_trend'];
            
            // Updating the title with a substring containing at most length of 55 characters
            $article_title = substr($article_title,0,55).' . . . . .';
            
            // Updating the description with a substring containing at most length of 150 characters
            $article_desc = substr($article_desc,0,150).' . . . . .';
            
            // New variable to determine if the article is NEW
            $new = false;

            // Fetching present timestamp
            $tdy = time();

            // Article date is updated to a timestamp 
            $article_date = strtotime($article_date);
            
            // Found the difference between the article release timestamp and present timestamp
            $datediff = $tdy - $article_date;

            // Converting the difference into no of days
            $datediff = round($datediff / (60*60*24));

            // If the difference is less than 2 => article is less than 2 days older
            if($datediff < 2) {
              
              // Updating the variable to true to have a new tag on article card
              $new = true;
            }
            
            // Bookmarked variable to determine if the article is bookmarked by the user
            $bookmarked = false;
            
            // Checking if the user is logged in
            if(isset($_SESSION['USER_ID'])) {
              
              // Bookmark Query to check if the particular article is bookmarked by user
              $bookmarkQuery = "SELECT * FROM bookmark 
                                WHERE user_id = {$_SESSION['USER_ID']}
                                AND article_id = {$article_id}";
              
              // Running the Bookmark Query
              $bookmarkResult = mysqli_query($con, $bookmarkQuery);
              
              // Returns the number of rows from the result retrieved.
              $bookmarkRow = mysqli_num_rows($bookmarkResult);
              
              // If query has any result (records) => User has the article bookmarked
              if($bookmarkRow > 0) {
                
                // Updating the variable to true to have bookmarked icon on article card
                $bookmarked = true;
              }
            }

            // Calling user defined function to create an article card based upon given data
            createArticleCard($article_title, $article_image, 
                  $article_desc, $category_name, $category_id, $article_id, 
                  $category_color, $new, $article_trend, $bookmarked);

          }
        }
        // Calling user defined function to create a Addmore Card which directs to All Article Page
        createMoreCard('./articles.php');
      ?>

    </div>
  </div>
</section>


<!-- Category List Container -->
<section class="py-1 category-list">
  <div class="container">
    <h2 class="headings">Department & Organization</h2>
    <div class="card-container">
      <?php
        // Category Query to fetch maximum 5 random category
        $categoryQuery= " SELECT * 
                          FROM category 
                          ORDER BY RAND() LIMIT 5";
        
        // Running Category Query
        $result = mysqli_query($con,$categoryQuery);
        
        // Returns the number of rows from the result retrieved.
        $row = mysqli_num_rows($result);

        // If query has any result (records) => If any categories are present
        if($row > 0) {
        
          // Fetching the data of particular record as an Associative Array
          while($data = mysqli_fetch_assoc($result)) {
            
            // Storing the category data in variables
            $category_id = $data['category_id'];
            $category_name = $data['category_name'];
            $category_image = $data['category_image'];
            $category_desc = $data['category_description'];
            
            // Calling user defined function to create an category card based upon given data
            createCategoryCard($category_name,$category_image,$category_desc,$category_id,);   
          }
        }
        // Calling user defined function to create a Addmore Card which directs to All Categories Page
        createMoreCard('./categories.php');
      ?>
    </div>
  </div>
</section>

<div id="page-preloader">
   <img src="./assets/images/logos.png" class="spinner">
</div> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
  $(window).on('load', function () {
  var $preloader = $('#page-preloader'),
    $spinner   = $preloader.find('.spinner');
  $spinner.delay(85000).fadeOut();
  $preloader.delay(5500).fadeOut('slow');
  });
</script>


<?php

  // Fetching all the Footer Data
  require('./includes/footer.inc.php');
?>