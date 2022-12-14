<?
/**
 * Performs the binary search over
 * sorted array
 *
 * It should perform this operation in O(logn)
 */
function binary_search(array $sortedArray, $searchElement) {
  // Check if array is sorted
  $min_index = 0;
  $max_index = count($sortedArray) - 1;
  //echo "Size of the array: " . count($sortedArray). "<br>";
  while ($min_index <= $max_index) {
    // Get the decimal value as bitwise operator operates only on integer value.
    $currentIndex = ($min_index + $max_index ) / 2 | 0; 
    $currentElement = $sortedArray[$currentIndex];
    if ($currentElement == $searchElement) {
      return TRUE;
    } else if ($currentElement < $searchElement) {
      $min_index = $currentIndex + 1;
    } else if ($currentElement > $searchElement) {
      $max_index = $currentIndex -1;
    }
  }
  return FALSE;
}

$array = [1,3,5,9,10,11,12,14,15,16,17,18,19,20,21,22];
$searchElement = 14;
binary_search($array, $searchElement);
?>