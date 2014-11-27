<div class="row">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="col-md-8 col-md-offset-2">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/">CourseUp</a>
                </div>

                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="#">Courses</a></li>
                        <li><a href="#">Specialisation</a></li>
                        <li><a href="#">Teachers</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">More<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="/about-us">About us</a></li>
                                <li class="divider"></li>
                                <li><a href="/contacts">Contacts</a></li>
                                <li class="divider"></li>
                                <li><a href="/help">Help</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <#if user??>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.login}<span
                                        class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <#if user.type == "student">
                                        <li><a href="/student/courses">Courses</a></li>
                                    <#elseif user.type == "teacher">
                                        <li><a href="/teacher/courses/">Courses</a></li>
                                    </#if>
                                    <li class="divider"></li>
                                    <li><a href="/profile">Profile</a></li>
                                    <li class="divider"></li>
                                    <li><a href="http://localhost:8085/log-out">Log-out</a></li>
                                </ul>
                            </li>
                        <#else>
                            <li><a href="/sign-in">Sign in</a></li>
                            <li><a href="/sign-up">Sign up</a></li>
                        </#if>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>