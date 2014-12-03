$(document).ready(function () {

    function SignInViewModel() {
        var self = this;

        self.login = ko.observable('').extend({ required: true });
        self.password = ko.observable('').extend({ required: true });

        self.signInFailed = ko.observable(false);
        self.errors = ko.validation.group(self);

        self.signIn = function () {
            if (self.errors().length) {
                self.errors.showAllMessages();
                return;
            }

            $.ajax({
                url: '/login',
                type: 'POST',
                dataType: 'JSON',
                data: {
                    signInJson: ko.toJSON(self)
                }
            }).done(function (response) {
                if (response.status === 'success') {
                    window.location = response.redirectUrl || '/';
                } else {
                    self.signInFailed(true);
                }
            })
        }
    }

    var signInModel = new SignInViewModel();
    ko.applyBindings(signInModel);
});
