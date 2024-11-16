/**
 * 
 * @On(event = { "CREATE" }, entity = "incidentapp07Srv.Incidents")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
    const { Incidents } = cds.entities;
    const { customerEmail } = request.data;

    if (!customerEmail) {
        return request.error(400, 'Customer email is required.');
    }

    // Get the current date
    const currentDate = new Date();
    currentDate.setHours(0, 0, 0, 0);

    // Get the next date
    const nextDate = new Date(currentDate);
    nextDate.setDate(nextDate.getDate() + 1);

    // Query to count incidents created by the customer today
    const incidents = await SELECT.from(Incidents)
        .where({
            customerEmail: customerEmail,
            createdAt: { '>=': currentDate, '<': nextDate }
        });

    if (incidents.length >= 2) {
        return request.error(400, 'Customers can create only two incidents per day.');
    }

    // Proceed with the creation of the incident
};