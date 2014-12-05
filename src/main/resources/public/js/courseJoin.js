$(document).ready(function() {
    $('.enroll-button').click(function () {
        $.ajax({
            url: '/student/enroll',
            type: 'POST',
            dataType: 'json',
            data: {
                sessionId: $('select').val(),
                currentUrl: document.URL
            }
        }).done(function (response) {
            if(response.status === "failure") {
                window.location = response.redirectUrl;
            } else {
                coursePageModel.enrolledSessions.push(parseInt($('select').val()));
            }
        });
    });

    function CoursePageModel() {
        var self = this;

        $.ajax({
            url: '/student/get-sessions-with-enrollments',
            type: 'POST',
            dataType: 'json',
            async: false,
            data: {
                courseId: $('.course-id').val()
            }
        }).done(function (response) {
            self.enrolledSessions = ko.observableArray(response);
        });

        self.sessionId = ko.observable();
        self.enrolled = ko.pureComputed(function () {
            return self.enrolledSessions.indexOf(parseInt(self.sessionId())) >= 0
        });
    }

    var coursePageModel = new CoursePageModel();
    ko.applyBindings(coursePageModel);
});