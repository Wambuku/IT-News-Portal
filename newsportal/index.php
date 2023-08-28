<?php
global $con;
session_start();
include('includes/config.php');

?>

<!DOCTYPE html>
<html lang="en"  data-bs-theme="dark">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> ITNews Portal | Home Page</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<?php include('includes/header.php'); ?>

<!-- Page Content -->
<div class="container">


    <div class="row" style="margin-top: 4%">

        <!-- Blog Entries Column -->
        <div class="col-md-8">

            <?php
            // Define the available topics and their corresponding RSS feed URLs
            $query = mysqli_query($con, "SELECT tblsubcategory.SubCatDescription AS feedurl, tblsubcategory.SubCategory AS subcategory FROM tblsubcategory left join  tblcategory on  tblcategory.Id=tblsubcategory.CategoryId where tblcategory.CategoryName IN('General', 'Kenyan News', 'Global') and tblsubcategory.Is_Active=1 ");

            $rowcount = mysqli_num_rows($query);
            if ($rowcount == 0) {
                echo "No record found";
            } else {
                // Define the available topics and their corresponding RSS feed URLs
                $topics = array();

                while ($row = mysqli_fetch_assoc($query)) {
                    $feedurl = $row['feedurl'];
                    $subcategory = $row['subcategory'];
                    $topics[$subcategory] = $feedurl;
                }

                // Aggregate all RSS feeds
                $articles = array();

                foreach ($topics as $topic => $feedUrl) {
                    $xml = simplexml_load_file($feedUrl);

                    if ($xml) {
                        foreach ($xml->channel->item as $item) {
                            $article = new stdClass();
                            $article->title = (string)$item->title;
                            $article->link = (string)$item->link;
                            $article->description = (string)$item->description;
                            $article->Category = (string)$item->Category;
                            $article->pubDate = (string)$item->pubDate;
                            $article->topic = $topic;

                            // Exclude images from the description
                            $article->description = strip_tags($article->description, '<p><a>');
                            $articles[] = $article;
                        }
                    } else {
                        echo 'Unable to fetch RSS feed: ' . $feedUrl . '<br>';
                    }
                }

                // Randomize the order of articles
                shuffle($articles);


                // Pagination settings
                $itemsPerPage = 10;
                $totalItems = count($articles);
                $totalPages = ceil($totalItems / $itemsPerPage);

// Get the current page from the query parameter
                $currentpage = isset($_GET['page']) ? $_GET['page'] : 1;

// Calculate the starting and ending indices of the current page
                $startIndex = ($currentpage - 1) * $itemsPerPage;
                $endIndex = $startIndex + $itemsPerPage - 1;

// Slice the articles array to get the articles for the current page
                $articlesOnPage = array_slice($articles, $startIndex, $itemsPerPage);
            // Display the aggregated articles
            foreach ($articlesOnPage as $article) {
                echo '<div class="card ">';
                echo '<h6 class="card-header" href="' . $article->link . '">' . $article->topic . '</h6>';
                echo '<div class="card-body">';
                echo '<h3><a class="card-title" href="' . $article->link . '">' . $article->title . '</a></h3>';
                echo '<hr>';
                echo '<p class="card-text">' . $article->description . '</p>';
                echo '<a class="card-text " href="' . $article->link . '"> Read more ... </a>';
                echo '</div>';
                echo '<p class="card-footer "> Published: ' . $article->pubDate . '</p>';
                echo '</div>';
                echo '<br/>';

            }
            }
            ?>

            <!-- Pagination -->
            <nav aria-label="...">
                <ul class="pagination pagination-sm">
                    <?php
                    // Generate pagination links
                    for ($i = 1; $i <= $totalPages; $i++) {
                        $isActive = $i == $currentpage ? 'active' : '';
                        echo '<li class="page-item ' . $isActive . '"><a class="page-link" href="?page=' . $i . '">' . $i . '</a></li>';
                    }
                    ?>
                </ul>
            </nav>
                <!-- Pagination -->


        </div>

        <!-- Sidebar Widgets Column -->
        <?php include('includes/sidebar.php'); ?>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
<?php include('includes/footer.php'); ?>


<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</head>
</body>

</html>
