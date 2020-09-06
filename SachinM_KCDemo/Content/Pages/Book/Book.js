$(document).ready(function () {
    getBookList();
});
//To get the book list
var getBookList = function () {
    $.ajax({
        url: "/Book/GetBookList",
        type:"post",
        contentType:"application/json utf-8",
        datatype: "JSON",
        success: function (response) {           
            $("#tblBook").empty();
            $.each(response, function (elementType, elementValue) {
                var html = "<div class='col-sm-3'><div class='card'><div class='card-body'>";
                html += "<a href=/Book/Details/" + elementValue.BookID + "><img class='card-img-top' src='../Content/Images/Book/" + elementValue.Photo + "' alt='" + elementValue.Name + "'></a>";
                html += "<h5 class='card-title'>" + elementValue.Name + "</h5><p class='card-text'>ISBN: " + elementValue.ISBN + "</a></p><p class='card- text'>By -" + elementValue.Author + "</p>"
                html += " <a href=/Book/Details/" + elementValue.BookID + " class='btn btn-primary'>See Details</a>";
                html += "</div></div></div>";
                $("#tblBook").append(html);
            });
        }
    });
}

//To get Book Details
var getBookDetails = function (id) {
    var model = { ID:id };
    $.ajax({
        url: "/Book/GetBookDetails",
        type: "post",
        contentType: "application/json utf-8",
        data: JSON.stringify(model),
        datatype: "JSON",
        success: function (response) {

        }
    });
}

