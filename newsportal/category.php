<?php
global $con;
session_start();
error_reporting(0);
include('includes/config.php');

?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> IT News Portal | Category Page</title>

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

            <!-- Blog Post -->
            <?php
            if ($_GET['catid'] != '') {
                $_SESSION['catid'] = intval($_GET['catid']);
                $_SESSION['catname'] =$_GET['catname'];
            }



            //            $query = mysqli_query($con, "select tblposts.id as pid,tblposts.PostTitle as posttitle,tblposts.PostImage,tblcategory.CategoryName as category,tblsubcategory.Subcategory as subcategory,tblposts.PostDetails as postdetails,tblposts.PostingDate as postingdate,tblposts.PostUrl as url from tblposts left join tblcategory on tblcategory.id=tblposts.CategoryId left join  tblsubcategory on  tblsubcategory.SubCategoryId=tblposts.SubCategoryId where tblposts.CategoryId='" . $_SESSION['catid'] . "' and tblposts.Is_Active=1 order by tblposts.id desc LIMIT $offset, $no_of_records_per_page");
            $query = mysqli_query($con, "SELECT tblsubcategory.SubCatDescription AS feedurl, tblsubcategory.SubCategory AS subcategory FROM tblsubcategory left join  tblcategory on  tblcategory.Id=tblsubcategory.CategoryId where tblsubcategory.CategoryId ='" . $_SESSION['catid'] . "' and tblsubcategory.Is_Active=1 ");

            $rowcount = mysqli_num_rows($query);
            if ($rowcount == 0) {
                echo "No record found";
            }
            else {
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
                $no_of_records_per_page = 6;
                $total_rows = count($articles);
                $total_pages = ceil($total_rows / $no_of_records_per_page);

                // Get the current page from the query parameter
                $pageno = isset($_GET['pageno']) ? $_GET['pageno'] : 1;

                // Ensure the current page is within valid bounds
                $pageno = max(1, min($pageno, $total_pages));

                // Calculate the offset and limit for the current page
                $offset = ($pageno - 1) * $no_of_records_per_page;
                $limit = $no_of_records_per_page;

                // Slice the articles array to get the articles for the current page
                $articlesOnPage = array_slice($articles, $offset, $limit);
    ?>

                <h1><?php echo $_SESSION['catname'];?></h1>
                    <?php
                // Display the aggregated articles
                foreach ($articlesOnPage as $article) {
                    echo '<div class="card ">';
                    echo '<h6 class="card-header" href="' . $article->link . '">' . $article->topic . '</h6>';
                    echo '<div class="card-body">';
                    echo '<h3><a class="card-title" href="' . $article->link . '">' . $article->title . '</a></h3>';
                    echo '<hr>';
                    echo '<p class="card-text">' . substr($article->description, 0, 600) . '</p>';
                    echo '<a class="card-text " href="' . $article->link . '">... Read more  </a>';
                    echo '</div>';
                    echo '<p class="card-footer "> Published: ' . $article->pubDate . '</p>';
                    echo '</div>';
                    echo '<br/>';

                }
                ?>

                <ul class="pagination justify-content-center mb-4">
                    <li class="page-item"><a href="?pageno=1" class="page-link">First</a></li>
                    <li class="<?php if ($pageno <= 1) {
                        echo 'disabled';
                    } ?> page-item">
                        <a href="<?php if ($pageno <= 1) {
                            echo '#';
                        } else {
                            echo "?pageno=" . ($pageno - 1);
                        } ?>" class="page-link">Prev</a>
                    </li>
                    <li class="<?php if ($pageno >= $total_pages) {
                        echo 'disabled';
                    } ?> page-item">
                        <a href="<?php if ($pageno >= $total_pages) {
                            echo '#';
                        } else {
                            echo "?pageno=" . ($pageno + 1);
                        } ?> " class="page-link">Next</a>
                    </li>
                    <li class="page-item"><a href="?pageno=<?php echo $total_pages; ?>" class="page-link">Last</a></li>
                </ul>
            <?php } ?>


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
