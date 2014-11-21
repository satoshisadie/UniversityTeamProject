<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        CourseUp
                    </a>
                </div>

                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="#">Courses</a></li>
                        <li><a href="#">Specialisation</a></li>
                        <li><a href="#">Teachers</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">More<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="#">About us</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">Contacts</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">Help</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <#if userName??>
                            <li class="active"><a href="#">${userName}</a></li>
                        <#else>
                            <li><a href="/login/">Sign in</a></li>
                            <li><a href="/registration/">Sign up</a></li>
                        </#if>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>