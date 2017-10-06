$(document).on('turbolinks:load', function() {
    // document attached events can be applied to future tag, which can be loaded after running these statements.
    $(document).on('mouseenter', '[highlight]', function() {
        $(this).addClass("blog-highlight");
    }).on('mouseleave', '[highlight]', function() {
        $(this).removeClass("blog-highlight");
    });

    if ($(".blogs.show").length > 0) {
        // $("[highlight]").hover(function() {
        //   $(this).addClass("blog-highlight");
        // }, function() {
        //   $(this).removeClass("blog-highlight");
        // });

        let blogId1 = $("#blogId").val();

        $.get('/blogs/' + blogId1 + '/comments').done(function() {

        }).fail(function() {
            console.log('errors');
        });
    }
});