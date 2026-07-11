using AgencyManagement.API.Models.Enums;

namespace AgencyManagement.API.Models;

public class Worker
{
    public int WorkerId { get; set; }

    public string FirstName { get; set; } = string.Empty;

    public string LastName { get; set; } = string.Empty;

    public string Email { get; set; } = string.Empty;

    public string PhoneNumber { get; set; } = string.Empty;

    public WorkerStatus Status { get; set; } = WorkerStatus.Active;

    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;

    public DateTime? EmploymentEndDate { get; set; }

    public string? EmploymentEndReason { get; set; }
}