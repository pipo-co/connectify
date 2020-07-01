
// new Date(año_num,mes_num,dia_num
//         [,hor_num,min_num,seg_num,mils_num])

function updateRange({start, end}, activities){
    let startDate = eventDateToDate(start);
    let endDate = eventDateToDate(end);

    return activities.filter( activity => {
        let initDate = getActivityInitDate(activity);
        return initDate >= startDate && initDate < endDate;
    }).map(getActivityEvent);
}

function getActivityEvent(activity){
    let duration = activity.duration;
    let name = activity.name;

    let start = getActivityInitDate(activity);
    let end = new Date(start.valueOf()).setMinutes(start.getMinutes() + duration);

    return {name: name, start: start, end: end};
}

function getActivityInitDate(activity){
    let date = activity.date;
    let time = activity.time;

    return new Date(date.year, date.monthValue - 1, date.dayOfMonth,
        time.hour, time.minute);
}

function eventDateToDate(date){
    return new Date(date.year, date.month, date.day, date.hour, date.minute);
}

window.updateRange = updateRange;