$(document).ready(function () {

    function StudentViewModel() {
        var self = this;

        self.email = ko.observable('').extend({
            required: true,
            email: true
        });
        self.login = ko.observable('').extend({ required: true });
        self.password = ko.observable('').extend({ required: true });
        self.confirmPassword = ko.observable('').extend({
            required: true,
            validation: {
                validator: function (value) {
                    return value === self.password();
                },
                message: 'This field must be equal to password'
            }
        });

        self.errors = ko.validation.group(self);

        self.newStudent = function () {
            if (self.errors().length) {
                self.errors.showAllMessages();
                return;
            }

            $.ajax({
                url: '/new-student',
                type: 'POST',
                data: {
                    studentJson: ko.toJSON(self)
                }
            }).done(function () {
                window.location = '/sign-in';
            })
        }
    }

    var studentViewModel = new StudentViewModel();
    ko.applyBindings(studentViewModel, document.getElementById('student-form'));

    function TeacherViewModel() {
        var self = this;

        self.email = ko.observable('').extend({
            required: true,
            email: true
        });
        self.login = ko.observable('').extend({ required: true });
        self.password = ko.observable('').extend({ required: true });
        self.confirmPassword = ko.observable('').extend({
            required: true,
            validation: {
                validator: function (value) {
                    return value === self.password();
                },
                message: 'This field must be equal to password'
            }
        });
        self.educationalEstablishment = ko.observable('').extend({ required: true });
        self.academicStatus = ko.observable('').extend({ required: true });

        self.errors = ko.validation.group(self);

        self.newTeacher = function () {
            if (self.errors().length) {
                self.errors.showAllMessages();
                return;
            }

            $.ajax({
                url: '/new-teacher',
                type: 'POST',
                data: {
                    teacherJson: ko.toJSON(self)
                }
            }).done(function () {
                window.location = '/sign-in';
            })
        }
    }

    var teacherViewModel = new TeacherViewModel();
    ko.applyBindings(teacherViewModel, document.getElementById('teacher-form'));

    $('.type-student').change(function () {
        $('#student-form').show();
        $('#teacher-form').hide();
    });

    $('.type-teacher').change(function () {
        $('#student-form').hide();
        $('#teacher-form').show();
    });
});