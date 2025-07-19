function createFDCalendarEvents() {
    const sheetName = "Sheet1"; // 🔧 change to your actual sheet name
    const sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName(sheetName);
    const data = sheet.getDataRange().getValues();

    // 🔷 Get or create 'Investments' calendar
    const calendarName = "Investments";
    let calendar = CalendarApp.getCalendarsByName(calendarName)[0];

    if (!calendar) {
        calendar = CalendarApp.createCalendar(calendarName);
    }

    // 🔷 Loop through FD data (skip header)
    for (let i = 1; i < data.length; i++) {
        const row = data[i];

        // 🔧 Adjust column indices based on your sheet structure
        const status = row[9];
        const bank = row[11];
        const principal = row[2];
        const interest = row[3];
        const tenure_years = row[4];
        const tenure_months = row[5];
        const tenure_days = row[6];
        const maturityAmt = row[8];
        const maturityDateStr = row[7]; // assuming End Date in 'dd-mm-yyyy' or 'yyyy-mm-dd' format

        if (!status || status.toLowerCase() !== "active") {
            continue;
        }

        // 🔷 Parse maturity date safely
        let maturityDate;
        if (typeof maturityDateStr === 'string') {
            const parts = maturityDateStr.split("-");
            if (parts[0].length == 4) { // yyyy-mm-dd
                maturityDate = new Date(parts[0], parts[1] - 1, parts[2]);
            } else { // dd-mm-yyyy
                maturityDate = new Date(parts[2], parts[1] - 1, parts[0]);
            }
        } else if (maturityDateStr instanceof Date) {
            maturityDate = maturityDateStr;
        } else {
            continue; // skip invalid date
        }

        // 🔷 Define event details
        const title = `FD Maturity - ${bank} - ₹${maturityAmt}`;
        const description = `Principal: ₹${principal}\nMaturity: ₹${maturityAmt}\nInterest: ${interest}\nTenure: ${tenure_years} years ${tenure_months} months ${tenure_days} days`;

        // 🔷 Check for existing event on same date with same title to avoid duplicates
        const existingEvents = calendar.getEventsForDay(maturityDate);
        let duplicate = false;
        for (const event of existingEvents) {
            if (event.getTitle() === title) {
                duplicate = true;
                break;
            }
        }
        if (duplicate) continue;

        // 🔷 Create all-day event
        const event = calendar.createAllDayEvent(title, maturityDate, { description: description });

        // 🔷 Add multiple popup reminders
        event.addPopupReminder(60 * 24 * 60); // 2 months before
        event.addPopupReminder(60 * 24 * 30); // 1 month before
        event.addPopupReminder(60 * 24 * 7);  // 1 week before
        event.addPopupReminder(60 * 24);    // 1 day before
    }

    SpreadsheetApp.getUi().alert('✅ All FD maturity events created with multiple reminders.');
}
