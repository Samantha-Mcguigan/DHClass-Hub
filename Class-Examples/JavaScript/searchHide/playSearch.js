/* 2016-11-18 ebb: revised from Stacey Triplette's JavaScript Ex 1 homework, 
 * originally adapted from http://www.w3schools.com/howto/howto_js_filter_table.asp */

window.addEventListener('DOMContentLoaded', init, false);

function init() {
var searchBox = document.getElementById("SearchInput")    
{searchBox.addEventListener("keyup", SearchFunction, false)};        
}

function SearchFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("SearchInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("PlaysTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
/* display values to experiment with: Try 
 * block */
 /* inline */
 /* none */
 /* visibility "hidden" or display "hidden" */
