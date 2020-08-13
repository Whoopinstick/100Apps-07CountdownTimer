import Foundation

let calendar = Calendar.current
let rightNow = Date()


//Create Date from components
let dateComponents = DateComponents(calendar: calendar, year: 1998, month: 6, day: 11)
let composedDate = calendar.date(from: dateComponents)


//Get components
let componentsFromRightNow = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: rightNow)
let dayOfWeek = calendar.component(.weekday, from: rightNow)


//Adding a component to a date (like 10 days away)
let tenDaysFromNow = calendar.date(byAdding: .day, value: 10, to: rightNow)



//Get beginning of component
let beginningOfDay = calendar.dateInterval(of: .day, for: rightNow)?.start


//Time intervals between two dates
let monthInterval = calendar.dateInterval(of: .month, for: rightNow)
let timePeriod = calendar.dateComponents([.minute], from: monthInterval!.start, to: monthInterval!.end)
let minutesInMonth = timePeriod.minute



//Days since our original date (composedDate)
let aVeryLongTime = calendar.dateComponents([.day], from: composedDate!, to: rightNow).day


