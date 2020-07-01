
// new Date(año_num,mes_num,dia_num
//         [,hor_num,min_num,seg_num,mils_num])

function updateRange({start, end}, activities){
    let startDate = eventDateToDate(start,0,0);
    let endDate = eventDateToDate(end,23,59);
    console.log("UpdateRange", start, end);

    return activities.filter( activity => {
        let initDate = getActivityInitDate(activity);
        return initDate >= startDate && initDate < endDate;
    }).map(getActivityEvent);
}

function goToActivity({ event }){
    window.location.assign("/activityTemplate/details/" + event.activityId);
}

function getEventColor(event){
    return event.color;
}

function getActivityEvent(activity){
    const colors = ["#957dad","#c893b1","#f9bbba","#fccdba","#ffffba","#baffc9","#bae1ff","#84b4c8","#d7e7a9"];

    let duration = activity.duration;
    let name = activity.name;
    let templateId = activity.templateId;
    let color = colors[templateId % colors.length];

    let start = getActivityInitDate(activity);
    let end = new Date(start.valueOf()).setMinutes(start.getMinutes() + duration);

    return {name: name, start: start, end: end, color: color, timed: true, activityId: templateId};
}

function getActivityInitDate(activity){
    let date = activity.date;
    let time = activity.time;

    return new Date(date.year, date.monthValue - 1, date.dayOfMonth,
        time.hour, time.minute);
}

function eventDateToDate(date, hours, minutes){
    return new Date(date.year, date.month - 1, date.day, hours, minutes);
}

window.updateRange = updateRange;
window.goToActivity = goToActivity;
window.getEventColor = getEventColor;