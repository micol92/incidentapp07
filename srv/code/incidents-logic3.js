/**
 * 
 * @Before(event = { "CREATE" }, entity = "incidentapp07Srv.Incidents")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
  const { Incidents } = cds.entities;

  // Extract customer email from the request data
  const customerEmail = request.data.customerEmail;
  if (!customerEmail) {
    request.reject(400, 'Customer email is required.');
    return;
  }

  // Get the current date in YYYY-MM-DD format
  const currentDate = new Date().toISOString().split('T')[0];

  // Query to count the number of incidents created by the customer today
  const incidentsCount = await SELECT.one.from(Incidents)
    .columns({ count: 'count(*)' })
    .where({ customerEmail, createdAt: { '>=': `${currentDate}T00:00:00Z`, '<=': `${currentDate}T23:59:59Z` } });

  if (incidentsCount && incidentsCount.count >= 2) {
    request.reject(400, 'Customers can only create up to 2 incidents per day.');
  }
}