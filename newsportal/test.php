<?php
// Define the available topics and their corresponding RSS feed URLs
$topics = array(
    'Politics' => 'https://abcnews.go.com/abcnews/usheadlines',
);

// Aggregate all RSS feeds
$articles = array();

foreach ($topics as $topic => $feedUrl) {
    $xml = simplexml_load_file($feedUrl);

    if ($xml) {
        foreach ($xml->channel->item as $item) {
            $article = new stdClass();
            $article->title = (string) $item->title;
            $article->link = (string) $item->link;
            $article->description = (string) $item->description;
            $article->pubDate = (string) $item->pubDate;
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
?>

<!DOCTYPE html>
<html>
<head>
    <title>RSS Feed Aggregator</title>
    <style>
        h2 {
            margin-bottom: 5px;
        }

        p {
            margin-top: 5px;
        }

        .topic {
            font-weight: bold;
            margin-top: 20px;
        }

        .pagination {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h1>RSS Feed Aggregator</h1>

<?php
// Display the articles for the current page
foreach ($articlesOnPage as $article) {
    echo '<div class="topic">' . $article->topic . '</div>';
    echo '<h2><a href="' . $article->link . '">' . $article->title . '</a></h2>';
    echo '<p>' . $article->description . '</p>';
    echo '<p>Published on: ' . $article->pubDate . '</p>';
    echo '<hr>';
}
?>

<!-- Pagination links -->
<div class="pagination">
    <?php
    // Generate pagination links
    for ($i = 1; $i <= $totalPages; $i++) {
        $isActive = $i == $currentpage ? 'active' : '';
        echo '<a href="?page=' . $i . '" class="' . $isActive . '">' . $i . '</a> ';
    }
    ?>
</div>
</body>
</html>
