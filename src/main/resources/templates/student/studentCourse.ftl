<#assign course = courseById[session.courseId?string]>
<#assign teacher = teacherById[course.teacherId?string]>
<div class="student-course-session media" style="margin-bottom: 30px;">
    <a class="media-left">
        <#if session.img??>
            <img src="${session.img}" style="max-height: 100px; max-width: 100px;">
        </#if>
        <img src="/img/avatar.jpg" style="max-height: 100px; max-width: 100px;">
    </a>

    <div class="media-body">
        <h4 class="media-heading">${course.name}</h4>
        <span>${teacher.educationalEstablishment!}</span>

        <div class="buttons-container" style="margin-top: 15px;">
            <a class="course-info" href="../course/${course.id?c}">course info</a>
            <#if session.endDate gte .now?date>
                <span>|</span>
                <a class="un-enroll" href="/student/courses/${session.id?c}">un-enroll</a>
            </#if>
        </div>
    </div>

    <#if session.startDate lte .now?date>
        <a class="go-to-class btn btn-success" style="float: right; margin-top: -50px;" href="/student/lessons/?sessionId=${session.id?c}">Go to class</a>
    </#if>

    <input class="id" type="hidden" value="${session.id?c}">
</div>