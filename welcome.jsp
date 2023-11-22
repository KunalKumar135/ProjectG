<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@import url();
  body {
    font-family: Arial, sans-serif;
	background: #f2f2f2;
	font-family: 'Open Sans', sans-serif;
  }
  .search-container, .searchButton,i{
    position: relative;
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
  width: 30%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  }
  .search-input, .searchButton{
    width: 100%;
    padding: 10px;
    font-size: 16px;
    width: 100%;
  border: 3px solid #00B4CC;
  border-right: none;
  padding: 5px;
  height: 20px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #9DBFAF;
  }
  .search-input:focus{
  color: #00B4CC;
}
.searchButton{
	left: 450px;
}
i{
	left: 16px;
	color:#f2f2f2;
}
.searchButton {
  width: 40px;
  height: 36px;
  border: 1px solid #00B4CC;
  background: #00B4CC;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
}
  .suggestions {
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    background-color: white;
    border: 1px solid #ccc;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    display: none;
  }
  .suggestion-item {
    padding: 10px;
    cursor: pointer;
    transition: background-color 0.2s;
  }
  .suggestion-item:hover {
    background-color: #f2f2f2;
  }
</style>
</head>
<body>
  <div class="search-container">
  <form action="Search1.jsp" method = "post">
	    <input type="text" class="search-input" id="searchInput" name = "searchInput" placeholder="Search..." autocomplete = "off" >
    <button type="submit" class="searchButton" >
    <i class="fa fa-search"></i>
    </button>
  </form>
    <div class="suggestions" id="suggestionsContainer">
      <!-- Suggestions will be added here dynamically -->
    </div>
  </div>

  <script>
    const searchInput = document.getElementById("searchInput");
    const suggestionsContainer = document.getElementById("suggestionsContainer");

    const suggestions = ["py", "python", "c", "c programing", "java", "Orange", "Peach", "Pear"];

    searchInput.addEventListener("input", () => {
      const userInput = searchInput.value.toLowerCase();
      const filteredSuggestions = suggestions.filter(suggestion =>
        suggestion.toLowerCase().includes(userInput)
      );

      suggestionsContainer.innerHTML = "";
      if (userInput.length > 0) {
        filteredSuggestions.forEach(suggestion => {
          const suggestionItem = document.createElement("div");
          suggestionItem.className = "suggestion-item";
          suggestionItem.textContent = suggestion;
          suggestionItem.addEventListener("click", () => {
            searchInput.value = suggestion;
            suggestionsContainer.innerHTML = "";
          });
          suggestionsContainer.appendChild(suggestionItem);
        });

        suggestionsContainer.style.display = "block";
      } else {
        suggestionsContainer.style.display = "none";
      }
    });

    document.addEventListener("click", event => {
      if (!suggestionsContainer.contains(event.target) && event.target !== searchInput) {
        suggestionsContainer.style.display = "none";
      }
    });
  </script>
</body>
</html>
