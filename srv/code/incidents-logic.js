/**
 * 
 * @On(event = { "CREATE" }, entity = "incidentapp07Srv.Incidents")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
  const { Incidents } = cds.entities;

  // Retrieve the ID of the incident being updated
  const incidentId = request.data.ID;

  if (!incidentId) {
    return; // No ID provided, nothing to check
  }

  // Fetch the current status of the incident
  const incident = await SELECT.one.from(Incidents).where({ ID: incidentId });

  if (!incident) {
    return; // Incident not found, nothing to check
  }

  // Check if the status is closed (case insensitive)
  if (incident.status && incident.status.toLowerCase() === 'closed') {
    request.reject(400, 'Modifications to closed incidents are not allowed.');
  }
};