<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                CourseUp
                <#--<img alt="Coursera" src="../img/coursera.png">-->
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
                        <li><a href="#">About us</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Contacts</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Help</a></li>
                    </ul>
                </li>
            </ul>


            <ul class="nav navbar-nav navbar-right">
            <#if userName?has_content>
                <li class="active"><a href="#">${userName}</a></li>
            <#else>
                <li><a href="#">Sign in</a></li>
                <li><a href="#">Sign up</a></li>
            </#if>

            </ul>
        </div>
    </div>

</nav>